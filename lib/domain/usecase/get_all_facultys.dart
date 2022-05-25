import 'dart:convert';

import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

import '../../data/models/faculty_list_response.dart';

class GetAllFacultys extends UseCase<List<Faculty>, FacultyListingParams> {
  final DataRepository _dataRepository;

  GetAllFacultys(this._dataRepository);
  @override
  Future<Either<AppError, List<Faculty>>> call(
      FacultyListingParams params) async {
    return _dataRepository.listFacultys(params.toMap());
  }
}

class FacultyListingParams {
  final int? institution;

  FacultyListingParams({this.institution});

  Map<String, dynamic> toMap() {
    return {
      'institution': institution,
    };
  }

  factory FacultyListingParams.fromMap(Map<String, dynamic> map) {
    return FacultyListingParams(
      institution: map['institution']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FacultyListingParams.fromJson(String source) =>
      FacultyListingParams.fromMap(json.decode(source));
}
