
class PresentationScreenArguments {
  final int presentationId;
  final Map<String, dynamic> thumbnail;
  final int? subjectId;
  final String name;
  final String? profileImage;

  PresentationScreenArguments(
      {this.subjectId,
      this.profileImage,
      required this.presentationId,
      required this.thumbnail,
      required this.name});

  factory PresentationScreenArguments.fromJson(Map<String, dynamic> json) {
    return PresentationScreenArguments(
        profileImage: json["profileImage"],
        name: json["presentation"],
        subjectId: json["subjectId"],
        presentationId: json["id"],
        thumbnail: json["thumbnail"]["portrait"]);
  }
}