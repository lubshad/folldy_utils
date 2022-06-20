// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'dart:convert';

List<Chapter> chapterFromJson(dynamic str) =>
    List<Chapter>.from(str.map((x) => Chapter.fromJson(x)));

String chapterToJson(List<Chapter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chapter {
  Chapter({
    required this.name,
    this.id,
    this.module = 1,
    this.subjectId,
    this.subjectName,
  });

  String name;
  int? id;
  int module;
  int? subjectId;
  String? subjectName;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
      name: json["name"],
      id: json["id"],
      module: json["module"],
      subjectName: json["subjectName"],
      subjectId: json["subject"]);

  Map<String, dynamic> toJson() =>
      {"name": name, "id": id, "module": module, "subject": subjectId , "subjectName": subjectName};
}
