import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class CheckVersion extends UseCase<dynamic, CheckVersionParams> {
  final DataRepository _dataRepository;

  CheckVersion(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(CheckVersionParams params) async {
    return _dataRepository.checkVersion(params.toMap());
  }
}

enum DevicePlatform {
  android,
  ios,
  web,
}

class CheckVersionParams {
  final int buildNumber;
  final DevicePlatform platform;
  final int? userId;
  final String? fcmToken;

  CheckVersionParams({
    required this.buildNumber,
    required this.platform,
    required this.fcmToken,
    required this.userId,
  });
  toMap() {
    return {
      "buildNumber": buildNumber,
      "platform": platform.index,
      "userId": userId,
      "fcmToken": fcmToken,
    };
  }
}
