part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState({required this.messages});
  final List<Message> messages;

  @override
  List<Object> get props => [messages];
}

final class ChatInitial extends ChatState {
  const ChatInitial({required super.messages});
}

class ChatLoading extends ChatState {
  const ChatLoading({required super.messages});

  @override
  List<Object> get props => [messages];
}

class ChatSuccess extends ChatState {
  const ChatSuccess({required super.messages});

  @override
  List<Object> get props => [messages];
}

class ChatError extends ChatState {
  final String errorMessage;

  const ChatError({required this.errorMessage, required super.messages});

  @override
  List<Object> get props => [errorMessage, messages];
}
