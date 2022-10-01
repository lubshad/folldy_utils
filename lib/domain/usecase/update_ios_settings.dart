import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class UpdateIosSettings
    extends UseCase<dynamic, UpdateIosSettingsParams> {
  final DataRepository _dataRepository;

  UpdateIosSettings(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      UpdateIosSettingsParams params) async {
    return _dataRepository.updateIosSettings(params.toMap());
  }
}

class UpdateIosSettingsParams {
  final int currentVersionTeacher;
  final int minimumVersionTeacher;
  final String appUrlTeacher;
  final String updateMessageTeacher;
  final int currentVersionStudent;
  final int minimumVersionStudent;
  final String appUrlStudent;
  final String updateMessageStudent;

  UpdateIosSettingsParams(
      {required this.currentVersionTeacher,
      required this.appUrlTeacher,
      required this.updateMessageTeacher,
      required this.minimumVersionTeacher
      ,
      required this.currentVersionStudent,
      required this.appUrlStudent,
      required this.updateMessageStudent,
      required this.minimumVersionStudent
      });

  toMap() {
    return {
      "currentVersionTeacher": currentVersionTeacher,
      "minimumVersionTeacher": minimumVersionTeacher,
      "appUrlTeacher": appUrlTeacher,
      "updateMessageTeacher": updateMessageTeacher,
      "currentVersionStudent": currentVersionStudent,
      "minimumVersionStudent": minimumVersionStudent,
      "appUrlStudent": appUrlStudent,
      "updateMessageStudent": updateMessageStudent,
    };
  }
}
