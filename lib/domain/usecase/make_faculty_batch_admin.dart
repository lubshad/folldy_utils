import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class MakeFacultyBatchAdmin
    extends UseCase<dynamic, MakeFacultyBatchAdminParams> {
  final DataRepository _dataRepository;
  MakeFacultyBatchAdmin(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      MakeFacultyBatchAdminParams params) async {
    return _dataRepository.makeFacultyBatchAdmin(params.toJson());
  }
}

class MakeFacultyBatchAdminParams {
  final int facultyId;
  final int batchId;

  MakeFacultyBatchAdminParams({required this.facultyId, required this.batchId});
  toJson() {
    return {
      "facultyId": facultyId,
      "batchId": batchId,
    };
  }
}
