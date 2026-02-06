import 'package:ai_chat_app/core/errors/failures.dart';
import 'package:ai_chat_app/features/chat/domain/entities/message.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, Message>> sendMessage(String message);

  Future<Either<Failure, Stream<String>>> sendMessageStream(String message);
}
