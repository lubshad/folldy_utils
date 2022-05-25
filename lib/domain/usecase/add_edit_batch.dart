import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

import '../repositories/data_repository.dart';

class AddEditBatch extends UseCase<Map<String, dynamic>, AddEditBatchParams> {
  final DataRepository _dataRepository;

  AddEditBatch(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(
      AddEditBatchParams params) async {
    return _dataRepository.addEditBatch(params.toMap());
  }
}

class AddEditBatchParams {
  final DateTimeRange duration;
  final String batchName;
  final int courseId;
  final int institutionId;
  final int? id;

  AddEditBatchParams(
      {required this.duration,
      required this.batchName,
      required this.courseId,
      required this.institutionId,
      required this.id});

  Map<String, dynamic> toMap() {
    return {
      "start": dateFieldFromDateTime(duration.start),
      'name': batchName,
      "end": dateFieldFromDateTime(duration.end),
      'course': courseId,
      'institution': institutionId,
      'id': id,
    };
  }
}
