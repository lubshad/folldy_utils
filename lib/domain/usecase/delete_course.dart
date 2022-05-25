import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

import '../../data/models/course_list_response.dart';

class DeleteCourse extends UseCase<Map<String, dynamic>, Course> {
  final DataRepository _dataRepository;

  DeleteCourse(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(Course params) async {
    return _dataRepository.deleteCourse(params.toJson());
  }
}
