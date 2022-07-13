
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
  // final int subjectId;
  // final int module;
  final List<int> presentationIds;
  final int module;

  ListReadmodeParams({
    // required this.subjectId,
    // required this.module,
    required this.presentationIds,
    required this.module,
  });

  toMap() {
    return {
      // "subjectId": subjectId,
      "module": module,
      "presentationIds": presentationIds
    };
  }
}
