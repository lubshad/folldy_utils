import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/data/models/area_list_response.dart';
import 'package:folldy_utils/data/models/batch_list_response.dart';
import 'package:folldy_utils/data/models/chapter_list_response.dart';
import 'package:folldy_utils/data/models/course_list_response.dart';
import 'package:folldy_utils/data/models/institution_list_response.dart';
import 'package:folldy_utils/data/models/subject_list_response.dart';
import 'package:folldy_utils/data/models/faculty_list_response.dart';
import 'package:folldy_utils/data/models/topic_list_response.dart';

import '../../domain/repositories/data_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../models/university_list_response.dart';

class DataRepositoryImplementation extends DataRepository
    with RepositoryExceptionMixin {
  final RemoteDataSource _remoteDataSource;

  DataRepositoryImplementation(this._remoteDataSource);

  @override
  Future<Either<AppError, Map<String, dynamic>>> addUniversity(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.addUniversity(params));
  }

  @override
  Future<Either<AppError, List<Chapter>>> listChapters(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.listChapters(params));
  }

  @override
  Future<Either<AppError, List<Subject>>> listSubjects(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.listSubjects(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addNewChapter(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.addNewChapter(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteChapter(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.deleteChapter(params));
  }

  @override
  Future<Either<AppError, List<Course>>> listCourses(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.listCourses(params));
  }

  @override
  Future<Either<AppError, List<Institution>>> listInstitutions(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.listInstitutions(params));
  }

  @override
  Future<Either<AppError, List<University>>> listUniversitys(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.listUniversitys(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addNewCourse(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.addNewCourse(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteCourse(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.deleteCourse(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addNewInstitution(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.addNewInstitution(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteInstitution(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.deleteInstitution(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addNewSubject(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.addNewSubject(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteSubject(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.deleteSubject(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addNewTopic(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.addNewTopic(params));
  }

  @override
  Future<Either<AppError, List<Topic>>> listTopics(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.listTopicss(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteTopic(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.deleteTopic(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteUniversity(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.deleteUniversity(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> uploadFile(
      UploadFileParams params) async {
    return await exceptionHandler(_remoteDataSource.uploadFile(params));
  }

  @override
  Future<Either<AppError, List<Faculty>>> listFacultys(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.listFacultys(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteFaculty(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.deleteFaculty(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addNewPresentation(
      Map<String, dynamic> params) async {
    return await exceptionHandler(_remoteDataSource.addNewPresentation(params));
  }

  @override
  Future<Either<AppError, List<Area>>> listAreas(
      Map<String, dynamic> json) async {
    return await exceptionHandler(_remoteDataSource.listAreas(json));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addNewArea(
      UploadFileParams json) async {
    return await exceptionHandler(_remoteDataSource.addNewArea(json));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteArea(
      Map<String, dynamic> json) async {
    return await exceptionHandler(_remoteDataSource.deleteArea(json));
  }

  @override
  Future<Either<AppError, List<dynamic>>> getAllPresentations(
      Map<String, dynamic> json) async {
    return await exceptionHandler(_remoteDataSource.getAllPresentations(json));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deletePresentation(
      Map<String, dynamic> json) async {
    return await exceptionHandler(_remoteDataSource.deletePresentation(json));
  }

  @override
  Future<Either<AppError, dynamic>> addPresentationsToChapter(json) async {
    return await exceptionHandler(
        _remoteDataSource.addPresentationsToChapter(json));
  }

  @override
  Future<Either<AppError, dynamic>> addAreaToSubject(json) async {
    return await exceptionHandler(_remoteDataSource.addAreaToSubject(json));
  }

  @override
  Future<Either<AppError, dynamic>> getAreaWisePresentations(json) async {
    return await exceptionHandler(
        _remoteDataSource.getAreaWisePresentations(json));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addFaculty(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.addFaculty(map));
  }
  
  @override
  Future<Either<AppError, Map<String, dynamic>>> addEditBatch(Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.addEditBatch(map));
  }
  
  @override
  Future<Either<AppError, List<Batch>>> listInstitutionBatches(Map<String, dynamic> map)async {
    return await exceptionHandler(_remoteDataSource.listInstitutionBatches(map));
    
  }
  
  @override
  Future<Either<AppError, Map<String, dynamic>>> getBatchDetails(Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.getBatchDetails(map));
  }
  
  @override
  Future<Either<AppError, Map<String, dynamic>>> getSubjectDetails(Map<String, dynamic> map)async {
    return exceptionHandler(_remoteDataSource.getSubjectDetails(map));
  }
  
  @override
  Future<Either<AppError, Map<String, dynamic>>> institutionFacultyLogin(Map<String, dynamic> map)async {
    return exceptionHandler(_remoteDataSource.institutionFacultyLogin(map));
  }
  
  @override
  Future<Either<AppError, Map<String, dynamic>>> assignSubjectToFaculty(Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.assignSubjectToFaculty(map));
    
  }
  
  @override
  Future<Either<AppError, dynamic>> getFacultyDashboard(Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.getFacultyDashboard(map));
  }
  
  @override
  Future<Either<AppError, dynamic>> getAllPages(Map<String, dynamic> json) async {
    return await exceptionHandler(_remoteDataSource.getAllPages(json));

  }
  
  @override
  Future<Either<AppError, Map<String, dynamic>>> getAllRecordedPresentations(json) async {
    return await exceptionHandler(_remoteDataSource.getAllRecordedPresentations(json));
  }
}
