import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String content;
  final MessageSender sender;

  const Message({required this.content, required this.sender});

  bool get isUser => sender == MessageSender.user;
  bool get isAI => sender == MessageSender.model;

  Message copyWith({String? content, MessageSender? sender}) {
    return Message(
      content: content ?? this.content,
      sender: sender ?? this.sender,
    );
  }

  @override
  List<Object?> get props => [content, sender];

  @override
  String toString() {
    return 'Message(content: $content, sender: $sender)';
  }
}

enum MessageSender { user, model }
