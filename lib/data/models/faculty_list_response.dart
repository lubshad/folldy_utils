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
    required this.idToken,
    required this.email,
    required this.profileImage,
  });

  final int id;
  final String name;
  final String phone;
  final int? institution;
  final String? idToken;
  final String? email;
  final String? profileImage;

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
      idToken: json["idToken"],
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
        "idToken": idToken,
        "profile_image": profileImage,
      };
}
