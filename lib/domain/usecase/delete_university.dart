import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

import '../../data/models/university_list_response.dart';

class DeleteUniversity extends UseCase<Map<String, dynamic>, University> {
  final DataRepository _dataRepository;

  DeleteUniversity(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(University params) async {
    return _dataRepository.deleteUniversity(params.toJson());
  }
}
