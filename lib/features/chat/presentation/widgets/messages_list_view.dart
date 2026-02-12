import 'package:ai_chat_app/features/chat/domain/entities/message.dart';
import 'package:ai_chat_app/features/chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class MessagesListView extends StatefulWidget {
  final List<Message> messages;
  final bool isLoading;
  const MessagesListView({
    super.key,
    required this.messages,
    this.isLoading = false,
  });

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant MessagesListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.messages.length != oldWidget.messages.length) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(top: 16, bottom: 100),
      itemCount: widget.isLoading
          ? widget.messages.length + 1
          : widget.messages.length,
      itemBuilder: (context, index) {
        if (index >= widget.messages.length) {
          return LoadingMessageBubble();
        }
        final message = widget.messages[index];
        return MessageBubble(message: message);
      },
    );
  }
}
