// To parse this JSON data, do
//
//     final university = universityFromJson(jsonString);

// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:basic_template/basic_template.dart';

List<Institution> institutionFromJson(dynamic str) =>
    List<Institution>.from(str.map((x) => Institution.fromJson(x)));

String institutionToJson(List<Institution> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Institution extends Equatable {
  Institution({
    // required this.university,
    required this.name,
    this.id,
  });

  String name;
  // int university;
  int? id;

  factory Institution.fromJson(Map<String, dynamic> json) => Institution(
        // university: json["university"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        // "university": university,
      };

  @override
  List<Object?> get props => [id];
}
