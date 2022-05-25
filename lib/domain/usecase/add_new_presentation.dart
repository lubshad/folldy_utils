import 'dart:convert';

import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class AddNewPresentation
    extends UseCase<Map<String, dynamic>, AddNewPresentationParams> {
  final DataRepository _dataRepository;

  AddNewPresentation(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddNewPresentationParams params) async {
    return _dataRepository.addNewPresentation(params.toMap());
  }
}

class AddNewPresentationParams {
  final String name;
  final int module;
  final int? area;
  final List<String> tags;
  final int? id;

  AddNewPresentationParams(
      {required this.name,
      required this.module,
      this.area,
      this.id,
      required this.tags});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'name': name,
      'module': module,
      'area': area,
      'tags': tags,
    };
  }

  factory AddNewPresentationParams.fromMap(Map<String, dynamic> map) {
    return AddNewPresentationParams(
      id: map["id"],
      name: map['name'] ?? '',
      module: map['module']?.toInt() ?? 0,
      area: map['area']?.toInt() ?? 0,
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddNewPresentationParams.fromJson(String source) =>
      AddNewPresentationParams.fromMap(json.decode(source));
}
