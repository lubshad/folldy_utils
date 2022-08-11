import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class DontPublishToday extends UseCase<dynamic, DontPublishParams> {
  final DataRepository _dataRepository;
  DontPublishToday(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(DontPublishParams params) async {
    return _dataRepository.dontPublishToday(params.toJson());
  }
}

class DontPublishParams {
  final int facultyId;

  DontPublishParams(this.facultyId);
  toJson() {
    return {
      "facultyId" :facultyId
    };
  }
}
