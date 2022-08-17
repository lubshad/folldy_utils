import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class RegisterUser extends UseCase<Map<String, dynamic>, RegisterUserParams> {
  final DataRepository _dataRepository;

  RegisterUser(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      RegisterUserParams params) async {
    return _dataRepository.registerUser(params.toMap());
  }
}

class RegisterUserParams {
  final String phone;
  final String username;
  final String email;
  final String idToken;

  RegisterUserParams(
      {required this.phone, required this.email, required this.username ,required this.idToken});

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      "username": username,
      "email": email,
      "idToken": idToken,
    };
  }
}
