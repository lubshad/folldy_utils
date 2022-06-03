

import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';


class GetAllPagesArguments {
  final int presentationId;

  GetAllPagesArguments(this.presentationId);

  Map<String, dynamic> toJson() => {
    'presentation_id': presentationId,
  };
}

class GetAllPages extends UseCase<dynamic, GetAllPagesArguments> {
  final DataRepository _dataRepository;

  GetAllPages(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(GetAllPagesArguments params) async {
    return _dataRepository.getAllPages(params.toJson());
  }
}
