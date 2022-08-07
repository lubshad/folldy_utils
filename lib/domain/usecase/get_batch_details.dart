import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetBatchDetails
    extends UseCase<Map<String, dynamic>, GetBatchDetailsParams> {
  final DataRepository _dataRepository;

  GetBatchDetails(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      GetBatchDetailsParams params) async {
    return _dataRepository.getBatchDetails(params.toMap());
  }
}

class GetBatchDetailsParams {
  final int batchId;
  final int facultyId;
  final int? semester;

  GetBatchDetailsParams({required this.batchId, required this.facultyId, this.semester});

  Map<String, dynamic> toMap() {
    return {'id': batchId, "facultyId": facultyId , "semester": semester};
  }
}
