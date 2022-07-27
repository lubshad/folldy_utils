import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetUserDashboard extends UseCase<dynamic, GetUserDashboardParams> {
  final DataRepository _dataRepository;

  GetUserDashboard(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      GetUserDashboardParams params) async {
    return _dataRepository.getUserDashboard(params.toMap());
  }
}

class GetUserDashboardParams {
  final int userId;

  GetUserDashboardParams({required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
    };
  }
}
