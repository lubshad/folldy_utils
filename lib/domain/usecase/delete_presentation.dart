import 'package:folldy_utils/data/models/presentation_list_response.dart';
import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class DeletePresentation extends UseCase<Map<String, dynamic>, Presentation> {
  final DataRepository _dataRepository;

  DeletePresentation(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      Presentation params) async {
    return _dataRepository.deletePresentation(params.toJson());
  }
}
