
import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class ChangeLiveSemester
    extends UseCase<Map<String, dynamic>, ChangeLiveSemesterParams> {
  final DataRepository _dataRepository;

  ChangeLiveSemester(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      ChangeLiveSemesterParams params) async {
    return _dataRepository.changeLiveSemester(params.toMap());
  }
}

class ChangeLiveSemesterParams {
  final int semester;
  final int batchId;
  ChangeLiveSemesterParams({
    required this.semester,
    required this.batchId,
  });

  Map<String, dynamic> toMap() {
    return {
      'semester': semester,
      'batchId': batchId,
    };
  }
}
