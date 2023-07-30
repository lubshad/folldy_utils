class PresentationScreenArguments {
  final int presentationId;
  final Map<String, dynamic> thumbnail;
  final dynamic subject;
  final String name;
  final String? profileImage;
  final int? module;

  PresentationScreenArguments(
      {required this.subject,
      this.module,
      this.profileImage,
      required this.presentationId,
      required this.thumbnail,
      required this.name});

  factory PresentationScreenArguments.fromJson(Map<String, dynamic> json) {
    return PresentationScreenArguments(
        module : json['module'], 
        profileImage: json["profileImage"],
        name: json["presentation"],
        subject: {"id": json["subjectId"], "name": ""},
        presentationId: json["id"],
        thumbnail: json["thumbnail"]["portrait"]);
  }
}
