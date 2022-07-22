import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';
class SuspendBatch extends UseCase<dynamic, SuspendBatchParams> {
  final DataRepository _dataRepository;
  SuspendBatch(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(SuspendBatchParams params) async {
    return _dataRepository.suspendBatch(params.toJson());
  }
}
class SuspendBatchParams {
  toJson() {
  return {};
  }
}