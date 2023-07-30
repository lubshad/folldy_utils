import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetAllPagesArguments {
  final int presentationId;
  final DateTime updatedAt;

  GetAllPagesArguments({required this.presentationId, required this.updatedAt});

  Map<String, dynamic> toJson() => {
        'presentation_id': presentationId,
        "updated_at": updatedAt
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
