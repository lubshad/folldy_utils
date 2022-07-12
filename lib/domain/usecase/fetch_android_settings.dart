import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class FetchAndroidSettings
    extends UseCase<dynamic, NoParams> {
  final DataRepository _dataRepository;

  FetchAndroidSettings(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      NoParams params) async {
    return _dataRepository.fetchAndroidSettings(params.toJson());
  }
}


