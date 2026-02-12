/// Labels model for PDF generation to support localization
class PdfLabels {
  final String studentReportTitle;
  final String generalReportTitle;
  final String reportDate;
  final String schoolName;
  final String teacherName;
  final String className;
  final String studentName;
  final String entriesTableTitle;
  final String dailyLessonsHistoryTitle;
  final String colDate;
  final String colPageLearned;
  final String colPassed;
  final String colNote;
  final String colLessonNumber;
  final String colLessonTaught;
  final String yes;
  final String no;
  final String none;
  final String upTo;
  final String noLessonsFound;

  const PdfLabels({
    required this.studentReportTitle,
    required this.generalReportTitle,
    required this.reportDate,
    required this.schoolName,
    required this.teacherName,
    required this.className,
    required this.studentName,
    required this.entriesTableTitle,
    required this.dailyLessonsHistoryTitle,
    required this.colDate,
    required this.colPageLearned,
    required this.colPassed,
    required this.colNote,
    required this.colLessonNumber,
    required this.colLessonTaught,
    required this.yes,
    required this.no,
    required this.none,
    required this.upTo,
    required this.noLessonsFound,
  });
}
