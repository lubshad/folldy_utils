import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

class ChangeAudioState extends UseCase<dynamic, ChangeAudioStateParams> {
  final DataRepository _dataRepository;

  ChangeAudioState(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      ChangeAudioStateParams params) async {
    return _dataRepository.changeAudioState(params.toMap());
  }
}

class ChangeAudioStateParams {
  final int audioId;
  final AudioState audioState;

  ChangeAudioStateParams({
    required this.audioId,
    required this.audioState,
  });

  Map<String, dynamic> toMap() {
    return {
      'audioId': audioId,
      "audioState": audioState.index,
    };
  }
}






enum AudioState {
  unPublished,
  published,
  deleted,
}

extension AudioStateExtension on AudioState {
  String get text {
    switch (this) {
      case AudioState.unPublished:
        return "Un-Publish";
      case AudioState.published:
        return "Publish";
      case AudioState.deleted:
        return "Delete";
    }
  }
}