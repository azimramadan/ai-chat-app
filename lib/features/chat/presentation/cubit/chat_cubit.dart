import 'package:ai_chat_app/features/chat/domain/entities/message.dart';
import 'package:ai_chat_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessageUseCase sendMessageUseCase;

  ChatCubit({required this.sendMessageUseCase})
    : super(ChatInitial(messages: []));

  Future<void> sendMessage(String messageText) async {
    if (state is ChatLoading) return;

    final currentMessages = List<Message>.from(state.messages);

    final userMessage = Message(
      content: messageText,
      sender: MessageSender.user,
    );

    currentMessages.add(userMessage);

    emit(ChatLoading(messages: currentMessages));

    final result = await sendMessageUseCase.call(
      SendMessageParams(message: messageText, messages: currentMessages),
    );

    result.fold(
      (failure) {
        emit(
          ChatError(
            errorMessage: failure.message,
            messages: List.from(currentMessages),
          ),
        );
      },
      (aiMessage) {
        final updatedMessages = List<Message>.from(currentMessages)
          ..add(aiMessage);
        emit(ChatSuccess(messages: updatedMessages));
      },
    );
  }

  Future<void> retryLastMessage() async {
    if (state is! ChatError) return;

    final currentMessages = List<Message>.from(state.messages);

    final lastUserIndex = currentMessages.lastIndexWhere((msg) => msg.isUser);

    if (lastUserIndex == -1) return;

    final lastUserMessage = currentMessages[lastUserIndex];

    currentMessages.removeAt(lastUserIndex);

    emit(ChatInitial(messages: currentMessages));

    await sendMessage(lastUserMessage.content);
  }
}
