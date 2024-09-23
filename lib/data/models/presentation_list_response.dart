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
    this.displayOrder,
  });

  String name;
  int id;
  int module;
  // List<Area> areas;
  List<String> tags;
  int? displayOrder;

  factory Presentation.fromJson(Map<String, dynamic> json) => Presentation(
        name: json["name"],
        id: json["id"],
        module: json["module"],
        displayOrder: json["displayOrder"],
        // areas: areaListResponseFromJson(json["areas"]),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "module": module,
        // "areas": areas,
        "tags": tags,
      };
}
