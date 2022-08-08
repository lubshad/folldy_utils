import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class FetchBatchSettings extends UseCase<dynamic, BatchSettingsParams> {
  final DataRepository _dataRepository;
  FetchBatchSettings(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(BatchSettingsParams params) async {
    return _dataRepository.fetchBatchSettings(params.toJson());
  }
}

class BatchSettingsParams {
  final int batchId;

  BatchSettingsParams({required this.batchId});
  toJson() {
    return {
      "batchId": batchId,
    };
  }
}
