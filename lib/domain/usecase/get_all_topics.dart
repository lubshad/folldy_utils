import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

import '../../data/models/topic_list_response.dart';

class GetAllTopics extends UseCase<List<Topic>, NoParams> {
  final DataRepository _dataRepository;

  GetAllTopics(this._dataRepository);
  @override
  Future<Either<AppError, List<Topic>>> call(NoParams params) async {
    return _dataRepository.listTopics(params.toJson());
  }
}
