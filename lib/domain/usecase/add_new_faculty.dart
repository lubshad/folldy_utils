
import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class AddNewFaculty extends UseCase<Map<String, dynamic>, AddFacultyParams> {
  final DataRepository _dataRepository;

  AddNewFaculty(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddFacultyParams params) async {
    return _dataRepository.addFaculty(params.toMap());
  }
}

class AddFacultyParams {
  final String name;
  final String phone;
  final int? id;
  final int institution;

  AddFacultyParams(
      {required this.name,
      required this.phone,
      this.id,
      required this.institution});

  Map<String, dynamic> toMap() {
    return {
      "institution": institution,
      'username': name,
      'phone': phone,
      'id': id,
    };
  }
}
