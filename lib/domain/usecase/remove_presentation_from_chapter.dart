import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class RemovePresentationFromChapter
    extends UseCase<Map<String, dynamic>, RemovePresentationFromChapterParams> {
  final DataRepository _dataRepository;

  RemovePresentationFromChapter(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      RemovePresentationFromChapterParams params) async {
    return _dataRepository.removePresentationFromChapter(params.toMap());
  }
}

class RemovePresentationFromChapterParams {
  final int chapterId;
  final int presentationId;

  RemovePresentationFromChapterParams(
      {required this.chapterId, required this.presentationId});

  Map<String, dynamic> toMap() {
    return {
      "chapterId": chapterId,
      "presentationId": presentationId,
    };
  }
}
