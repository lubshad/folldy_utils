import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/domain/repositories/data_repository.dart';

class ListJoinRequests extends UseCase<dynamic, JoinRequestListingArguments> {
  ListJoinRequests(this._dataRepository);
  final DataRepository _dataRepository;

  @override
  Future<Either<AppError, dynamic>> call(
      JoinRequestListingArguments params) async {
    return _dataRepository.listJoinRequests(params.toMap());
  }
}

enum RequestPopupItem { approve, decline }

extension RequestPopupItemExtension on RequestPopupItem {
  String get text {
    switch (this) {
      case RequestPopupItem.approve:
        return "Approve";
      case RequestPopupItem.decline:
        return "Decline";
    }
  }


}

enum RequestListingType {
  teachers,
  students,
}

class JoinRequestListingArguments {
  final RequestListingType type;
  final int batchId;

  JoinRequestListingArguments({required this.type, required this.batchId});

  toMap() {
    return {
      "batchId": batchId,
      "type": type.index,
    };
  }
}
