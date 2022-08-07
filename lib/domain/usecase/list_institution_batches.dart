import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class ListInstitutionBatches
    extends UseCase<Map<String, dynamic>, InstitutionBatchListingParams> {
  final DataRepository _dataRepository;

  ListInstitutionBatches(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      InstitutionBatchListingParams params) async {
    return _dataRepository.listInstitutionBatches(params.toMap());
  }
}

class InstitutionBatchListingParams {
  final int facultyId;

  InstitutionBatchListingParams(
      {required this.facultyId});

  Map<String, dynamic> toMap() {
    return {
      "facultyId": facultyId,
    };
  }
}
