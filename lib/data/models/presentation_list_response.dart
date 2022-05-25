// To parse this JSON data, do
//
//     final presentationListResponse = presentationListResponseFromJson(jsonString);

import 'dart:convert';

// import 'package:folldy_utils/data/models/area_list_response.dart';

List<Presentation> presentationListResponseFromJson(dynamic str) =>
    List<Presentation>.from(str.map((x) => Presentation.fromJson(x)));

String presentationListResponseToJson(List<Presentation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Presentation {
  Presentation({
    // required this.areas,
    required this.tags,
    required this.name,
    required this.id,
    required this.module,
  });

  String name;
  int id;
  int module;
  // List<Area> areas;
  List<String> tags;

  factory Presentation.fromJson(Map<String, dynamic> json) => Presentation(
        name: json["name"],
        id: json["id"],
        module: json["module"],
        // areas: areaListResponseFromJson(json["areas"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "module": module,
        // "areas": areas,
        "tags": tags,
      };
}
