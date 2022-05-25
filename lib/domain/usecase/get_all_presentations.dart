import 'dart:convert';

import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class PresentationListingParams {
  final String? searchKey;
  final int? chapterId;
  final int? subjectId;
  final int? areaId;
  PresentationListingParams({
    this.areaId,
    this.subjectId,
    this.chapterId,
    this.searchKey,
  });

  Map<String, dynamic> toMap() {
    return {
      'searchKey': searchKey,
      'chapterId': chapterId,
      'subjectId': subjectId,
      'areaId': areaId,
    };
  }

  factory PresentationListingParams.fromMap(Map<String, dynamic> map) {
    return PresentationListingParams(
      searchKey: map['searchKey'],
      chapterId: map['chapterId']?.toInt(),
      subjectId: map['subjectId']?.toInt(),
      areaId: map['areaId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PresentationListingParams.fromJson(String source) =>
      PresentationListingParams.fromMap(json.decode(source));
}

class GetAllPresentations
    extends UseCase<List<dynamic>, PresentationListingParams> {
  final DataRepository _dataRepository;

  GetAllPresentations(this._dataRepository);
  @override
  Future<Either<AppError, List<dynamic>>> call(
      PresentationListingParams params) async {
    return _dataRepository.getAllPresentations(params.toMap());
  }
}
