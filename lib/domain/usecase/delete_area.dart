import 'package:folldy_utils/data/models/area_list_response.dart';
import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class DeleteArea extends UseCase<Map<String, dynamic>, Area> {
  final DataRepository _dataRepository;

  DeleteArea(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(Area params) async {
    return _dataRepository.deleteArea(params.toJson());
  }
}
