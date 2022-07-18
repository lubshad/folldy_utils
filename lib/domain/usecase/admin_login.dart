import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class AdminLogin extends UseCase<Map<String, dynamic>, AdminLoginParams> {
  final DataRepository _dataRepository;

  AdminLogin(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AdminLoginParams params) async {
    return _dataRepository.adminLogin(params.toMap());
  }
}

class AdminLoginParams {
  final String username;
  final String password;

  AdminLoginParams({required this.username, required this.password});
  toMap() {
    return {
      "username": username,
      "password": password  
    };
  }
}
