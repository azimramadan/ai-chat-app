import 'package:flutter_dotenv/flutter_dotenv.dart';

/// API configuration constants
class ApiConstants {
  ApiConstants._();

  static const String baseUrl =
      'https://generativelanguage.googleapis.com/v1beta';

  static const String model = 'gemini-3-flash-preview';

  static final String apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

  static const String apiKeyParam = 'key';

  static const String generateContent = '/models/$model:generateContent';
  static const String streamGenerateContent =
      '/models/$model:streamGenerateContent';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  static const String contentType = 'application/json';
  static const String accept = 'application/json';
}
