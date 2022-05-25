import 'dart:convert';

import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class AddNewSubject extends UseCase<Map<String, dynamic>, AddSubjectParams> {
  final DataRepository _dataRepository;

  AddNewSubject(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddSubjectParams params) async {
    return _dataRepository.addNewSubject(params.toMap());
  }
}

class AddSubjectParams {
  final String name;
  final int semester;
  final int? id;
  final int course;

  AddSubjectParams(
      {required this.name,
      required this.semester,
      this.id,
      required this.course});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'semester': semester,
      'id': id,
      'course': course,
    };
  }

  factory AddSubjectParams.fromMap(Map<String, dynamic> map) {
    return AddSubjectParams(
      name: map['name'] ?? '',
      semester: map['semester']?.toInt() ?? 0,
      id: map['id']?.toInt(),
      course: map['course']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddSubjectParams.fromJson(String source) =>
      AddSubjectParams.fromMap(json.decode(source));
}
