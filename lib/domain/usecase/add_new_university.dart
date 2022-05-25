import 'dart:convert';

import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class AddNewUniversity
    extends UseCase<Map<String, dynamic>, AddUniversityParams> {
  final DataRepository _dataRepository;

  AddNewUniversity(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddUniversityParams params) async {
    return _dataRepository.addUniversity(params.toMap());
  }
}

class AddUniversityParams {
  final String name;
  final int? id;

  AddUniversityParams({required this.name, this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  factory AddUniversityParams.fromMap(Map<String, dynamic> map) {
    return AddUniversityParams(
      name: map['name'] ?? '',
      id: map['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddUniversityParams.fromJson(String source) =>
      AddUniversityParams.fromMap(json.decode(source));
}
