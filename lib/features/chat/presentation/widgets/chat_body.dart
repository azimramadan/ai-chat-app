import 'package:ai_chat_app/core/theme/app_text_styles.dart';
import 'package:ai_chat_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/messages_list_view.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/modern_chat_input.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/suggestion_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return MessagesListView(
                messages: state.messages,
                isLoading: true,
              );
            }
            if (state is ChatError) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.red.shade100,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            state.message,
                            style: AppTextStyles.bodyLargeBold.copyWith(
                              color: Colors.red.shade800,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<ChatCubit>().retryLastMessage();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: MessagesListView(messages: state.previousMessages),
                  ),
                ],
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
          child: ModernChatInput(
            onMicrophoneTap: () {},
            onSendMessage: (message) =>
                context.read<ChatCubit>().sendMessage(message),
          ),
        ),
      ],
    );
  }
}
