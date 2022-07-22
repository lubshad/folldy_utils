import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class LeaveBatch extends UseCase<dynamic, LeaveBatchParams> {
  final DataRepository _dataRepository;
  LeaveBatch(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(LeaveBatchParams params) async {
    return _dataRepository.leaveBatch(params.toJson());
  }
}

class LeaveBatchParams {
  final int batchId;
  final int userId;
  final int? newAdmin;

  LeaveBatchParams({required this.batchId, required this.userId, this.newAdmin});
  toJson() {
    return {
      "batchId": batchId,
      "userId": userId,
      "newAdmin": newAdmin,
    };
  }
}
