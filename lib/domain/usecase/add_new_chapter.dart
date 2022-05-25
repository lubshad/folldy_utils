import 'package:folldy_utils/data/models/chapter_list_response.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';
import 'package:basic_template/basic_template.dart';

class AddNewChapter extends UseCase<Map<String, dynamic>, Chapter> {
  final DataRepository _dataRepository;

  AddNewChapter(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(Chapter params) async {
    return _dataRepository.addNewChapter(params.toJson());
  }
}
