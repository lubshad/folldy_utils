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

  UpdateAndroidSettingsParams(
      {required this.currentVersionTeacher,
      required this.appUrlTeacher,
      required this.updateMessageTeacher,
      required this.minimumVersionTeacher});

  toMap() {
    return {
      "currentVersionTeacher": currentVersionTeacher,
      "minimumVersionTeacher": minimumVersionTeacher,
      "appUrlTeacher": appUrlTeacher,
      "updateMessageTeacher": updateMessageTeacher,
    };
  }
}
