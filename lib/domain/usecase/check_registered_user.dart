import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class CheckRegisteredUser
    extends UseCase<Map<String, dynamic>, CheckRegisteredUserParams> {
  final DataRepository _dataRepository;

  CheckRegisteredUser(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      CheckRegisteredUserParams params) async {
    return _dataRepository.checkRegisteredUser(params.toMap());
  }
}

class CheckRegisteredUserParams {
  final String phone;

  CheckRegisteredUserParams({required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
    };
  }
}
