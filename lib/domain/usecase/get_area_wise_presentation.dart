import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetAreawisePresentaions
    extends UseCase<dynamic, NoParams> {
  final DataRepository _dataRepository;

  GetAreawisePresentaions(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(
      NoParams params) async {
    return _dataRepository.getAreaWisePresentations(params.toJson());
  }
}