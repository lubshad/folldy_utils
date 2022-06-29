import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetStudentDashboard extends UseCase<dynamic, GetStudentDashboardParams> {
  final DataRepository _dataRepository;

  GetStudentDashboard(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      GetStudentDashboardParams params) async {
    return _dataRepository.getStudentDashboard(params.toMap());
  }
}

class GetStudentDashboardParams {
  final int studentId;

  GetStudentDashboardParams({required this.studentId});

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
    };
  }
}
