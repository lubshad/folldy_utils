
import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class AdminLogout extends UseCase<Map<String, dynamic>, NoParams> {
  final DataRepository _dataRepository;

  AdminLogout(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      NoParams params) async {
    return _dataRepository.adminLogout(params.toJson());
  }
}
