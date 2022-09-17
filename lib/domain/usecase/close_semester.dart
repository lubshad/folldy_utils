import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class CloseSemester extends UseCase<dynamic, CloseSemesterParams> {
  final DataRepository _dataRepository;
  CloseSemester(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(CloseSemesterParams params) async {
    return _dataRepository.closeSemester(params.toJson());
  }
}

class CloseSemesterParams {
  final List<int> subjectIds;
  final int batchId;
  final int semester;

  CloseSemesterParams(
      {required this.subjectIds,
      required this.batchId,
      required this.semester});
  toJson() {
    return {"subjectIds": subjectIds, "batchId": batchId, "semester": semester};
  }
}
