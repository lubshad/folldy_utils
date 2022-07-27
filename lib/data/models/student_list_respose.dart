// To parse this JSON data, do
//
//     final studentListResponse = studentListResponseFromJson(jsonString);

import 'dart:convert';

List<Student> studentListResponseFromJson(dynamic str) =>
    List<Student>.from(str.map((x) => Student.fromJson(x)));

String studentListResponseToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  Student({
    required this.id,
    required this.name,
    required this.phone,
    required this.institution,
    required this.uuid,
    required this.email,
    required this.profileImage,
  });

  final int id;
  final String name;
  final String phone;
  final int? institution;
  final String? uuid;
  final String? email;
  final String? profileImage;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
      uuid: json["uuid"],
      id: json["id"],
      email: json["email"],
      name: json["username"],
      phone: json["phone"],
      profileImage: json["profile_image"],
      institution: json["institution"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": name,
        "phone": phone,
        "institution": institution,
        "uuid": uuid,
        "profile_image": profileImage,
      };
}
