// To parse this JSON data, do
//
//     final teacherListResponse = teacherListResponseFromJson(jsonString);

import 'dart:convert';

List<Faculty> teacherListResponseFromJson(dynamic str) =>
    List<Faculty>.from(str.map((x) => Faculty.fromJson(x)));

String teacherListResponseToJson(List<Faculty> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Faculty {
  Faculty({
    required this.id,
    required this.name,
    required this.phone,
    required this.institution,
    required this.uuid,
  });

  final int id;
  final String name;
  final String phone;
  final int institution;
  final String? uuid;

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
      uuid: json["uuid"],
      id: json["id"],
      name: json["username"],
      phone: json["phone"],
      institution: json["institution"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": name,
        "phone": phone,
        "institution": institution,
        "uuid": uuid,
      };
}
