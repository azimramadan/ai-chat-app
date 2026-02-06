import 'package:ai_chat_app/features/chat/domain/entities/message.dart';

import 'candidate.dart';
import 'usage_metadata.dart';

class MessageModel extends Message {
  final List<Candidate>? candidates;
  final UsageMetadata? usageMetadata;
  final String? modelVersion;
  final String? responseId;

  const MessageModel({
    this.candidates,
    this.usageMetadata,
    this.modelVersion,
    this.responseId,
    required super.content,
    required super.sender,
  });

  // factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
  //   candidates: (json['candidates'] as List<dynamic>?)
  //       ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
  //       .toList(),
  //   usageMetadata: json['usageMetadata'] == null
  //       ? null
  //       : UsageMetadata.fromJson(json['usageMetadata'] as Map<String, dynamic>),
  //   modelVersion: json['modelVersion'] as String?,
  //   responseId: json['responseId'] as String?,
  //   content: ,
  //   sender:  ,
  // );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    final candidatesList = json['candidates'] as List<dynamic>?;

    final firstCandidate = candidatesList != null && candidatesList.isNotEmpty
        ? candidatesList.first as Map<String, dynamic>
        : null;

    final contentJson = firstCandidate?['content'] as Map<String, dynamic>?;

    final roleString = contentJson?['role'] as String?; // "model"

    final parts = contentJson?['parts'] as List<dynamic>?;

    final text = parts != null && parts.isNotEmpty
        ? parts.first['text'] as String?
        : null;

    return MessageModel(
      candidates: candidatesList
          ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageMetadata: json['usageMetadata'] == null
          ? null
          : UsageMetadata.fromJson(
              json['usageMetadata'] as Map<String, dynamic>,
            ),
      modelVersion: json['modelVersion'] as String?,
      responseId: json['responseId'] as String?,
      content: text ?? '',
      sender: roleString != null
          ? MessageSender.values.byName(roleString)
          : MessageSender.model,
    );
  }

  Map<String, dynamic> toJson() => {
    'candidates': candidates?.map((e) => e.toJson()).toList(),
    'usageMetadata': usageMetadata?.toJson(),
    'modelVersion': modelVersion,
    'responseId': responseId,
  };
}
