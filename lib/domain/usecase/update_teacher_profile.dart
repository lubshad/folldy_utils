import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class UpdateTeacherProfile
    extends UseCase<Map<String, dynamic>, UploadFileParams> {
  final DataRepository _dataRepository;

  UpdateTeacherProfile(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      UploadFileParams params) async {
    return _dataRepository.uploadFile(params);
  }
}