import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class CreateNewUser extends UseCase<dynamic, CreateUserParams> {
  final DataRepository _dataRepository;

  CreateNewUser(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(CreateUserParams params) async {
    return _dataRepository.createNewUser(params.toMap());
  }
}

class CreateUserParams {
  final String username;
  final String password;

  CreateUserParams({required this.username, required this.password});
  toMap() {
    return {
      "username": username,
      "password": password
    };
  }
}
