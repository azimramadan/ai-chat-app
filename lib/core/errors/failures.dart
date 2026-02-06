import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error occurred']);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure([super.message = 'No internet connection']);
}

class GenericNetworkFailure extends Failure {
  const GenericNetworkFailure([super.message = 'Network error occurred']);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = 'Request timeout']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error occurred']);
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure([super.message = 'Invalid input']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unexpected error occurred']);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation error occurred']);
}
