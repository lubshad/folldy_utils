import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class AddNewCourse extends UseCase<Map<String, dynamic>, AddCourseParams> {
  final DataRepository _dataRepository;

  AddNewCourse(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddCourseParams params) async {
    return _dataRepository.addNewCourse(params.toMap());
  }
}

class AddCourseParams {
  final String name;
  final int university;
  final int? id;
  final int sermersers;

  AddCourseParams(
      {required this.name,
      required this.university,
      required this.id,
      required this.sermersers});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'university': university,
      'id': id,
      "semesters": sermersers,
    };
  }

  factory AddCourseParams.fromMap(Map<String, dynamic> map) {
    return AddCourseParams(
      sermersers: map['sermersers'],
      name: map['name'] ?? '',
      university: map['university']?.toInt() ?? 0,
      id: map['id']?.toInt(),
    );
  }
}
