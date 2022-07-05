import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class LoadMorePresentations
    extends UseCase<dynamic, LoadMorePresentationParams> {
  final DataRepository _dataRepository;

  LoadMorePresentations(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      LoadMorePresentationParams params) async {
    return _dataRepository.loadMorePresentations(params.toMap());
  }
}

enum LoadMoreType { top, bottom }

class LoadMorePresentationParams {
  final int presentationId;
  final LoadMoreType loadMoreType;
  final int subjectId;

  LoadMorePresentationParams(
      {required this.presentationId, required this.loadMoreType , required this.subjectId});

  toMap() {
    return {"presentationId": presentationId, "type": loadMoreType.index , "subjectId": subjectId};
  }
}
