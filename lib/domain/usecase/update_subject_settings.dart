import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class UpdateSubjectSettings
    extends UseCase<dynamic, UpdateSubjectSettingsParams> {
  final DataRepository _dataRepository;
  UpdateSubjectSettings(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      UpdateSubjectSettingsParams params) async {
    return _dataRepository.updateSubjectSettings(params.toJson());
  }
}

class UpdateSubjectSettingsParams {
  final int subjectId;
  final List publishingDays;

  UpdateSubjectSettingsParams(
      {required this.subjectId, required this.publishingDays});

  toJson() {
    return {"subjectId": subjectId, "publishingDays": publishingDays};
  }
}
