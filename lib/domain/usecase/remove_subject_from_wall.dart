// import 'package:basic_template/basic_template.dart';
// import '../repositories/data_repository.dart';

// class RemoveSubjectFromWall extends UseCase<dynamic, RemoveSubjectParams> {
//   final DataRepository _dataRepository;
//   RemoveSubjectFromWall(this._dataRepository);
//   @override
//   Future<Either<AppError, dynamic>> call(RemoveSubjectParams params) async {
//     return _dataRepository.removeSubjectFromWall(params.toJson());
//   }
// }

// class RemoveSubjectParams {
//   final int subjectId;

//   RemoveSubjectParams({required this.subjectId});
//   toJson() {
//     return {
//       "subjectId" : subjectId
//     };
//   }
// }
