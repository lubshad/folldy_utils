import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetFacultyDashboard extends UseCase<dynamic, GetFacultyDashboardParams> {
  final DataRepository _dataRepository;

  GetFacultyDashboard(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      GetFacultyDashboardParams params) async {
    return _dataRepository.getFacultyDashboard(params.toMap());
  }
}

class GetFacultyDashboardParams {
  final int facultyId;

  GetFacultyDashboardParams({required this.facultyId});

  Map<String, dynamic> toMap() {
    return {
      'facultyId': facultyId,
    };
  }
}
