import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/domain/usecase/get_subject_details.dart';
import '../repositories/data_repository.dart';

class FetchSubjectSettigns extends UseCase<dynamic, GetSubjectDetailsParams> {
  final DataRepository _dataRepository;
  FetchSubjectSettigns(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(GetSubjectDetailsParams params) async {
    return _dataRepository.fetchSubjectSettings(params.toMap());
  }
}
// class GetSubjectDetailsParams {
//   toJson() {
//     return {};
//   }
// }