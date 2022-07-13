class ApiConstants {
  ApiConstants._();

  // // local
  // static String get domainUrl =>
  //     kDebugMode ? "http://localhost" : "http://143.244.138.169";

  // static String get baseUrl =>
  //     kDebugMode ? "$domainUrl:8000$slugUrl" : domainUrl + slugUrl;

  // static String presentationEditorUrl =
  //     kDebugMode ? "$domainUrl:8002/" : "$domainUrl/presentation/";

  // static String presentationViewerUrl =
  //     kDebugMode ? "$domainUrl:8003/" : "$domainUrl/presentation_view/";

  static const String slugUrl = "/folldy_admin/api/";
  static const String addUniversity = "university_add";
  static const String listAllAreas = "area_list";
  static const String addNewArea = "area_add";
  static const String deleteArea = "area_delete";
  static const String listAllpresentations = "presentation_list";
  static const String addNewpresentation = "presentation_add";
  static const String deletepresentation = "presentation_delete";
  static const String listChapters = "chapter_list";
  static const String listSubjects = "subject_list";
  static const String universityList = "university_list";
  static const String institutionList = "institution_list";
  static const String listCourses = "course_list";
  static const String deleteChapter = "chapter_delete";
  static const String addNewChapter = "chapter_add";
  static const String addNewCourse = "course_add";
  static const String deleteCourse = "course_delete";
  static const String addNewInstitution = "institution_add";
  static const String deleteInstitution = "institution_delete";
  static const String addNewSubject = "subject_add";
  static const String deleteSubject = "subject_delete";
  static const String addNewTopic = "topic_add";
  static const String listAllTopic = "topic_list";
  static const String deleteTopic = "topic_delete";
  static const String deleteUniversity = "university_delete";
  static const String uploadSlides = "upload_slides";
  static const String topicDetails = "topic_details";
  static const String listAllFacultys = "faculty_list";
  static const String addNewFaculty = "faculty_add";
  static const String deleteFaculty = "faculty_delete";
  static const String uploadAudios = "upload_audios";
  static const String addPresentations = "add_presentations";
  static const String addAreaToSubject = "add_area_to_subject";
  static const String getAreaWisePresentations = "area_wise_presentations";
  static const String addEditBatch = "add_edit_batch";
  static const String listInstitutionBatches = "list_institution_batches";
  static const String getBatchDetails = "batch_details";
  static const String getSubjectDetails = "subject_details";
  static const String institutionFacultyLogin = "institution_faculty_login";
  static const String assignSubjectToFaculty = "assign_subject_to_faculty";
  static const String getFacultyDashboard = "faculty_dashboard";
  static const String getAllPages = "get_all_pages";
  static const String getAllRecordedPresentations =
      "get_all_recorded_presentations";
  static const String deleteRecordedAudio = "delete_recorded_audio";
  static const String changeLiveSemester = "change_live_semester";
  static const String addPresentationToWall = "add_presentation_to_wall";
  static const String addTeachersToBatch = "add_teachers_to_batch";
  static const String updateChapterPresentationDisplayOrder =
      "update_chapter_presentation_display_order";
  static const String getChapterPresentations = "chapter_presentations";
  static const String removePresentationFromChapter =
      "remove_presentation_from_chapter";
  static const String getReadModeElements = "get_read_mode_elements";
  static const String checkRegisteredUser = "check_registered_user";
  static const String registerStudent = "register_student";
  static const String registerTeacher = "register_teacher";
  static const String joinBatch = "join_batch";
  static const String studentLogin = "student_login";
  static const String studentDashboard = "student_dashboard";
  static const String loadMorePresentations = "load_more_presentations";
  static const String updateAndroidSettings = "update_android_settings";
  static const String fetchAndroidSettings = "android_settings";
  static const String checkVersion = "check_version";
  static const String listReadmodeItems = "list_readmode_items";
}
