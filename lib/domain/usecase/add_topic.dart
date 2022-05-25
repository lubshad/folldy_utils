import 'package:basic_template/basic_template.dart';

import 'package:folldy_utils/domain/repositories/data_repository.dart';

import '../../data/models/topic_list_response.dart';

class AddNewTopic extends UseCase<Map<String, dynamic>, Topic> {
  final DataRepository _dataRepository;

  AddNewTopic(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(Topic params) async {
    return _dataRepository.addNewTopic(params.toJson());
  }
}
