import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class AddEditBatch extends UseCase<Map<String, dynamic>, AddEditBatchParams> {
  final DataRepository _dataRepository;

  AddEditBatch(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddEditBatchParams params) async {
    return _dataRepository.addEditBatch(params.toMap());
  }
}

class AddEditBatchParams {
  final String batchName;
  final int courseId;
  final int? id;
  final int facultyId;
  final int semester;

  AddEditBatchParams(
      {required this.batchName,
      required this.courseId,
      required this.facultyId,
      required this.semester,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': batchName,
      'course': courseId,
      'id': id,
      "facultyId": facultyId,
      "liveSemester": semester,
    };
  }
}
