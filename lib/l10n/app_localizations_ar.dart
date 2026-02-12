// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق الرسالة';

  @override
  String get students => 'الطلاب';

  @override
  String get reports => 'التقارير';

  @override
  String get monthlyMeeting => 'الاجتماع الشهري';

  @override
  String get finishMeeting => 'إنهاء الاجتماع';

  @override
  String get changeSchool => 'تغيير المدرسة';

  @override
  String get changeDate => 'تغيير التاريخ';

  @override
  String get save => 'حفظ';

  @override
  String get exportDayReportPdf => 'تصدير تقرير اليوم';

  @override
  String get exportGeneralReportPdf => 'تصدير التقرير العام';

  @override
  String get reportSaved => 'تم حفظ التقرير بنجاح';

  @override
  String get meetingFinishedPointsReset =>
      'تم إنهاء الاجتماع وإعادة تعيين النقاط';

  @override
  String get error => 'خطأ';

  @override
  String get ok => 'موافق';

  @override
  String get cancel => 'إلغاء';

  @override
  String get emptyStateSelectSchool => 'يرجى اختيار الجامع';

  @override
  String get delete => 'حذف';

  @override
  String get edit => 'تعديل';

  @override
  String get add => 'إضافة';

  @override
  String get back => 'رجوع';

  @override
  String get search => 'بحث';

  @override
  String get noData => 'لا توجد بيانات';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get success => 'نجح';

  @override
  String get warning => 'تحذير';

  @override
  String get confirmDelete => 'هل أنت متأكد من حذف هذا البند؟';

  @override
  String get language => 'اللغة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get notes => 'ملاحظات (اختيارية)';

  @override
  String get date => 'التاريخ';

  @override
  String get school => 'الجامع';

  @override
  String get teacher => 'المعلم';

  @override
  String get schoolClass => 'الفصل';

  @override
  String get student => 'الطالب';

  @override
  String get studentReport => 'تقرير الطالب';

  @override
  String get dayReport => 'تقرير اليوم';

  @override
  String get generalReport => 'التقرير العام';

  @override
  String get generalReportTitle => 'التقرير العام للمدرسة';

  @override
  String get passedLessons => 'الدروس الناجحة';

  @override
  String get repeatedLessons => 'الدروس المكررة';

  @override
  String get points => 'نقاط';

  @override
  String get attitude => 'السلوك';

  @override
  String get good => 'جيد';

  @override
  String get medium => 'متوسط';

  @override
  String get bad => 'سيء';

  @override
  String get passedWithPoints => 'نجح (+1 نقطة)';

  @override
  String get repeatWithPoints => 'إعادة (0 نقاط)';

  @override
  String get goodWithPoints => 'جيد (+2 نقاط)';

  @override
  String get mediumWithPoints => 'متوسط (+1 نقطة)';

  @override
  String get badWithPoints => 'سيء (-1 نقطة)';

  @override
  String pointsForEntry(Object points) {
    return 'نقاط هذا الإدخال: $points';
  }

  @override
  String get languageArabic => 'العربية';

  @override
  String get languageTurkish => 'التركية';

  @override
  String get languageEnglish => 'الإنجليزية';

  @override
  String get pageStudied => 'الصفحات المدروسة';

  @override
  String get home => 'الرئيسية';

  @override
  String get lesson => 'الدرس';

  @override
  String get lessons => 'الدروس';

  @override
  String get homePlaceholder => 'الصفحة الرئيسية (تجريبي)';

  @override
  String get selectedSchoolId => 'معرّف الجامع المحددة';

  @override
  String get selectedDate => 'التاريخ المحدد';

  @override
  String get takeAttendance => 'أخذ الحضور';

  @override
  String get noSchoolSelected => 'لم يتم اختيار الجامع';

  @override
  String get noSchoolOrDateSelected => 'لم يتم اختيار جامع أو تاريخ';

  @override
  String get selectSchoolInProfile =>
      'يرجى إضافة الجامع أو اختياره من الملف الشخصي.';

  @override
  String get openTeacherProfile => 'فتح ملف المعلم';

  @override
  String get loadingReports => 'جار تحميل التقارير...';

  @override
  String get loadingMeetingData => 'جار تحميل بيانات الاجتماع...';

  @override
  String get loadingStudents => 'جار تحميل الطلاب...';

  @override
  String get monthlyMeetingNotes => 'الاجتماع الشهري';

  @override
  String get editMonthlyMeetingNotes => 'تعديل ملاحظات الاجتماع الشهري';

  @override
  String get lessonEntries => 'سجلات الدروس';

  @override
  String get noLessonEntriesFound => 'لا توجد سجلات للدروس';

  @override
  String get studentDetails => 'تفاصيل الطالب';

  @override
  String get studentInformation => 'معلومات الطالب';

  @override
  String get basicInformation => 'المعلومات الأساسية';

  @override
  String get statistics => 'الإحصائيات';

  @override
  String get totalEntries => 'إجمالي السجلات';

  @override
  String get totalPointsDelta => 'إجمالي تغير النقاط';

  @override
  String get passedRepeat => 'نجح / إعادة';

  @override
  String get attitudeSummary => 'السلوك (جيد/متوسط/سيء)';

  @override
  String get dateRange => 'نطاق التاريخ';

  @override
  String get exportPdf => 'تصدير PDF';

  @override
  String get studentNotFound => 'الطالب غير موجود';

  @override
  String get name => 'الاسم';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get parentPhoneNumber => 'رقم هاتف ولي الأمر';

  @override
  String get currentPoints => 'النقاط الحالية';

  @override
  String get lessonLoggingMode => 'وضع تسجيل الدروس';

  @override
  String get oneEntryPerDay => 'إدخال واحد لكل طالب في اليوم';

  @override
  String get multipleEntriesPerDay => 'إدخالات متعددة في اليوم';

  @override
  String get loggingMode => 'وضع التسجيل';

  @override
  String get noSchools => 'لم تتم إضافة جوامع بعد';

  @override
  String get addSchool => 'إضافة جامع';

  @override
  String get editSchool => 'تعديل الجامع';

  @override
  String get deleteSchool => 'حذف الجامع';

  @override
  String get deleteStudent => 'حذف الطالب';

  @override
  String get confirmDeleteStudent => 'هل أنت متأكد من حذف الطالب';

  @override
  String get confirmDeleteSchool => 'هل أنت متأكد من حذف المدرسة';

  @override
  String get schoolDeleted => 'تم حذف الجامع';

  @override
  String get schoolUpdated => 'تم تحديث الجامع';

  @override
  String get schoolAdded => 'تمت إضافة الجامع';

  @override
  String get teacherProfile => 'ملف المعلم';

  @override
  String get teacherProfileSaved => 'تم حفظ ملف المعلم';

  @override
  String get teacherSetup => 'إعداد المعلم';

  @override
  String get setupTitle => 'إعداد المعلم';

  @override
  String get completeSetup => 'إكمال الإعداد';

  @override
  String get teacherInformation => 'معلومات المعلم';

  @override
  String get schoolName => 'اسم الجامع';

  @override
  String get lessonsCount => 'عدد الدروس';

  @override
  String get schoolNameRequired => 'اسم الجامع مطلوب';

  @override
  String get lessonsCountRange => 'يجب أن يكون عدد الدروس بين 1 و 20';

  @override
  String get fillAllTeacherFields => 'يرجى تعبئة جميع بيانات المعلم';

  @override
  String get fillAllFields => 'يرجى تعبئة جميع الحقول المطلوبة';

  @override
  String get addAtLeastOneSchool => 'يرجى إضافة الجامع واحدة على الأقل';

  @override
  String get setupAlreadyCompleted => 'تم إكمال الإعداد بالفعل';

  @override
  String get errorLoadingData => 'حدث خطأ أثناء تحميل البيانات';

  @override
  String get errorSavingReport => 'حدث خطأ أثناء حفظ التقرير';

  @override
  String get errorExportingPdf => 'حدث خطأ أثناء تصدير ملف PDF';

  @override
  String get errorGeneratingPdf => 'حدث خطأ أثناء إنشاء ملف PDF';

  @override
  String get errorFinishingMeeting => 'حدث خطأ أثناء إنهاء الاجتماع';

  @override
  String get errorSavingSetup => 'حدث خطأ أثناء حفظ الإعداد';

  @override
  String get reportSavedTitle => 'تم حفظ التقرير';

  @override
  String get reportSavedMessage => 'تم حفظ تقرير اليوم بنجاح.';

  @override
  String get pdfExported => 'تم تصدير ملف PDF';

  @override
  String get unknownSchool => 'مدرسة غير معروفة';

  @override
  String get change => 'تغيير';

  @override
  String get month => 'الشهر';

  @override
  String get topStudents => 'أفضل 3 طلاب';

  @override
  String get absent => 'غائب';

  @override
  String get logged => 'تم التسجيل';

  @override
  String get searchStudents => 'البحث عن الطلاب';

  @override
  String get addFirstStudent => 'إضافة أول طالب';

  @override
  String get addStudentToGetStarted => 'أضف طالبا للبدء.';

  @override
  String get noMatchingStudents => 'لا يوجد طلاب مطابقون';

  @override
  String get noStudentsYet => 'لا يوجد طلاب بعد';

  @override
  String get selectSchoolTitle => 'اختيار الجامع';

  @override
  String get noSchoolsFound => 'لم يتم العثور على جوامع.';

  @override
  String get manageSchools => 'إدارة الجوامع';

  @override
  String get attendance => 'الحضور';

  @override
  String get enterLessonDetails => 'أدخل تفاصيل الدرس...';

  @override
  String get studentUpdatedTitle => 'تم تحديث الطالب';

  @override
  String get studentUpdatedMessage => 'تم تحديث الطالب بنجاح.';

  @override
  String get studentDeletedTitle => 'تم حذف الطالب';

  @override
  String get studentDeletedMessage => 'تم حذف الطالب بنجاح.';

  @override
  String get fillFirstLastName => 'يرجى إدخال الاسم الأول واسم العائلة';

  @override
  String get viewReport => 'عرض التقرير';

  @override
  String get level => 'المستوى';

  @override
  String get passed => 'نجح';

  @override
  String get repeat => 'إعادة';

  @override
  String get schools => 'المدارس';

  @override
  String get pointsManagement => 'إدارة النقاط';

  @override
  String get pagesStudiedHint => 'مثال: 12، 13 أو الصفحة 12؛ الصفحة 13';

  @override
  String get separateMultiplePages => 'افصل الصفحات المتعددة بفواصل ';

  @override
  String get additionalNotes => 'ملاحظات إضافية';

  @override
  String get savedTitle => 'تم الحفظ';

  @override
  String get savedMessage => 'تم الحفظ بنجاح';

  @override
  String get lessonSavedSuccess => 'تم حفظ الدرس بنجاح';

  @override
  String get lessonsLabel => 'الدروس';

  @override
  String get addStudent => 'إضافة طالب';

  @override
  String get addStudentTitle => 'إضافة طالب جديد';

  @override
  String get enterStudentName => 'أدخل اسم الطالب';

  @override
  String get enterParentPhone => 'أدخل رقم هاتف ولي الأمر';

  @override
  String get selectLevel => 'اختر المستوى';

  @override
  String get studentAdded => 'تم إضافة الطالب';

  @override
  String get studentAddedSuccess => 'تم إضافة الطالب بنجاح';

  @override
  String get errorTitle => 'خطأ';

  @override
  String get noStudents => 'لا يوجد طلاب';

  @override
  String get pdfStudentReportTitle => 'تقرير الطالب';

  @override
  String get pdfGeneralReportTitle => 'التقرير العام';

  @override
  String get pdfReportDate => 'تاريخ التقرير';

  @override
  String get pdfSchoolName => 'الجامع';

  @override
  String get pdfTeacherName => 'المعلم';

  @override
  String get pdfClassName => 'الحلقة';

  @override
  String get pdfStudentName => 'الطالب';

  @override
  String get pdfEntriesTableTitle => 'سجلات الدروس';

  @override
  String get pdfDailyLessonsHistoryTitle => 'سجل الدروس اليومية';

  @override
  String get pdfColDate => 'التاريخ';

  @override
  String get pdfColPageLearned => 'الصفحة المدروسة';

  @override
  String get pdfColPassed => 'نجح؟';

  @override
  String get pdfColNote => 'ملاحظة';

  @override
  String get pdfColLessonNumber => 'رقم الدرس';

  @override
  String get pdfColLessonTaught => 'الدرس المُدرَّس';

  @override
  String get pdfYes => 'نعم';

  @override
  String get pdfNo => 'لا';

  @override
  String get pdfNone => '-';

  @override
  String get pdfUpTo => 'حتى';

  @override
  String get pdfNoLessonsFound => 'لم يتم العثور على دروس';

  @override
  String get levelLabel => 'المستوى';

  @override
  String get currentPointsLabel => 'النقاط الحالية';
}
