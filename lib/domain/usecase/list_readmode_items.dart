import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class ListReadmodeItems extends UseCase<dynamic, ListReadmodeParams> {
  final DataRepository _dataRepository;

  ListReadmodeItems(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(ListReadmodeParams params) async {
    return _dataRepository.listReadmodeItems(params.toMap());
  }
}

class ListReadmodeParams {
  final List<int> presentationIds;

  ListReadmodeParams({
    required this.presentationIds,
  });

  toMap() {
    return {
      "presentationIds": presentationIds
    };
  }
}
