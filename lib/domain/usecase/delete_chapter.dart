import 'package:folldy_utils/data/models/chapter_list_response.dart';
import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class DeleteChapter extends UseCase<Map<String, dynamic>, Chapter> {
  final DataRepository _dataRepository;

  DeleteChapter(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(Chapter params) async {
    return _dataRepository.deleteChapter(params.toJson());
  }
}
