import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetBatchDetails extends UseCase<Map<String, dynamic>, GetBatchDetailsParams> {
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

  GetBatchDetailsParams({required this.batchId});

  Map<String, dynamic> toMap() {
    return {
      'id': batchId,
    };
  }
}