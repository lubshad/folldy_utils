import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class ChangeInstitution extends UseCase<dynamic, ChangeInstitutionParams> {
  final DataRepository _dataRepository;
  ChangeInstitution(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(ChangeInstitutionParams params) async {
    return _dataRepository.changeInsitution(params.toJson());
  }
}

class ChangeInstitutionParams {
  final int facultyId;
  final int institutionId;

  ChangeInstitutionParams({required this.facultyId, required this.institutionId});

  toJson() {
    return {
      "facultyId" :facultyId  ,
      "institutionId": institutionId, 
    };
  }
}
