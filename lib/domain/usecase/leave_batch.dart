import 'package:basic_template/basic_template.dart';
import '../repositories/data_repository.dart';

class GetAllAreas extends UseCase<dynamic, NoParams> {
  final DataRepository _dataRepository;

  GetAllAreas(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(NoParams params) async {
    return _dataRepository.listAreas(params.toJson());
  }
}