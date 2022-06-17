import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetChapterPresentations
    extends UseCase<dynamic, GetChapterPresentationsParams> {
  final DataRepository _dataRepository;

  GetChapterPresentations(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      GetChapterPresentationsParams params) async {
    return _dataRepository.getChapterPresentations(params.toMap());
  }
}

class GetChapterPresentationsParams {
  final int chapterId;

  GetChapterPresentationsParams({required this.chapterId});

  Map<String, dynamic> toMap() {
    return {
      'chapterId': chapterId,
    };
  }
}
