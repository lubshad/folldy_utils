import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class DeleteRecordedAudio
    extends UseCase<Map<String, dynamic>, DeleteRecordedAudioParams> {
  final DataRepository _dataRepository;

  DeleteRecordedAudio(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      DeleteRecordedAudioParams params) async {
    return _dataRepository.deleteRecordedAudio(params.toMap());
  }
}

class DeleteRecordedAudioParams {
  final String audioId;

  DeleteRecordedAudioParams({required this.audioId});

  Map<String, dynamic> toMap() {
    return {
      'audioId': audioId,
    };
  }
}
