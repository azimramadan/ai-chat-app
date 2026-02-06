import 'package:ai_chat_app/core/constants/app_assets.dart';
import 'package:ai_chat_app/core/theme/app_colors.dart';
import 'package:ai_chat_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ModernChatInput extends StatefulWidget {
  final ValueChanged<String>? onSendMessage;
  final VoidCallback? onMicrophoneTap;

  const ModernChatInput({super.key, this.onSendMessage, this.onMicrophoneTap});

  @override
  State<ModernChatInput> createState() => _ModernChatInputState();
}

class _ModernChatInputState extends State<ModernChatInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    widget.onSendMessage?.call(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: true,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (_) => _send(),
              style: AppTextStyles.bodyMediumChatAi.copyWith(
                color: AppColors.primary,
              ),
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                hintText: 'Write your message',
                hintStyle: AppTextStyles.bodyMediumChatAi.copyWith(
                  color: AppColors.textHint,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: widget.onMicrophoneTap,
            icon: SvgPicture.asset(AppAssets.microphone),
          ),
          IconButton(
            onPressed: () => _send(),
            icon: SvgPicture.asset(AppAssets.sendIcon),
          ),
        ],
      ),
    );
  }
}
