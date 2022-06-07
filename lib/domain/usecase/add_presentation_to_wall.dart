import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class AddPresentationToWall
    extends UseCase<Map<String, dynamic>, AddPresentationToWallParams> {
  final DataRepository _dataRepository;

  AddPresentationToWall(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddPresentationToWallParams params) async {
    return _dataRepository.addPresentationToWall(params.toMap());
  }
}

class AddPresentationToWallParams {
  final int presentationId;
  final int subjectId;

  AddPresentationToWallParams(
      {required this.presentationId, required this.subjectId});

  Map<String, dynamic> toMap() {
    return {'presentationId': presentationId, "subjectId": subjectId};
  }
}
