import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_datasource.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Message>> sendMessage(String message) async {
    try {
      final messageModel = await remoteDataSource.sendMessage(message);

      return Right(messageModel);
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on GenericNetworkException catch (e) {
      return Left(GenericNetworkFailure(e.message));
    } catch (e) {
      return Left(
        UnexpectedFailure('An unexpected error occurred: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, Stream<String>>> sendMessageStream(String message) {
    // TODO: implement sendMessageStream
    throw UnimplementedError();
  }
}
