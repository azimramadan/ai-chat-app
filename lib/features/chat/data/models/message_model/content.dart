import 'part.dart';

class Content {
  List<Part>? parts;
  String? role;

  Content({this.parts, this.role});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    parts: (json['parts'] as List<dynamic>?)
        ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
        .toList(),
    role: json['role'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'parts': parts?.map((e) => e.toJson()).toList(),
    'role': role,
  };
}
