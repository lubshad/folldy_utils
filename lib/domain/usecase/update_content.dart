import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class UpdateContent extends UseCase<dynamic, UpdateContentParams> {
  final DataRepository _dataRepository;
  UpdateContent(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(UpdateContentParams params) async {
    return _dataRepository.updateContent(params.toJson());
  }
}

class UpdateContentParams {
  final List newElements;
  final int fullPresentationId;

  UpdateContentParams({required this.newElements, required this.fullPresentationId});
  toJson() {
    return {
      "newElements": newElements,
      "fullPresentationId": fullPresentationId,
    };
  }
}
