import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class FetchProfileDetails extends UseCase<dynamic, FetchProfileDetailsParams> {
  final DataRepository _dataRepository;
  FetchProfileDetails(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      FetchProfileDetailsParams params) async {
    return _dataRepository.fetchProfileDetails(params.toJson());
  }
}

class FetchProfileDetailsParams {
  final int userId;

  FetchProfileDetailsParams(this.userId);
  toJson() {
    return {"userId": userId};
  }
}
