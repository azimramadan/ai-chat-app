import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/message.dart';
import '../repositories/chat_repository.dart';

class SendMessageUseCase extends UseCase<Message, SendMessageParams> {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  @override
  Future<Either<Failure, Message>> call(SendMessageParams params) async {
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

    return await repository.sendMessage(params.message);
  }
}

class SendMessageParams extends Equatable {
  final String message;
  final int maxLength;

  const SendMessageParams({required this.message, this.maxLength = 2000});

  @override
  List<Object?> get props => [message, maxLength];
}
