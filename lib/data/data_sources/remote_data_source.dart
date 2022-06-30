import 'dart:async';

import 'package:basic_template/basic_template.dart';
import 'package:folldy_utils/data/models/area_list_response.dart';
import 'package:folldy_utils/data/models/chapter_list_response.dart';
import 'package:folldy_utils/data/models/course_list_response.dart';
import 'package:folldy_utils/data/models/institution_list_response.dart';
import 'package:folldy_utils/data/models/subject_list_response.dart';
import 'package:folldy_utils/data/models/faculty_list_response.dart';
import 'package:folldy_utils/data/models/topic_list_response.dart';
import 'package:folldy_utils/data/models/university_list_response.dart';

import '../core/api_constants.dart';

abstract class RemoteDataSource {
  Future<Map<String, dynamic>> addUniversity(Map<String, dynamic> params);

  Future<List<Chapter>> listChapters(Map<String, dynamic> params);
  Future<List<Subject>> listSubjects(Map<String, dynamic> params);

  Future<Map<String, dynamic>> addNewChapter(Map<String, dynamic> params);

  Future<Map<String, dynamic>> deleteChapter(Map<String, dynamic> params);

  Future<List<University>> listUniversitys(Map<String, dynamic> params);

  Future<List<Institution>> listInstitutions(Map<String, dynamic> params);

  Future<List<Course>> listCourses(Map<String, dynamic> params);

  Future<Map<String, dynamic>> deleteCourse(Map<String, dynamic> params);

  Future<Map<String, dynamic>> addNewCourse(Map<String, dynamic> params);

  Future<Map<String, dynamic>> deleteInstitution(Map<String, dynamic> params);

  Future<Map<String, dynamic>> addNewInstitution(Map<String, dynamic> params);

  Future<Map<String, dynamic>> addNewSubject(Map<String, dynamic> params);

  Future<Map<String, dynamic>> deleteSubject(Map<String, dynamic> params);

  Future<Map<String, dynamic>> addNewTopic(Map<String, dynamic> params);

  Future<List<Topic>> listTopicss(Map<String, dynamic> params);

  Future<Map<String, dynamic>> deleteTopic(Map<String, dynamic> params);

  Future<Map<String, dynamic>> deleteUniversity(Map<String, dynamic> params);

  Future<Map<String, dynamic>> uploadFile(UploadFileParams params);

  Future<List<Faculty>> listFacultys(Map<String, dynamic> params);

  Future<Map<String, dynamic>> addNewFaculty(UploadFileParams params);

  Future<Map<String, dynamic>> deleteFaculty(Map<String, dynamic> params);

  Future<Map<String, dynamic>> addNewPresentation(Map<String, dynamic> params);

  Future<List<Area>> listAreas(Map<String, dynamic> json);

  Future<dynamic> addNewArea(UploadFileParams json);

  Future<dynamic> deleteArea(Map<String, dynamic> json);

  Future<List<dynamic>> getAllPresentations(Map<String, dynamic> json);

  Future<dynamic> deletePresentation(Map<String, dynamic> json);

  FutureOr addPresentationsToChapter(json);

  FutureOr addAreaToSubject(json);

  FutureOr getAreaWisePresentations(json);

  FutureOr addFaculty(Map<String, dynamic> map);

  FutureOr addEditBatch(Map<String, dynamic> map);

  FutureOr listInstitutionBatches(Map<String, dynamic> map);

  FutureOr getBatchDetails(Map<String, dynamic> map);

  FutureOr getSubjectDetails(Map<String, dynamic> map);

  FutureOr institutionFacultyLogin(Map<String, dynamic> map);

  FutureOr assignSubjectToFaculty(Map<String, dynamic> map);

  FutureOr getFacultyDashboard(Map<String, dynamic> map);

  FutureOr getAllPages(Map<String, dynamic> json);

  FutureOr getAllRecordedPresentations(json);

  FutureOr deleteRecordedAudio(Map<String, dynamic> map);

  FutureOr changeLiveSemester(Map<String, dynamic> map);

  FutureOr addPresentationToWall(Map<String, dynamic> map);

  FutureOr addTeachersToBatch(Map<String, dynamic> map);

  FutureOr updateChapterPresentationDisplayOrder(Map<String, dynamic> map);

  FutureOr getChapterPresentations(Map<String, dynamic> map);

  FutureOr removePresentationFromChapter(Map<String, dynamic> map);

  FutureOr getReadModeElements(Map<String, dynamic> params);

