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

  CloseSemesterParams(this.subjectIds);
  toJson() {
    return {
      "subjectIds": subjectIds
    };
  }
}
