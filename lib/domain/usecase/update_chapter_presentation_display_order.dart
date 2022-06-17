import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class UpdateChapterPresentationDisplayOrder
    extends UseCase<dynamic, UpdateChapterPresentationDisplayOrderParams> {
  final DataRepository _dataRepository;

  UpdateChapterPresentationDisplayOrder(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      UpdateChapterPresentationDisplayOrderParams params) async {
    return _dataRepository
        .updateChapterPresentationDisplayOrder(params.toMap());
  }
}

class UpdateChapterPresentationDisplayOrderParams {
  final int chapterId;
  final List<int> presentationIds;

  UpdateChapterPresentationDisplayOrderParams({
    required this.chapterId,
    required this.presentationIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'chapterId': chapterId,
      'presentationIds': presentationIds,
    };
  }
}
