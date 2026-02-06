import 'package:ai_chat_app/features/chat/data/models/message_model/message_model.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';

abstract class ChatRemoteDataSource {
  Future<MessageModel> sendMessage(String message);

  Future<Stream<String>> sendMessageStream(String message);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  DioClient dioClient;
  ChatRemoteDataSourceImpl({required this.dioClient});
  @override
  Future<MessageModel> sendMessage(String message) async {
    final response = await dioClient.post(
      ApiConstants.generateContent,
      data: {
        "contents": [
          {
            "parts": [
              {"text": message},
            ],
          },
        ],
      },
      queryParameters: {ApiConstants.apiKeyParam: ApiConstants.apiKey},
    );

    return MessageModel.fromJson(response);
  }

  @override
  Future<Stream<String>> sendMessageStream(String message) async {
    // TODO: Implement streaming for real-time responses
    // This will use Server-Sent Events (SSE) or WebSocket
    // For now, throw unimplemented exception
    throw UnimplementedError('Streaming not yet implemented');
  }
}
