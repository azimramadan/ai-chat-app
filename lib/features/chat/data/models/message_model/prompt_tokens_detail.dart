class PromptTokensDetail {
  String? modality;
  int? tokenCount;

  PromptTokensDetail({this.modality, this.tokenCount});

  factory PromptTokensDetail.fromJson(Map<String, dynamic> json) {
    return PromptTokensDetail(
      modality: json['modality'] as String?,
      tokenCount: json['tokenCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'modality': modality,
    'tokenCount': tokenCount,
  };
}
