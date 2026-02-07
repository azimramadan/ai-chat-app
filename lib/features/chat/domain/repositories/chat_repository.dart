import 'package:ai_chat_app/core/errors/failures.dart';
import 'package:ai_chat_app/features/chat/domain/entities/message.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, Message>> sendMessage(List<Message> messages);

  Future<Either<Failure, Stream<String>>> sendMessageStream(
    List<Message> messages,
  );
}
