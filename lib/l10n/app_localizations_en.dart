// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Risale App';

  @override
  String get students => 'Students';

  @override
  String get reports => 'Reports';

  @override
  String get monthlyMeeting => 'Monthly Meeting';

  @override
  String get finishMeeting => 'Finish Meeting';

  @override
  String get changeSchool => 'Change School';

  @override
  String get changeDate => 'Change Date';

  @override
  String get save => 'Save';

  @override
  String get exportDayReportPdf => 'Export Day Report';

  @override
  String get exportGeneralReportPdf => 'Export General Report';

  @override
  String get reportSaved => 'Report saved successfully';

  @override
  String get meetingFinishedPointsReset => 'Meeting finished and points reset';

  @override
  String get error => 'Error';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get emptyStateSelectSchool => 'Please select a school';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get back => 'Back';

  @override
  String get search => 'Search';

  @override
  String get noData => 'No data';

  @override
  String get loading => 'Loading...';

  @override
  String get success => 'Success';

  @override
  String get warning => 'Warning';

  @override
  String get confirmDelete => 'Are you sure you want to delete this item?';

  @override
  String get language => 'Language';

  @override
  String get settings => 'Settings';

  @override
  String get profile => 'Profile';

  @override
  String get logout => 'Logout';

  @override
  String get notes => 'Notes (optional)';

  @override
  String get date => 'Date';

  @override
  String get school => 'School';

  @override
  String get teacher => 'Teacher';

  @override
  String get schoolClass => 'Class';

  @override
  String get student => 'Student';

  @override
  String get studentReport => 'Student Report';

  @override
  String get dayReport => 'Day Report';

  @override
  String get generalReport => 'General Report';

  @override
  String get generalReportTitle => 'General School Report';

  @override
  String get passedLessons => 'Passed Lessons';

  @override
  String get repeatedLessons => 'Repeated Lessons';

  @override
  String get points => 'Points';

  @override
  String get attitude => 'Attitude';

  @override
  String get good => 'Good';

  @override
  String get medium => 'Medium';

  @override
  String get bad => 'Bad';

  @override
  String get passedWithPoints => 'Passed (+1 point)';

  @override
  String get repeatWithPoints => 'Repeat (0 points)';

  @override
  String get goodWithPoints => 'Good (+2 points)';

  @override
  String get mediumWithPoints => 'Medium (+1 point)';

  @override
  String get badWithPoints => 'Bad (-1 point)';

  @override
  String pointsForEntry(Object points) {
    return 'Points for this entry: $points';
  }

  @override
  String get languageArabic => 'Arabic';

  @override
  String get languageTurkish => 'Turkish';

  @override
  String get languageEnglish => 'English';

  @override
  String get pageStudied => 'Pages Studied';

  @override
  String get home => 'Home';

  @override
  String get lesson => 'Lesson';

  @override
  String get lessons => 'Lessons';

  @override
  String get homePlaceholder => 'Home (placeholder)';

  @override
  String get selectedSchoolId => 'Selected School ID';

  @override
  String get selectedDate => 'Selected Date';

  @override
  String get takeAttendance => 'Take Attendance';

  @override
  String get noSchoolSelected => 'No school selected';

  @override
  String get noSchoolOrDateSelected => 'No school or date selected';

  @override
  String get selectSchoolInProfile =>
      'Please add or select a school in Profile.';

  @override
  String get openTeacherProfile => 'Open Teacher Profile';

  @override
  String get loadingReports => 'Loading reports...';

  @override
  String get loadingMeetingData => 'Loading meeting data...';

  @override
  String get loadingStudents => 'Loading students...';

  @override
  String get monthlyMeetingNotes => 'Monthly Meeting';

  @override
  String get editMonthlyMeetingNotes => 'Edit monthly meeting notes';

  @override
  String get lessonEntries => 'Lesson Entries';

  @override
  String get noLessonEntriesFound => 'No lesson entries found';

  @override
  String get studentDetails => 'Student Details';

  @override
  String get studentInformation => 'Student Information';

  @override
  String get basicInformation => 'Basic Information';

  @override
  String get statistics => 'Statistics';

  @override
  String get totalEntries => 'Total Entries';

  @override
  String get totalPointsDelta => 'Total Points Delta';

  @override
  String get passedRepeat => 'Passed / Repeat';

  @override
  String get attitudeSummary => 'Attitude (Good/Medium/Bad)';

  @override
  String get dateRange => 'Date Range';

  @override
  String get exportPdf => 'Export PDF';

  @override
  String get studentNotFound => 'Student not found';

  @override
  String get name => 'Name';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get parentPhoneNumber => 'Parent Phone Number';

  @override
  String get currentPoints => 'Current Points';

  @override
  String get lessonLoggingMode => 'Lesson Logging Mode';

  @override
  String get oneEntryPerDay => 'One entry per student per day';

  @override
  String get multipleEntriesPerDay => 'Multiple entries per day';

  @override
  String get loggingMode => 'Logging Mode';

  @override
  String get noSchools => 'No schools added yet';

  @override
  String get addSchool => 'Add School';

  @override
  String get editSchool => 'Edit School';

  @override
  String get deleteSchool => 'Delete School';

  @override
  String get deleteStudent => 'Delete Student';

  @override
  String get confirmDeleteStudent =>
      'Are you sure you want to delete the student';

  @override
  String get confirmDeleteSchool =>
      'Are you sure you want to delete the school';

  @override
  String get schoolDeleted => 'School deleted';

  @override
  String get schoolUpdated => 'School updated';

  @override
  String get schoolAdded => 'School added';

  @override
  String get teacherProfile => 'Teacher Profile';

  @override
  String get teacherProfileSaved => 'Teacher profile saved';

  @override
  String get teacherSetup => 'Teacher Setup';

  @override
  String get setupTitle => 'Teacher Setup';

  @override
  String get completeSetup => 'Complete Setup';

  @override
  String get teacherInformation => 'Teacher Information';

  @override
  String get schoolName => 'School Name';

  @override
  String get lessonsCount => 'Lessons Count';

  @override
  String get schoolNameRequired => 'School name is required';

  @override
  String get lessonsCountRange => 'Lessons count must be between 1 and 20';

  @override
  String get fillAllTeacherFields => 'Please fill in all teacher fields';

  @override
  String get fillAllFields => 'Please fill in all required fields';

  @override
  String get addAtLeastOneSchool => 'Please add at least one school';

  @override
  String get setupAlreadyCompleted => 'Setup already completed';

  @override
  String get errorLoadingData => 'Error loading data';

  @override
  String get errorSavingReport => 'Error saving report';

  @override
  String get errorExportingPdf => 'Error exporting PDF';

  @override
  String get errorGeneratingPdf => 'Error generating PDF';

  @override
  String get errorFinishingMeeting => 'Error finishing meeting';

  @override
  String get errorSavingSetup => 'Error saving setup';

  @override
  String get reportSavedTitle => 'Report Saved';

  @override
  String get reportSavedMessage => 'Day report saved successfully.';

  @override
  String get pdfExported => 'PDF exported';

  @override
  String get unknownSchool => 'Unknown School';

  @override
  String get change => 'Change';

  @override
  String get month => 'Month';

  @override
  String get topStudents => 'Top 3 Students';

  @override
  String get absent => 'Absent';

  @override
  String get logged => 'Logged';

  @override
  String get searchStudents => 'Search students';

  @override
  String get addFirstStudent => 'Add First Student';

  @override
  String get addStudentToGetStarted => 'Add a student to get started.';

  @override
  String get noMatchingStudents => 'No matching students';

  @override
  String get noStudentsYet => 'No students yet';

  @override
  String get selectSchoolTitle => 'Select School';

  @override
  String get noSchoolsFound => 'No schools found.';

  @override
  String get manageSchools => 'Manage Schools';

  @override
  String get attendance => 'Attendance';

  @override
  String get enterLessonDetails => 'Enter lesson details...';

  @override
  String get studentUpdatedTitle => 'Student Updated';

  @override
  String get studentUpdatedMessage => 'Student updated successfully.';

  @override
  String get studentDeletedTitle => 'Student Deleted';

  @override
  String get studentDeletedMessage => 'Student deleted successfully.';

  @override
  String get fillFirstLastName => 'Please fill in first and last name';

  @override
  String get viewReport => 'View Report';

  @override
  String get level => 'Level';

  @override
  String get passed => 'Passed';

  @override
  String get repeat => 'Repeat';

  @override
  String get schools => 'Schools';

  @override
  String get pointsManagement => 'Points Management';

  @override
  String get pagesStudiedHint => 'e.g., 12, 13 or Page 12; Page 13';

  @override
  String get separateMultiplePages =>
      'Separate multiple pages with commas or semicolons';

  @override
  String get additionalNotes => 'Additional notes';

  @override
  String get savedTitle => 'Saved';

  @override
  String get savedMessage => 'Saved successfully';

  @override
  String get lessonSavedSuccess => 'Lesson saved successfully';

  @override
  String get lessonsLabel => 'Lessons';

  @override
  String get addStudent => 'Add Student';

  @override
  String get addStudentTitle => 'Add New Student';

  @override
  String get enterStudentName => 'Enter student name';

  @override
  String get enterParentPhone => 'Enter parent phone number';

  @override
  String get selectLevel => 'Select Level';

  @override
  String get studentAdded => 'Student Added';

  @override
  String get studentAddedSuccess => 'Student added successfully';

  @override
  String get errorTitle => 'Error';

  @override
  String get noStudents => 'No students';

  @override
  String get pdfStudentReportTitle => 'Student Report';

  @override
  String get pdfGeneralReportTitle => 'General Report';

  @override
  String get pdfReportDate => 'Report Date';

  @override
  String get pdfSchoolName => 'School';

  @override
  String get pdfTeacherName => 'Teacher';

  @override
  String get pdfClassName => 'Class';

  @override
  String get pdfStudentName => 'Student';

  @override
  String get pdfEntriesTableTitle => 'Lesson Entries';

  @override
  String get pdfDailyLessonsHistoryTitle => 'Daily Lessons Report History';

  @override
  String get pdfColDate => 'Date';

  @override
  String get pdfColPageLearned => 'Page Learned';

  @override
  String get pdfColPassed => 'Passed?';

  @override
  String get pdfColNote => 'Note';

  @override
  String get pdfColLessonNumber => 'Lesson #';

  @override
  String get pdfColLessonTaught => 'Lesson Taught';

  @override
  String get pdfYes => 'Yes';

  @override
  String get pdfNo => 'No';

  @override
  String get pdfNone => '-';

  @override
  String get pdfUpTo => 'Up to';

  @override
  String get pdfNoLessonsFound => 'No lessons found';

  @override
  String get levelLabel => 'Level';

  @override
  String get currentPointsLabel => 'Current points';
}
