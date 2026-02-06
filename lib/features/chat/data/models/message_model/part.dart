class Part {
  String? text;
  String? thoughtSignature;

  Part({this.text, this.thoughtSignature});

  factory Part.fromJson(Map<String, dynamic> json) => Part(
    text: json['text'] as String?,
    thoughtSignature: json['thoughtSignature'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'text': text,
    'thoughtSignature': thoughtSignature,
  };
}
