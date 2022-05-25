
import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetSubjectDetails extends UseCase<Map<String, dynamic>, GetSubjectDetailsParams> {
  final DataRepository _dataRepository;

  GetSubjectDetails(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      GetSubjectDetailsParams  params) async {
    return _dataRepository.getSubjectDetails(params.toMap());
  }
}

class GetSubjectDetailsParams {
  final int subjectId;

  GetSubjectDetailsParams({required this.subjectId});

  

  Map<String, dynamic> toMap() {
    return {
      'id': subjectId,
    };
  }
}
