import 'dart:convert';

import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class AddNewInstitution
    extends UseCase<Map<String, dynamic>, AddInstitutionParams> {
  final DataRepository _dataRepository;

  AddNewInstitution(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddInstitutionParams params) async {
    return _dataRepository.addNewInstitution(params.toMap());
  }
}

class AddInstitutionParams {
  final String name;
  final int? id;

  AddInstitutionParams({required this.name, this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  factory AddInstitutionParams.fromMap(Map<String, dynamic> map) {
    return AddInstitutionParams(
      name: map['name'] ?? '',
      id: map['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddInstitutionParams.fromJson(String source) =>
      AddInstitutionParams.fromMap(json.decode(source));
}
