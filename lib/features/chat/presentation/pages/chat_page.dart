import 'package:ai_chat_app/features/chat/presentation/pages/widgets/chat_app_bar.dart';
import 'package:ai_chat_app/features/chat/presentation/pages/widgets/chat_body.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const ChatAppBar(), body: const ChatBody());
  }
}
