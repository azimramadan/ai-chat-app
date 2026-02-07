import 'package:ai_chat_app/core/di/injection_container.dart';
import 'package:ai_chat_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/chat_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChatCubit>(),
      child: Scaffold(appBar: const ChatAppBar(), body: const ChatBody()),
    );
  }
}
