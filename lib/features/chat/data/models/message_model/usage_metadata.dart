import 'prompt_tokens_detail.dart';

class UsageMetadata {
  int? promptTokenCount;
  int? candidatesTokenCount;
  int? totalTokenCount;
  List<PromptTokensDetail>? promptTokensDetails;
  int? thoughtsTokenCount;

  UsageMetadata({
    this.promptTokenCount,
    this.candidatesTokenCount,
    this.totalTokenCount,
    this.promptTokensDetails,
    this.thoughtsTokenCount,
  });

  factory UsageMetadata.fromJson(Map<String, dynamic> json) => UsageMetadata(
    promptTokenCount: json['promptTokenCount'] as int?,
    candidatesTokenCount: json['candidatesTokenCount'] as int?,
    totalTokenCount: json['totalTokenCount'] as int?,
    promptTokensDetails: (json['promptTokensDetails'] as List<dynamic>?)
        ?.map((e) => PromptTokensDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    thoughtsTokenCount: json['thoughtsTokenCount'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'promptTokenCount': promptTokenCount,
    'candidatesTokenCount': candidatesTokenCount,
    'totalTokenCount': totalTokenCount,
    'promptTokensDetails': promptTokensDetails?.map((e) => e.toJson()).toList(),
    'thoughtsTokenCount': thoughtsTokenCount,
  };
}
