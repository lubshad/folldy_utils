import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class FetchBatchDetails extends UseCase<dynamic, FetchBatchDetailsParam> {
  final DataRepository _dataRepository;

  FetchBatchDetails(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(FetchBatchDetailsParam params) async {
    return _dataRepository.fetchBatchDetails(params.toMap());
  }
}

class FetchBatchDetailsParam {
  final int batchId;
  final int userId;
  const FetchBatchDetailsParam(
      {required this.batchId, required this.userId});

  toMap() {
    return {"batchId": batchId, "userId": userId};
  }
}
