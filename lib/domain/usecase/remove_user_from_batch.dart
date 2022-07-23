import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class RemoveUserFromBatch extends UseCase<dynamic, RemoveUserFromBatchParams> {
  final DataRepository _dataRepository;
  RemoveUserFromBatch(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      RemoveUserFromBatchParams params) async {
    return _dataRepository.removeUserFromBatch(params.toJson());
  }
}

class RemoveUserFromBatchParams {
  final int userId;
  final int batchId;

  RemoveUserFromBatchParams({required this.userId, required this.batchId});
  toJson() {
    return {
      "userId": userId,
      "batchId": batchId,
    };
  }
}
