import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class JoinBatch
    extends UseCase<Map<String, dynamic>, JoinBatchParams> {
  final DataRepository _dataRepository;

  JoinBatch(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      JoinBatchParams params) async {
    return _dataRepository.joinBatch(params.toMap());
  }
}

class JoinBatchParams {
  final int facultyId;
  final String batchId;

  JoinBatchParams({required this.facultyId, required this.batchId});

  Map<String, dynamic> toMap() {
    return {"facultyId": facultyId, "batchId": batchId};
  }
}
