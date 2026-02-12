import 'package:ai_chat_app/core/theme/app_colors.dart';
import 'package:ai_chat_app/core/theme/app_text_styles.dart';
import 'package:ai_chat_app/features/chat/domain/entities/message.dart';
import 'package:ai_chat_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/messages_list_view.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/modern_chat_input.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/suggestion_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  bool errorIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is ChatError) {
              setState(() {
                errorIndicator = true;
              });
            }
          },
          builder: (context, state) {
            if (state is ChatLoading) {
              return MessagesListView(
                messages: state.messages,
                isLoading: true,
              );
            }
            if (state is ChatError) {
              return ChatErrorWidget(
                message: state.errorMessage,
                previousMessages: state.messages,
              );
            }
            if (state is ChatSuccess) {
              return MessagesListView(messages: state.messages);
            }
            return SuggestionChips();
          },
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 30,
          child: AbsorbPointer(
            absorbing: errorIndicator,
            child: ModernChatInput(
              onMicrophoneTap: () {},
              onSendMessage: (message) =>
                  context.read<ChatCubit>().sendMessage(message),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatErrorWidget extends StatelessWidget {
  final String message;

  final List<Message> previousMessages;

  const ChatErrorWidget({
    super.key,
    required this.message,
    required this.previousMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: AppColors.error,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 16,
              right: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    message,
                    style: AppTextStyles.bodyLargeBold.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<ChatCubit>().retryLastMessage();
                  },
                  child: Text(
                    'Retry',
                    style: AppTextStyles.bodySmallSecondary.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: MessagesListView(messages: previousMessages)),
      ],
    );
  }
}
