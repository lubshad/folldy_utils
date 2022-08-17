import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class UserLogin
    extends UseCase<Map<String, dynamic>, UserLoginParams> {
  final DataRepository _dataRepository;

  UserLogin(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      UserLoginParams params) async {
    return _dataRepository.userLogin(params.toMap());
  }
}

class UserLoginParams {
  final String phone;
  final String idToken;

  UserLoginParams({required this.phone, required this.idToken});

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      "idToken": idToken
    };
  }
}
