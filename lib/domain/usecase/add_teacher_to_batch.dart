

import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class AddTeachersToBatch extends UseCase<Map<String, dynamic>, AddTeachersToBatchParams> {
  final DataRepository _dataRepository;

  AddTeachersToBatch(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(AddTeachersToBatchParams params) async {
    return _dataRepository.addTeachersToBatch(params.toMap());
  }
}

class AddTeachersToBatchParams {
  final int batchId;
  final List<int> teacherIds;

  AddTeachersToBatchParams({required this.batchId, required this.teacherIds});

  Map<String, dynamic> toMap() {
    return {
      'batchId': batchId,
      'teacherIds': teacherIds,
    };
  }
}
