
import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class AssignSubjectToFaculty
    extends UseCase<Map<String, dynamic>, AssignSubjectTOFacultyParams> {
  final DataRepository _dataRepository;

  AssignSubjectToFaculty(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AssignSubjectTOFacultyParams params) async {
    return _dataRepository.assignSubjectToFaculty(params.toMap());
  }
}

class AssignSubjectTOFacultyParams {
  final int facultyId;
  final List<int> subjectIds;
  final int batchId;

  AssignSubjectTOFacultyParams(
      {required this.facultyId,
      required this.subjectIds,
      required this.batchId});

  Map<String, dynamic> toMap() {
    return {
      'facultyId': facultyId,
      'subjectIds': subjectIds,
      'batchId': batchId,
    };
  }
}
