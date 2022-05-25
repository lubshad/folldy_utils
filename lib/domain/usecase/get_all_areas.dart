import 'dart:convert';

import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/data/models/area_list_response.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class GetAllAreas extends UseCase<List<Area>, AreaListingParams> {
  final DataRepository _dataRepository;

  GetAllAreas(this._dataRepository);
  @override
  Future<Either<AppError, List<Area>>> call(AreaListingParams params) async {
    return _dataRepository.listAreas(params.toMap());
  }
}

class AreaListingParams {
  final String? searchKey;

  AreaListingParams({this.searchKey});

  Map<String, dynamic> toMap() {
    return {
      'searchKey': searchKey,
    };
  }

  factory AreaListingParams.fromMap(Map<String, dynamic> map) {
    return AreaListingParams(
      searchKey: map['searchKey'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AreaListingParams.fromJson(String source) =>
      AreaListingParams.fromMap(json.decode(source));
}
