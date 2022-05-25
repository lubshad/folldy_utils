class Batch {
  final int id;
  final String name;
  final DateTime start;
  final DateTime end;
  // final Course course;

  Batch(
      {required this.id,
      required this.name,
      required this.start,
      required this.end});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'start': start.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      // 'course': course.toJson(),
    };
  }

  factory Batch.fromMap(Map<String, dynamic> map) {
    return Batch(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      start: DateTime.parse(map["start"]),
      end: DateTime.parse(map["end"]),
      // course: Course.fromJson(map["course"]),
    );
  }

  static List<Batch> fromJson(List<dynamic> json) {
    return json.map((e) => Batch.fromMap(e)).toList();
  }
}
