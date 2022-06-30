import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class RegisterTeacher
    extends UseCase<Map<String, dynamic>, RegisterTeacherParams> {
  final DataRepository _dataRepository;

  RegisterTeacher(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      RegisterTeacherParams params) async {
    return _dataRepository.registerTeacher(params.toMap());
  }
}

class RegisterTeacherParams {
  final String phone;
  final String username;
  final String email;

  RegisterTeacherParams({required this.phone, required this.email, required this.username});

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      "username": username,
      "email": email,
    };
  }
}
