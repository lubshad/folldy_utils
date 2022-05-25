// To parse this JSON data, do
//
//     final topicListResponse = topicListResponseFromJson(jsonString);

import 'dart:convert';

List<Topic> topicListResponseFromJson(dynamic str) =>
    List<Topic>.from(str.map((x) => Topic.fromJson(x)));

String topicListResponseToJson(List<Topic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Topic {
  Topic({
    required this.name,
    required this.id,
    required this.chapter,
  });

  String name;
  int id;
  int chapter;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        name: json["name"],
        id: json["id"],
        chapter: json["chapter"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "chapter": chapter,
      };
}
