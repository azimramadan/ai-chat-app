part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {
  final List<Message> messages;

  const ChatLoading(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatSuccess extends ChatState {
  final List<Message> messages;

  const ChatSuccess(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatError extends ChatState {
  final String message;
  final List<Message> previousMessages;

  const ChatError({required this.message, required this.previousMessages});

  @override
  List<Object> get props => [message, previousMessages];
}
