import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

import '../../data/models/faculty_list_response.dart';

class DeleteFaculty extends UseCase<Map<String, dynamic>, Faculty> {
  final DataRepository _dataRepository;

  DeleteFaculty(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(Faculty params) async {
    return _dataRepository.deleteFaculty(params.toJson());
  }
}
