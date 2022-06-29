import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class RegisterStudent
    extends UseCase<Map<String, dynamic>, RegisterStudentParams> {
  final DataRepository _dataRepository;

  RegisterStudent(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      RegisterStudentParams params) async {
    return _dataRepository.registerStudent(params.toMap());
  }
}

class RegisterStudentParams {
  final String phone;
  final String username;
  final String email;

  RegisterStudentParams({required this.phone, required this.email, required this.username});

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      "username": username,
      "email": email,
    };
  }
}
