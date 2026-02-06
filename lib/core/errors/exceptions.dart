abstract class AppException implements Exception {
  const AppException(this.message);
  final String message;

  @override
  String toString() => message;
}

abstract class NetworkException extends AppException {
  const NetworkException(super.message);
}

class NoInternetException extends NetworkException {
  const NoInternetException([super.message = 'No internet connection']);
}

class TimeoutException extends NetworkException {
  const TimeoutException([super.message = 'Request timeout']);
}

class ServerException extends NetworkException {
  const ServerException([super.message = 'Server error occurred']);

  factory ServerException.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return const ServerException('Bad request');
      case 401:
        return const ServerException('Unauthorized');
      case 403:
        return const ServerException('Forbidden');
      case 404:
        return const ServerException('Not found');
      case 500:
        return const ServerException('Internal server error');
      case 503:
        return const ServerException('Service unavailable');
      default:
        return ServerException('Server error: $statusCode');
    }
  }
}

class GenericNetworkException extends NetworkException {
  const GenericNetworkException([super.message = 'Network error occurred']);
}

// class CacheException extends AppException {
//   const CacheException([super.message = 'Cache error occurred']);
// }
