import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class CopySubject extends UseCase<dynamic, CopySubjectParams> {
  final DataRepository _dataRepository;
  CopySubject(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(CopySubjectParams params) async {
    return _dataRepository.copySubject(params.toJson());
  }
}

class CopySubjectParams {
  final int subjectId;
  final int courseId;
  final int semester;

  CopySubjectParams({required this.subjectId, required this.courseId, required this.semester});
  toJson() {
    return {
      "subjectId": subjectId,
      "courseId": courseId,
      "semester": semester,
    };
  }
}
