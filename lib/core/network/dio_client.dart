import 'dart:io';

import 'package:ai_chat_app/core/errors/exceptions.dart';
import 'package:ai_chat_app/core/network/dio_interceptor.dart';
import 'package:ai_chat_app/core/network/network_client.dart';
import 'package:dio/dio.dart';

class DioClient implements INetworkClient {
  DioClient({required String baseUrl, Duration? timeout})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: timeout ?? const Duration(seconds: 30),
          receiveTimeout: timeout ?? const Duration(seconds: 30),
          sendTimeout: timeout ?? const Duration(seconds: 30),

          //If headers are static, add them in BaseOptions;
          // if they are dynamic (like tokens), add them using an Interceptor.
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ) {
    _setupInterceptors();
  }

  final Dio _dio;
  static const _maxRetries = 3;
  static const _retryDelay = Duration(seconds: 2);

  void _setupInterceptors() {
    _dio.interceptors.add(DioLoggingInterceptor());
  }

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _withRetry(
      () => _executeRequest(
        () => _dio.get<Map<String, dynamic>>(
          endpoint,
          queryParameters: queryParameters,
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> _executeRequest(
    Future<Response<Map<String, dynamic>>> Function() request,
  ) async {
    try {
      final response = await request();

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data ?? {};
      }

      throw ServerException.fromStatusCode(response.statusCode ?? 500);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } on SocketException {
      throw const NoInternetException();
    } on TimeoutException {
      throw const TimeoutException();
    } catch (e) {
      throw GenericNetworkException('Unexpected error: $e');
    }
  }

  Future<Map<String, dynamic>> _withRetry(
    Future<Map<String, dynamic>> Function() request,
  ) async {
    int attempts = 0;

    while (attempts < _maxRetries) {
      try {
        return await request();
      } on NetworkException catch (e) {
        attempts++;

        if (e is NoInternetException || e is ServerException) {
          rethrow;
        }

        if (attempts >= _maxRetries) {
          rethrow;
        }

        await Future<void>.delayed(_retryDelay * attempts);
      }
    }

    throw const GenericNetworkException('Max retries reached');
  }

  NetworkException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();

      case DioExceptionType.badResponse:
        return ServerException.fromStatusCode(
          error.response?.statusCode ?? 500,
        );

      case DioExceptionType.cancel:
        return const GenericNetworkException('Request cancelled');

      case DioExceptionType.connectionError:
        return const NoInternetException();

      default:
        return GenericNetworkException('Network error: ${error.message}');
    }
  }

  @override
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _withRetry(
      () => _executeRequest(
        () => _dio.post<Map<String, dynamic>>(
          endpoint,
          data: data,
          queryParameters: queryParameters,
        ),
      ),
    );
  }
}
