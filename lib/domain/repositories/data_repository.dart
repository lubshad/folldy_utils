import 'package:folldy_utils/data/models/area_list_response.dart';
import 'package:folldy_utils/data/models/batch_list_response.dart';
import 'package:folldy_utils/data/models/chapter_list_response.dart';
import 'package:folldy_utils/data/models/course_list_response.dart';
import 'package:folldy_utils/data/models/institution_list_response.dart';
import 'package:folldy_utils/data/models/subject_list_response.dart';
import 'package:folldy_utils/data/models/faculty_list_response.dart';
import 'package:folldy_utils/data/models/topic_list_response.dart';
import 'package:folldy_utils/data/models/university_list_response.dart';
import 'package:basic_template/basic_template.dart';

abstract class DataRepository {
  Future<Either<AppError, Map<String, dynamic>>> addUniversity(
      Map<String, dynamic> params);

  Future<Either<AppError, List<Chapter>>> listChapters(
      Map<String, dynamic> params);
  Future<Either<AppError, List<Subject>>> listSubjects(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> addNewChapter(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> deleteChapter(
      Map<String, dynamic> params);

  Future<Either<AppError, List<University>>> listUniversitys(
      Map<String, dynamic> params);

  Future<Either<AppError, List<Institution>>> listInstitutions(
      Map<String, dynamic> params);

  Future<Either<AppError, List<Course>>> listCourses(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> deleteCourse(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> addNewCourse(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> addNewInstitution(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> deleteInstitution(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> deleteSubject(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> addNewSubject(
      Map<String, dynamic> params);

  Future<Either<AppError, List<Topic>>> listTopics(Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> addNewTopic(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> deleteTopic(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> deleteUniversity(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> uploadFile(
      UploadFileParams params);

  Future<Either<AppError, List<Faculty>>> listFacultys(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> deleteFaculty(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> addNewPresentation(
      Map<String, dynamic> params);

  Future<Either<AppError, List<Area>>> listAreas(Map<String, dynamic> json);

  Future<Either<AppError, Map<String, dynamic>>> addNewArea(
      UploadFileParams json);

  Future<Either<AppError, Map<String, dynamic>>> deleteArea(
      Map<String, dynamic> json);

  Future<Either<AppError, List<dynamic>>> getAllPresentations(
      Map<String, dynamic> json);

  Future<Either<AppError, Map<String, dynamic>>> deletePresentation(
      Map<String, dynamic> json);

  Future<Either<AppError, dynamic>> addPresentationsToChapter(json);

  Future<Either<AppError, dynamic>> addAreaToSubject(json);

  Future<Either<AppError, dynamic>> getAreaWisePresentations(json);

  Future<Either<AppError, Map<String, dynamic>>> addFaculty(
      Map<String, dynamic> map);

  Future<Either<AppError, Map<String, dynamic>>> addEditBatch(
      Map<String, dynamic> map);

  Future<Either<AppError, List<Batch>>> listInstitutionBatches(
      Map<String, dynamic> map);

  Future<Either<AppError, Map<String, dynamic>>> getBatchDetails(
      Map<String, dynamic> map);
}
