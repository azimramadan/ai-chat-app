import 'package:ai_chat_app/features/chat/domain/entities/message.dart';
import 'package:ai_chat_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessageUseCase sendMessageUseCase;

  final List<Message> _messages = [];

  ChatCubit({required this.sendMessageUseCase}) : super(ChatInitial());

  List<Message> get messages => List.unmodifiable(_messages);

  Future<void> sendMessage(String messageText) async {
    if (state is ChatLoading) return;

    final userMessage = Message(
      content: messageText,
      sender: MessageSender.user,
    );

    _messages.add(userMessage);

    emit(ChatLoading(List.from(_messages)));

    final result = await sendMessageUseCase.call(
      SendMessageParams(message: messageText, messages: _messages),
    );

    result.fold(
      (failure) {
        emit(
          ChatError(
            message: failure.message,
            previousMessages: List.from(_messages),
          ),
        );
      },
      (aiMessage) {
        _messages.add(aiMessage);
        emit(ChatSuccess(List.from(_messages)));
      },
    );
  }

  Future<void> retryLastMessage() async {
    if (state is! ChatError) return;

    final lastUserMessage = _messages.lastWhere(
      (msg) => msg.isUser,
      orElse: () => Message(content: '', sender: MessageSender.user),
    );

    if (lastUserMessage.content.isEmpty) return;

    await sendMessage(lastUserMessage.content);
  }
}
