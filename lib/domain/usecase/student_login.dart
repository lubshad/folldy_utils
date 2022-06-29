import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class StudentLogin
    extends UseCase<Map<String, dynamic>, StudentLoginParams> {
  final DataRepository _dataRepository;

  StudentLogin(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      StudentLoginParams params) async {
    return _dataRepository.studentLogin(params.toMap());
  }
}

class StudentLoginParams {
  final String phone;
  final String uuid;

  StudentLoginParams({required this.phone, required this.uuid});

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      "uuid": uuid
    };
  }
}
