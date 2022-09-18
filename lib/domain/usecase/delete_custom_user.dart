import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class DeleteCustomUser extends UseCase<dynamic, DeleteCustomUserParams> {
  final DataRepository _dataRepository;
  DeleteCustomUser(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(DeleteCustomUserParams params) async {
    return _dataRepository.deleteCustomUser(params.toJson());
  }
}

class DeleteCustomUserParams {
  final String idToken;

  DeleteCustomUserParams({required this.idToken});
  toJson() {
    return {
      "idToken": idToken,
    };
  }
}
