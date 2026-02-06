import 'dart:developer';

import 'package:ai_chat_app/features/chat/presentation/pages/widgets/modern_chat_input.dart';
import 'package:ai_chat_app/features/chat/presentation/pages/widgets/suggestion_chips.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SuggestionChips(onSuggestionTap: (suggestion) {}),
        _buildChatInput(),
      ],
    );
  }

  Widget _buildChatInput() {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 30,
      child: ModernChatInput(
        onMicrophoneTap: () {},
        onSendMessage: (message) => log(message),
      ),
    );
  }
}
