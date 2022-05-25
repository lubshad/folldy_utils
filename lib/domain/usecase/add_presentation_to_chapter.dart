import 'dart:convert';

import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class AddPresentations extends UseCase<dynamic, AddPresentaionParams> {
  final DataRepository _dataRepository;

  AddPresentations(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(AddPresentaionParams params) async {
    return _dataRepository.addPresentationsToChapter(params.toMap());
  }
}

class AddPresentaionParams {
  final List<int> presentationIds;
  final int? chapterId;
  final int? subjectId;
  final List<int> areaIds;

  AddPresentaionParams(
      {this.areaIds = const [],
      this.subjectId,
      this.presentationIds = const [],
      this.chapterId});

  Map<String, dynamic> toMap() {
    return {
      'presentationIds': presentationIds,
      'chapterId': chapterId,
      'subjectId': subjectId,
      'areaIds': areaIds,
    };
  }

  factory AddPresentaionParams.fromMap(Map<String, dynamic> map) {
    return AddPresentaionParams(
      presentationIds: List<int>.from(map['presentationIds']),
      chapterId: map['chapterId']?.toInt(),
      subjectId: map['subjectId']?.toInt(),
      areaIds: List<int>.from(map['areaIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddPresentaionParams.fromJson(String source) =>
      AddPresentaionParams.fromMap(json.decode(source));
}
