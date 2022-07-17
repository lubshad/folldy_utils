import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/domain/usecase/list_join_requests.dart';

import '../repositories/data_repository.dart';

class UpdateRequestStatus extends UseCase<dynamic, UpdateRequestStatusParams> {
  UpdateRequestStatus(this._dataRepository);
  final DataRepository _dataRepository;

  @override
  Future<Either<AppError, dynamic>> call(
      UpdateRequestStatusParams params) async {
    return _dataRepository.updateRequestStatus(params.toMap());
  }
}

class UpdateRequestStatusParams {
  final RequestPopupItem action;
  final int requestId;

  UpdateRequestStatusParams({required this.action, required this.requestId});

  toMap() {
    return {
      "action": action.index,
      "requestId": requestId,
    };
  }
}
