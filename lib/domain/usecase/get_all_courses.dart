import 'dart:convert';

import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/data/models/course_list_response.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class GetAllCourses extends UseCase<List<Course>, CourseListingParams> {
  final DataRepository _dataRepository;

  GetAllCourses(this._dataRepository);
  @override
  Future<Either<AppError, List<Course>>> call(
      CourseListingParams params) async {
    return _dataRepository.listCourses(params.toMap());
  }
}

class CourseListingParams {
  final int? universityId;
  final String? searchKey;

  CourseListingParams({this.searchKey, this.universityId});

  Map<String, dynamic> toMap() {
    return {
      'universityId': universityId,
      'searchKey': searchKey,
    };
  }

  factory CourseListingParams.fromMap(Map<String, dynamic> map) {
    return CourseListingParams(
      universityId: map['universityId']?.toInt(),
      searchKey: map['searchKey'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseListingParams.fromJson(String source) =>
      CourseListingParams.fromMap(json.decode(source));
}
