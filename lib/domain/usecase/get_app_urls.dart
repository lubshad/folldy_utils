import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';
class GetAppUrls extends UseCase<dynamic, NoParams> {
  final DataRepository _dataRepository;
  GetAppUrls(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(NoParams params) async {
    return _dataRepository.getAppUrls(params.toJson());
  }
}
class NoParams {
  toJson() {
    return {};
  }
}