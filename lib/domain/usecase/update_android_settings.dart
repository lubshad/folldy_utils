import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class UpdateAndroidSettings
    extends UseCase<dynamic, UpdateAndroidSettingsParams> {
  final DataRepository _dataRepository;

  UpdateAndroidSettings(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      UpdateAndroidSettingsParams params) async {
    return _dataRepository.updateAndroidSettings(params.toMap());
  }
}

class UpdateAndroidSettingsParams {
  final int currentVersionTeacher;
  final int minimumVersionTeacher;
  final String appUrlTeacher;
  final String updateMessageTeacher;
  final int currentVersionStudent;
  final int minimumVersionStudent;
  final String appUrlStudent;
  final String updateMessageStudent;

  UpdateAndroidSettingsParams(
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
