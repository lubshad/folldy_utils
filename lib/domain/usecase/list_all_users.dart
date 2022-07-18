import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class ListAllUsers extends UseCase<dynamic, UserListingParam> {
  final DataRepository _dataRepository;

  ListAllUsers(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      UserListingParam params) async {
    return _dataRepository.listAllUsers(params.toMap());
  }
}

class UserListingParam {
  toMap() {
    return {};
  }
}
