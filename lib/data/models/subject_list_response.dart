// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

import 'package:folldy_utils/data/models/course_list_response.dart';

List<Subject> subjectFromJson(dynamic str) =>
    List<Subject>.from(str.map((x) => Subject.fromJson(x)));

String subjectToJson(List<Subject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subject {
  Subject({
    this.semester = 1,
    required this.name,
    required this.id,
    required this.course,
  });

  final String name;
  final int semester;
  final int? id;
  final Course course;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        course: Course.fromJson(json["course"]),
        semester: json["semester"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "semester": semester,
        "course": course,
      };
}
