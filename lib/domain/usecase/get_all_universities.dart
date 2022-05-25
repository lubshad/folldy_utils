import 'package:folldy_utils/data/models/university_list_response.dart';
import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class GetAllUniversitys extends UseCase<List<University>, NoParams> {
  final DataRepository _dataRepository;

  GetAllUniversitys(this._dataRepository);
  @override
  Future<Either<AppError, List<University>>> call(NoParams params) async {
    return _dataRepository.listUniversitys(params.toJson());
  }
}
