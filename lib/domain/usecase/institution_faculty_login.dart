import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class InstitutionFacultyLogin
    extends UseCase<Map<String, dynamic>, InstitutionFacultyLoginParams> {
  final DataRepository _dataRepository;

  InstitutionFacultyLogin(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      InstitutionFacultyLoginParams params) async {
    return _dataRepository.institutionFacultyLogin(params.toMap());
  }
}

class InstitutionFacultyLoginParams {
  final String phone;
  final String uuid;

  InstitutionFacultyLoginParams({required this.phone, required this.uuid});

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      "uuid": uuid
    };
  }
}
