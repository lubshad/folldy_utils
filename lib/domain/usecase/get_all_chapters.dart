import 'dart:convert';

import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/data/models/chapter_list_response.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class GetAllChapters extends UseCase<List<Chapter>, ChapterListingParams> {
  final DataRepository _dataRepository;

  GetAllChapters(this._dataRepository);
  @override
  Future<Either<AppError, List<Chapter>>> call(
      ChapterListingParams params) async {
    return _dataRepository.listChapters(params.toMap());
  }
}

class ChapterListingParams {
  final String? searchKey;
  final int? subjectId;

  ChapterListingParams({this.searchKey, this.subjectId});

  Map<String, dynamic> toMap() {
    return {
      'searchKey': searchKey,
      'subjectId': subjectId,
    };
  }

  factory ChapterListingParams.fromMap(Map<String, dynamic> map) {
    return ChapterListingParams(
      searchKey: map['searchKey'],
      subjectId: map['subjectId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChapterListingParams.fromJson(String source) =>
      ChapterListingParams.fromMap(json.decode(source));
}
