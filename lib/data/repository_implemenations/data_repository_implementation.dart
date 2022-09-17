import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/data/models/area_list_response.dart';
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
  Future<Either<AppError, Map<String, dynamic>>> addEditBatch(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.addEditBatch(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> listInstitutionBatches(
      Map<String, dynamic> map) async {
    return await exceptionHandler(
        _remoteDataSource.listInstitutionBatches(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> getBatchDetails(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.getBatchDetails(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> getSubjectDetails(
      Map<String, dynamic> map) async {
    return exceptionHandler(_remoteDataSource.getSubjectDetails(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> userLogin(
      Map<String, dynamic> map) async {
    return exceptionHandler(_remoteDataSource.userLogin(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> assignSubjectToFaculty(
      Map<String, dynamic> map) async {
    return await exceptionHandler(
        _remoteDataSource.assignSubjectToFaculty(map));
  }

  @override
  Future<Either<AppError, dynamic>> getUserDashboard(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.getUserDashboard(map));
  }

  @override
  Future<Either<AppError, dynamic>> getAllPages(
      Map<String, dynamic> json) async {
    return await exceptionHandler(_remoteDataSource.getAllPages(json));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> getAllRecordedPresentations(
      json) async {
    return await exceptionHandler(
        _remoteDataSource.getAllRecordedPresentations(json));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> deleteRecordedAudio(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.deleteRecordedAudio(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> changeLiveSemester(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.changeLiveSemester(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addPresentationToWall(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.addPresentationToWall(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> addTeachersToBatch(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.addTeachersToBatch(map));
  }

  @override
  Future<Either<AppError, dynamic>> updateChapterPresentationDisplayOrder(
      Map<String, dynamic> map) async {
    return exceptionHandler(
        _remoteDataSource.updateChapterPresentationDisplayOrder(map));
  }

  @override
  Future<Either<AppError, dynamic>> getChapterPresentations(
      Map<String, dynamic> map) async {
    return exceptionHandler(_remoteDataSource.getChapterPresentations(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> removePresentationFromChapter(
      Map<String, dynamic> map) async {
    return exceptionHandler(
        _remoteDataSource.removePresentationFromChapter(map));
  }

  @override
  Future<Either<AppError, dynamic>> getReadModeElements(
      Map<String, dynamic> params) async {
    return await exceptionHandler(
        _remoteDataSource.getReadModeElements(params));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> checkRegisteredUser(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.checkRegisteredUser(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> registerUser(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.registerUser(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> joinBatch(
      Map<String, dynamic> json) async {
    return await exceptionHandler(_remoteDataSource.joinBatch(json));
  }

  @override
  Future<Either<AppError, dynamic>> loadMorePresentations(map) async {
    return await exceptionHandler(_remoteDataSource.loadMorePresentations(map));
  }

  @override
  Future<Either<AppError, dynamic>> updateAndroidSettings(map) async {
    return await exceptionHandler(_remoteDataSource.updateAndroidSettings(map));
  }

  @override
  Future<Either<AppError, dynamic>> fetchAndroidSettings(json) async {
    return await exceptionHandler(_remoteDataSource.fetchAndroidSettings(json));
  }

  @override
  Future<Either<AppError, dynamic>> checkVersion(map) async {
    return await exceptionHandler(_remoteDataSource.checkVersion(map));
  }

  @override
  Future<Either<AppError, dynamic>> listReadmodeItems(map) async {
    return await exceptionHandler(_remoteDataSource.listReadmodeItems(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> joinBatchRequest(map) async {
    return await exceptionHandler(_remoteDataSource.joinBatchRequest(map));
  }

  @override
  Future<Either<AppError, dynamic>> listJoinRequests(map) async {
    return await exceptionHandler(_remoteDataSource.listJoinRequests(map));
  }

  @override
  Future<Either<AppError, dynamic>> updateRequestStatus(map) async {
    return await exceptionHandler(_remoteDataSource.updateRequestStatus(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> adminLogin(map) async {
    return await exceptionHandler(_remoteDataSource.adminLogin(map));
  }

  @override
  Future<Either<AppError, dynamic>> listAllUsers(map) async {
    return await exceptionHandler(_remoteDataSource.listAllUsers(map));
  }

  @override
  Future<Either<AppError, dynamic>> createNewUser(map) async {
    return await exceptionHandler(_remoteDataSource.createNewUser(map));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> adminLogout(json) async {
    return await exceptionHandler(_remoteDataSource.adminLogout(json));
  }

  @override
  Future<Either<AppError, dynamic>> changeSubject(map) async {
    return await exceptionHandler(_remoteDataSource.changeSubject(map));
  }

  @override
  Future<Either<AppError, dynamic>> fetchBatchDetails(map) async {
    return await exceptionHandler(_remoteDataSource.fetchBatchDetails(map));
  }

  @override
  Future<Either<AppError, dynamic>> leaveBatch(json) async {
    return await exceptionHandler(_remoteDataSource.leaveBatch(json));
  }

  @override
  Future<Either<AppError, dynamic>> removeUserFromBatch(json) async {
    return await exceptionHandler(_remoteDataSource.removeUserFromBatch(json));
  }

  @override
  Future<Either<AppError, dynamic>> makeFacultyBatchAdmin(json) async {
    return await exceptionHandler(
        _remoteDataSource.makeFacultyBatchAdmin(json));
  }

  @override
  Future<Either<AppError, dynamic>> fetchProfileDetails(json) async {
    return await exceptionHandler(_remoteDataSource.fetchProfileDetails(json));
  }

  @override
  Future<Either<AppError, dynamic>> updateContent(json) async {
    return await exceptionHandler(_remoteDataSource.updateContent(json));
  }

  @override
  Future<Either<AppError, dynamic>> changeInsitution(json) async {
    return await exceptionHandler(_remoteDataSource.changeInstitution(json));
  }

  @override
  Future<Either<AppError, dynamic>> fetchBatchSettings(json) async {
    return await exceptionHandler(_remoteDataSource.fetchBatchSettings(json));
  }

  @override
  Future<Either<AppError, dynamic>> closeSemester(json) async {
    return await exceptionHandler(_remoteDataSource.closeSemester(json));
  }

  @override
  Future<Either<AppError, dynamic>> updateBatchStatus(json) async {
    return await exceptionHandler(_remoteDataSource.updateBatchStatus(json));
  }

  @override
  Future<Either<AppError, dynamic>> updateSubjectSettings(json) async {
    return await exceptionHandler(
        _remoteDataSource.updateSubjectSettings(json));
  }

  @override
  Future<Either<AppError, dynamic>> fetchSubjectSettings(json) async {
    return await exceptionHandler(_remoteDataSource.fetchSubjectSettings(json));
  }

  @override
  Future<Either<AppError, dynamic>> suspendStudent(json) async {
    return await exceptionHandler(_remoteDataSource.suspendStudent(json));
  }

  @override
  Future<Either<AppError, dynamic>> dontPublishToday(json) async {
    return await exceptionHandler(_remoteDataSource.dontPublishToday(json));
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> changeAudioState(
      Map<String, dynamic> map) async {
    return await exceptionHandler(_remoteDataSource.cahngeAudioState(map));
  }

  @override
  Future<Either<AppError, dynamic>> copySubject(json) async {
    return await exceptionHandler(_remoteDataSource.copySubject(json));
  }

  @override
  Future<Either<AppError, dynamic>> getAppUrls(json) async {
    return await exceptionHandler(_remoteDataSource.getAppUrls(json));
  }

  // @override
  // Future<Either<AppError, dynamic>> removeSubjectFromWall(json) async {
  //   return await exceptionHandler(_remoteDataSource.removeSubjectFromWall(json));
  // }
}