  FutureOr checkRegisteredUser(Map<String, dynamic> map);

  FutureOr registerStudent(Map<String, dynamic> map) {}

  FutureOr studentLogin(Map<String, dynamic> map);

  FutureOr getStudentDashboard(Map<String, dynamic> map);

  FutureOr registerTeacher(Map<String, dynamic> map);

  FutureOr joinBatch(Map<String, dynamic> json);
}

class RemoteDataSourceImplementation implements RemoteDataSource {
  final ApiClient _apiClient;

  RemoteDataSourceImplementation(this._apiClient);

  @override
  Future<Map<String, dynamic>> addUniversity(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addUniversity, params);
    return response;
  }

  @override
  Future<List<Chapter>> listChapters(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.listChapters, params);
    return chapterFromJson(response);
  }

  @override
  Future<List<Subject>> listSubjects(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.listSubjects, params);
    return subjectFromJson(response);
  }

  @override
  Future<Map<String, dynamic>> addNewChapter(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addNewChapter, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> deleteChapter(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.deleteChapter, params);
    return response;
  }

  @override
  Future<List<Course>> listCourses(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.listCourses, params);
    return courseFromJson(response);
  }

  @override
  Future<List<Institution>> listInstitutions(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.institutionList, params);
    return institutionFromJson(response);
  }

  @override
  Future<List<University>> listUniversitys(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.universityList, params);
    return universityFromJson(response);
  }

  @override
  Future<Map<String, dynamic>> addNewCourse(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addNewCourse, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> deleteCourse(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.deleteCourse, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> addNewInstitution(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.addNewInstitution, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> deleteInstitution(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.deleteInstitution, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> addNewSubject(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addNewSubject, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> deleteSubject(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.deleteSubject, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> addNewTopic(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.addNewTopic, params);
    return response;
  }

  @override
  Future<List<Topic>> listTopicss(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.listAllTopic, params);
    return topicListResponseFromJson(response);
  }

  @override
  Future<Map<String, dynamic>> deleteTopic(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.deleteTopic, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> deleteUniversity(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.deleteUniversity, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> uploadFile(UploadFileParams params) async {
    final response = await _apiClient.formData(
        data: params.data, files: params.files, path: params.path);
    return response;
  }

  @override
  Future<List<Faculty>> listFacultys(params) async {
    final response =
        await _apiClient.post(ApiConstants.listAllFacultys, params);
    return teacherListResponseFromJson(response);
  }

  @override
  Future<Map<String, dynamic>> addNewFaculty(UploadFileParams params) async {
    final response = await _apiClient.formData(
        data: params.data,
        files: params.files,
        path: ApiConstants.addNewFaculty);
    return response;
  }

  @override
  Future<Map<String, dynamic>> deleteFaculty(
      Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.deleteFaculty, params);
    return response;
  }

  @override
  Future<Map<String, dynamic>> addNewPresentation(
      Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.addNewpresentation, params);
    return response;
  }

  @override
  Future<List<Area>> listAreas(Map<String, dynamic> json) async {
    final response = await _apiClient.post(ApiConstants.listAllAreas, json);
    return areaListResponseFromJson(response);
  }

  @override
  Future addNewArea(UploadFileParams json) async {
    final response = await _apiClient.formData(
        data: json.data, files: json.files, path: ApiConstants.addNewArea);
    return response;
  }

  @override
  Future deleteArea(Map<String, dynamic> json) async {
    final response = await _apiClient.post(ApiConstants.deleteArea, json);
    return response;
  }

  @override
  Future<List<dynamic>> getAllPresentations(Map<String, dynamic> json) async {
    final response =
        await _apiClient.post(ApiConstants.listAllpresentations, json);
    return response;
  }

  @override
  Future deletePresentation(Map<String, dynamic> json) async {
    final response =
        await _apiClient.post(ApiConstants.deletepresentation, json);
    return response;
  }

  @override
  FutureOr addPresentationsToChapter(json) async {
    final response = await _apiClient.post(ApiConstants.addPresentations, json);
    return response;
  }

  @override
  FutureOr addAreaToSubject(json) async {
    final response = await _apiClient.post(ApiConstants.addAreaToSubject, json);
    return response;
  }

  @override
  FutureOr getAreaWisePresentations(json) async {
    final response =
        await _apiClient.post(ApiConstants.getAreaWisePresentations, json);
    return response;
  }

  @override
  FutureOr addFaculty(Map<String, dynamic> map) async {
    final response = await _apiClient.post(ApiConstants.addNewFaculty, map);
    return response;
  }

  @override
  FutureOr addEditBatch(Map<String, dynamic> map) async {
    final response = await _apiClient.post(ApiConstants.addEditBatch, map);
    return response;
  }

  @override
  FutureOr<Map<String, dynamic>> listInstitutionBatches(
      Map<String, dynamic> map) async {
    final response =
        await _apiClient.post(ApiConstants.listInstitutionBatches, map);
    return response;
  }

  @override
  FutureOr getBatchDetails(Map<String, dynamic> map) {
    final response = _apiClient.post(ApiConstants.getBatchDetails, map);
    return response;
  }

  @override
  FutureOr getSubjectDetails(Map<String, dynamic> map) async {
    final response = _apiClient.post(ApiConstants.getSubjectDetails, map);
    return response;
  }

  @override
  FutureOr institutionFacultyLogin(Map<String, dynamic> map) async {
    final response =
        await _apiClient.post(ApiConstants.institutionFacultyLogin, map);
    return response;
  }

  @override
  FutureOr assignSubjectToFaculty(Map<String, dynamic> map) async {
    final response =
        await _apiClient.post(ApiConstants.assignSubjectToFaculty, map);
    return response;
  }

  @override
  FutureOr getFacultyDashboard(Map<String, dynamic> map) async {
    final response =
        await _apiClient.post(ApiConstants.getFacultyDashboard, map);
    return response;
  }

  @override
  FutureOr getAllPages(Map<String, dynamic> json) async {
    final response = await _apiClient.post(ApiConstants.getAllPages, json);
    return response;
  }

  @override
  FutureOr getAllRecordedPresentations(json) async {
    final response =
        await _apiClient.post(ApiConstants.getAllRecordedPresentations, json);
    return response;
  }

  @override
  FutureOr deleteRecordedAudio(Map<String, dynamic> map) async {
    final response =
        await _apiClient.post(ApiConstants.deleteRecordedAudio, map);
    return response;
  }

  @override
  FutureOr changeLiveSemester(Map<String, dynamic> map) async {
    final response =
        await _apiClient.post(ApiConstants.changeLiveSemester, map);
    return response;
  }

  @override
  FutureOr addPresentationToWall(Map<String, dynamic> map) async {
    final response =
        await _apiClient.post(ApiConstants.addPresentationToWall, map);
    return response;
  }

  @override
  FutureOr addTeachersToBatch(Map<String, dynamic> map) async {
    final response =
        await _apiClient.post(ApiConstants.addTeachersToBatch, map);
    return response;
  }

  @override
  FutureOr updateChapterPresentationDisplayOrder(
      Map<String, dynamic> map) async {
    final response = _apiClient.post(
        ApiConstants.updateChapterPresentationDisplayOrder, map);
    return response;
  }

  @override
  FutureOr getChapterPresentations(Map<String, dynamic> map) async {
    final response = _apiClient.post(ApiConstants.getChapterPresentations, map);
    return response;
  }

  @override
  FutureOr removePresentationFromChapter(Map<String, dynamic> map) async {
    final response =
        _apiClient.post(ApiConstants.removePresentationFromChapter, map);
    return response;
  }

  @override
  FutureOr getReadModeElements(Map<String, dynamic> params) async {
    final response =
        await _apiClient.post(ApiConstants.getReadModeElements, params);
    return response;
  }

  @override
  FutureOr checkRegisteredUser(Map<String, dynamic> map) async {
    final response =
        await _apiClient.post(ApiConstants.checkRegisteredUser, map);
    return response;
  }

  @override
  FutureOr registerStudent(Map<String, dynamic> map) async {
    final response = await _apiClient.post(ApiConstants.registerStudent, map);
    return response;
  }

  @override
  FutureOr studentLogin(Map<String, dynamic> map) async {
    final response = await _apiClient.post(ApiConstants.studentLogin, map);
    return response;
  }

  @override
  FutureOr getStudentDashboard(Map<String, dynamic> map) async {
    final response = await _apiClient.post(ApiConstants.studentDashboard, map);
    return response;
  }

  @override
  FutureOr registerTeacher(Map<String, dynamic> map) async {
    final response = await _apiClient.post(ApiConstants.registerTeacher, map);
    return response;
  }

  @override
  FutureOr joinBatch(Map<String, dynamic> json) async {
    final response = await _apiClient.post(ApiConstants.joinBatch, json);
    return response;
  }
}
