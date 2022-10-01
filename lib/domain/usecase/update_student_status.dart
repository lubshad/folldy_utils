import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/utils/enums.dart';
import '../repositories/data_repository.dart';

class UpdateStudentStatus extends UseCase<dynamic, UpdateStudentStatusParams> {
  final DataRepository _dataRepository;
  UpdateStudentStatus(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      UpdateStudentStatusParams params) async {
    return _dataRepository.updateStudent(params.toJson());
  }
}

class UpdateStudentStatusParams {
  final int studentId;
  final int batchId;
  final ActiveStatus activeStatus;

  UpdateStudentStatusParams(
      {required this.studentId,
      required this.batchId,
      required this.activeStatus});
  toJson() {
    return {
      "studentId": studentId,
      "batchId": batchId,
      "activeStatus": activeStatus.string
    };
  }
}
