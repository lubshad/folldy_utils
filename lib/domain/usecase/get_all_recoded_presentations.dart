
import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetAllRecordedPresentations
    extends UseCase<Map<String, dynamic>, GetRecordedPresentationsArguments> {
  final DataRepository _dataRepository;

  GetAllRecordedPresentations(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(GetRecordedPresentationsArguments params) async {
    return _dataRepository.getAllRecordedPresentations(params.toMap());
  }
}

class GetRecordedPresentationsArguments {
  final String? facultyId;

  GetRecordedPresentationsArguments({this.facultyId});

  Map<String, dynamic> toMap() {
    return {
      'facultyId': facultyId,
    };
  }
}
