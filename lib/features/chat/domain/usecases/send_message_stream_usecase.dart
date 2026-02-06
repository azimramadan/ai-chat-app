import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/chat_repository.dart';
import 'send_message_usecase.dart';

class SendMessageStreamUseCase
    extends UseCase<Stream<String>, SendMessageParams> {
  final ChatRepository repository;

  SendMessageStreamUseCase(this.repository);

  @override
  Future<Either<Failure, Stream<String>>> call(SendMessageParams params) async {
    if (params.message.trim().isEmpty) {
      return const Left(ValidationFailure('Message cannot be empty'));
    }

    if (params.message.length > params.maxLength) {
      return Left(
        ValidationFailure(
          'Message is too long. Maximum ${params.maxLength} characters allowed.',
        ),
      );
    }

    return await repository.sendMessageStream(params.message);
  }
}
