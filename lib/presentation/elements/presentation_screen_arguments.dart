class PresentationScreenArguments {
  final int presentationId;
  final Map<String, dynamic> thumbnail;
  final dynamic subject;
  final String name;
  final String? profileImage;

  PresentationScreenArguments(
      {required this.subject,
      this.profileImage,
      required this.presentationId,
      required this.thumbnail,
      required this.name});

  factory PresentationScreenArguments.fromJson(Map<String, dynamic> json) {
    return PresentationScreenArguments(
        profileImage: json["profileImage"],
        name: json["presentation"],
        subject: {"id": json["subjectId"]},
        presentationId: json["id"],
        thumbnail: json["thumbnail"]["portrait"]);
  }
}
