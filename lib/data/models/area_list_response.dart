// To parse this JSON data, do
//
//     final topicListResponse = areaListResponseFromJson(jsonString);

import 'dart:convert';

List<Area> areaListResponseFromJson(dynamic str) =>
    List<Area>.from(str.map((x) => Area.fromJson(x)));

String areaListResponseToJson(List<Area> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
  Area({
    required this.name,
    required this.id,
    this.image,
  });

  String name;
  int id;
  String? image;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        name: json["name"],
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "image": image,
      };
}
