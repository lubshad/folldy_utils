import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

import '../../data/models/institution_list_response.dart';

class DeleteInstitution extends UseCase<Map<String, dynamic>, Institution> {
  final DataRepository _dataRepository;

  DeleteInstitution(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      Institution params) async {
    return _dataRepository.deleteInstitution(params.toJson());
  }
}
