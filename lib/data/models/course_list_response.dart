// To parse this JSON data, do
//
//     final university = universityFromJson(jsonString);

import 'dart:convert';

import 'package:folldy_utils/data/models/university_list_response.dart';

List<Course> courseFromJson(dynamic str) =>
    List<Course>.from(str.map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  Course({
    required this.university,
    required this.name,
    this.id,
    required this.semesters,
  });

  final String name;
  final University university;
  final int semesters;
  final int? id;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        semesters: json["semesters"],
        university: University.fromJson(json["university"]),
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "semsters": semesters,
        "name": name,
        "id": id,
        "university": university,
      };
}
