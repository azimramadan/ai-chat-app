import 'package:ai_chat_app/core/constants/app_assets.dart';
import 'package:ai_chat_app/core/theme/app_colors.dart';
import 'package:ai_chat_app/core/theme/app_text_styles.dart';
import 'package:ai_chat_app/features/chat/domain/entities/message.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/typing_indicator.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          if (!isUser) ...[
            Image.asset(AppAssets.avatarAi, width: 26, height: 26),
            const SizedBox(width: 12),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isUser ? AppColors.primary : AppColors.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: !isUser
                          ? const Radius.circular(16)
                          : Radius.zero,
                      bottomLeft: isUser
                          ? const Radius.circular(16)
                          : Radius.zero,
                      bottomRight: const Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    message.content,
                    style: AppTextStyles.bodyLargeBold.copyWith(
                      color: isUser ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingMessageBubble extends StatelessWidget {
  const LoadingMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(AppAssets.avatarAi, width: 26, height: 26),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const TypingIndicator(), const SizedBox(height: 16)],
            ),
          ),
        ],
      ),
    );
  }
}
