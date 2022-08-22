import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class ChangeSubject extends UseCase<dynamic, ChangeSubjectParams> {
  final DataRepository _dataRepository;

  ChangeSubject(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(ChangeSubjectParams params) async {
    return _dataRepository.changeSubject(params.toMap());
  }
}

enum SubjectPopupOption {
  removeFromWall,
  addToWall,
  remove,
  publishingDays,
}

extension SubjectPopupExtension on SubjectPopupOption {
  String get text {
    switch (this) {
      case SubjectPopupOption.removeFromWall:
        return "Remove from wall";
      case SubjectPopupOption.addToWall:
        return "Add to wall";
      case SubjectPopupOption.remove:
        return "Remove";
      case SubjectPopupOption.publishingDays:
        return "Publishing Days";
    }
  }
}

class ChangeSubjectParams {
  final SubjectPopupOption subjectPopupOption;
  final int subjectId;
  final int facultyId;
  final int batchId;

  ChangeSubjectParams(
      {required this.subjectPopupOption,
      required this.subjectId,
      required this.batchId,
      required this.facultyId});

  toMap() {
    return {
      "subject_popup_option": subjectPopupOption.index,
      "subjectId": subjectId,
      "facultyId": facultyId,
      "batchId": batchId,
    };
  }
}
