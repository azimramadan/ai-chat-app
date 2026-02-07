import 'package:ai_chat_app/features/chat/data/models/message_model/message_model.dart';
import 'package:ai_chat_app/features/chat/domain/entities/message.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';

abstract class ChatRemoteDataSource {
  Future<MessageModel> sendMessage(List<Message> messages);

  Future<Stream<String>> sendMessageStream(List<Message> messages);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  DioClient dioClient;
  ChatRemoteDataSourceImpl({required this.dioClient});
  @override
  Future<MessageModel> sendMessage(List<Message> messages) async {
    final response = await dioClient.post(
      ApiConstants.generateContent,
      data: {
        "contents": messages.map((message) {
          return {
            "role": message.sender == MessageSender.user ? "user" : "model",
            "parts": [
              {"text": message.content},
            ],
          };
        }).toList(),
      },
      queryParameters: {ApiConstants.apiKeyParam: ApiConstants.apiKey},
    );

    return MessageModel.fromJson(response);
  }

  @override
  Future<Stream<String>> sendMessageStream(List<Message> messages) async {
    // TODO: Implement streaming for real-time responses
    // This will use Server-Sent Events (SSE) or WebSocket
    // For now, throw unimplemented exception
    throw UnimplementedError('Streaming not yet implemented');
  }
}
