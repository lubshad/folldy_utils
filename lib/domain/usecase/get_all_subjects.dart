import 'dart:convert';

import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/data/models/subject_list_response.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class GetAllSubjects extends UseCase<List<Subject>, SubjectListingParams> {
  final DataRepository _dataRepository;

  GetAllSubjects(this._dataRepository);
  @override
  Future<Either<AppError, List<Subject>>> call(
      SubjectListingParams params) async {
    return _dataRepository.listSubjects(params.toMap());
  }
}

class SubjectListingParams {
  final int? courseId;
  final String? searchKey;

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'searchKey': searchKey,
    };
  }

  factory SubjectListingParams.fromMap(Map<String, dynamic> map) {
    return SubjectListingParams(
      courseId: map['courseId']?.toInt(),
      searchKey: map['searchKey'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectListingParams.fromJson(String source) =>
      SubjectListingParams.fromMap(json.decode(source));
  SubjectListingParams({this.courseId, this.searchKey});
}
