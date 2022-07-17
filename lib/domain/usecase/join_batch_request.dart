import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class JoinBatchRequest
    extends UseCase<Map<String, dynamic>, JoinBatchRequestParams> {
  final DataRepository _dataRepository;

  JoinBatchRequest(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      JoinBatchRequestParams params) async {
    return _dataRepository.joinBatchRequest(params.toMap());
  }
}

class JoinBatchRequestParams {
  final int batchId;
  final int userId;

  JoinBatchRequestParams({required this.batchId, required this.userId});

  toMap() {
    return {
      "batchId": batchId,
      "userId": userId,
    };
  }
}
