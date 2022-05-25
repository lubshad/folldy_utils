import 'package:folldy_utils/data/models/subject_list_response.dart';
import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class DeleteSubject extends UseCase<Map<String, dynamic>, Subject> {
  final DataRepository _dataRepository;

  DeleteSubject(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(Subject params) async {
    return _dataRepository.deleteSubject(params.toJson());
  }
}
