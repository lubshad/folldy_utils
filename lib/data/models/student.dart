class Student {
  Student({
    required this.id,
    required this.name,
    required this.phone,
    required this.uuid,
  });

  final int id;
  final String name;
  final String phone;
  final String? uuid;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
      uuid: json["uuid"],
      id: json["id"],
      name: json["username"],
      phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": name,
        "phone": phone,
        "uuid": uuid,
      };
}