import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/utils/enums.dart';
import '../repositories/data_repository.dart';

class UpdateBatchStatus extends UseCase<dynamic, UpdateBatchStatusParams> {
  final DataRepository _dataRepository;
  UpdateBatchStatus(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(UpdateBatchStatusParams params) async {
    return _dataRepository.updateBatchStatus(params.toJson());
  }
}

class UpdateBatchStatusParams {
  final int batchId;
  final ActiveStatus status;

  UpdateBatchStatusParams({required this.batchId, required this.status});

  toJson() {
    return {"batchId": batchId, "status": status.string};
  }
}
