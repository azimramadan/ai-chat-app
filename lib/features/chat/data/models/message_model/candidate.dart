import 'content.dart';

class Candidate {
  Content? content;
  String? finishReason;
  int? index;

  Candidate({this.content, this.finishReason, this.index});

  factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
    finishReason: json['finishReason'] as String?,
    index: json['index'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'content': content?.toJson(),
    'finishReason': finishReason,
    'index': index,
  };
}
