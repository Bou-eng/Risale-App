import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ar, this message translates to:
  /// **'تطبيق الرسالة'**
  String get appTitle;

  /// No description provided for @students.
  ///
  /// In ar, this message translates to:
  /// **'الطلاب'**
  String get students;

  /// No description provided for @reports.
  ///
  /// In ar, this message translates to:
  /// **'التقارير'**
  String get reports;

  /// No description provided for @monthlyMeeting.
  ///
  /// In ar, this message translates to:
  /// **'الاجتماع الشهري'**
  String get monthlyMeeting;

  /// No description provided for @finishMeeting.
  ///
  /// In ar, this message translates to:
  /// **'إنهاء الاجتماع'**
  String get finishMeeting;

  /// No description provided for @changeSchool.
  ///
  /// In ar, this message translates to:
  /// **'تغيير المدرسة'**
  String get changeSchool;

  /// No description provided for @changeDate.
  ///
  /// In ar, this message translates to:
  /// **'تغيير التاريخ'**
  String get changeDate;

  /// No description provided for @save.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save;

  /// No description provided for @exportDayReportPdf.
  ///
  /// In ar, this message translates to:
  /// **'تصدير تقرير اليوم'**
  String get exportDayReportPdf;

  /// No description provided for @exportGeneralReportPdf.
  ///
  /// In ar, this message translates to:
  /// **'تصدير التقرير العام'**
  String get exportGeneralReportPdf;

  /// No description provided for @reportSaved.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ التقرير بنجاح'**
  String get reportSaved;

  /// No description provided for @meetingFinishedPointsReset.
  ///
  /// In ar, this message translates to:
  /// **'تم إنهاء الاجتماع وإعادة تعيين النقاط'**
  String get meetingFinishedPointsReset;

  /// No description provided for @error.
  ///
  /// In ar, this message translates to:
  /// **'خطأ'**
  String get error;

  /// No description provided for @ok.
  ///
  /// In ar, this message translates to:
  /// **'موافق'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// No description provided for @emptyStateSelectSchool.
  ///
  /// In ar, this message translates to:
  /// **'يرجى اختيار الجامع'**
  String get emptyStateSelectSchool;

  /// No description provided for @delete.
  ///
  /// In ar, this message translates to:
  /// **'حذف'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In ar, this message translates to:
  /// **'تعديل'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In ar, this message translates to:
  /// **'إضافة'**
  String get add;

  /// No description provided for @back.
  ///
  /// In ar, this message translates to:
  /// **'رجوع'**
  String get back;

  /// No description provided for @search.
  ///
  /// In ar, this message translates to:
  /// **'بحث'**
  String get search;

  /// No description provided for @noData.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد بيانات'**
  String get noData;

  /// No description provided for @loading.
  ///
  /// In ar, this message translates to:
  /// **'جاري التحميل...'**
  String get loading;

  /// No description provided for @success.
  ///
  /// In ar, this message translates to:
  /// **'نجح'**
  String get success;

  /// No description provided for @warning.
  ///
  /// In ar, this message translates to:
  /// **'تحذير'**
  String get warning;

  /// No description provided for @confirmDelete.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من حذف هذا البند؟'**
  String get confirmDelete;

  /// No description provided for @language.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// No description provided for @settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settings;

  /// No description provided for @profile.
  ///
  /// In ar, this message translates to:
  /// **'الملف الشخصي'**
  String get profile;

  /// No description provided for @logout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// No description provided for @notes.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظات (اختيارية)'**
  String get notes;

  /// No description provided for @date.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ'**
  String get date;

  /// No description provided for @school.
  ///
  /// In ar, this message translates to:
  /// **'الجامع'**
  String get school;

  /// No description provided for @teacher.
  ///
  /// In ar, this message translates to:
  /// **'المعلم'**
  String get teacher;

  /// No description provided for @schoolClass.
  ///
  /// In ar, this message translates to:
  /// **'الفصل'**
  String get schoolClass;

  /// No description provided for @student.
  ///
  /// In ar, this message translates to:
  /// **'الطالب'**
  String get student;

  /// No description provided for @studentReport.
  ///
  /// In ar, this message translates to:
  /// **'تقرير الطالب'**
  String get studentReport;

  /// No description provided for @dayReport.
  ///
  /// In ar, this message translates to:
  /// **'تقرير اليوم'**
  String get dayReport;

  /// No description provided for @generalReport.
  ///
  /// In ar, this message translates to:
  /// **'التقرير العام'**
  String get generalReport;

  /// No description provided for @generalReportTitle.
  ///
  /// In ar, this message translates to:
  /// **'التقرير العام للمدرسة'**
  String get generalReportTitle;

  /// No description provided for @passedLessons.
  ///
  /// In ar, this message translates to:
  /// **'الدروس الناجحة'**
  String get passedLessons;

  /// No description provided for @repeatedLessons.
  ///
  /// In ar, this message translates to:
  /// **'الدروس المكررة'**
  String get repeatedLessons;

  /// No description provided for @points.
  ///
  /// In ar, this message translates to:
  /// **'نقاط'**
  String get points;

  /// No description provided for @attitude.
  ///
  /// In ar, this message translates to:
  /// **'السلوك'**
  String get attitude;

  /// No description provided for @good.
  ///
  /// In ar, this message translates to:
  /// **'جيد'**
  String get good;

  /// No description provided for @medium.
  ///
  /// In ar, this message translates to:
  /// **'متوسط'**
  String get medium;

  /// No description provided for @bad.
  ///
  /// In ar, this message translates to:
  /// **'سيء'**
  String get bad;

  /// No description provided for @passedWithPoints.
  ///
  /// In ar, this message translates to:
  /// **'نجح (+1 نقطة)'**
  String get passedWithPoints;

  /// No description provided for @repeatWithPoints.
  ///
  /// In ar, this message translates to:
  /// **'إعادة (0 نقاط)'**
  String get repeatWithPoints;

  /// No description provided for @goodWithPoints.
  ///
  /// In ar, this message translates to:
  /// **'جيد (+2 نقاط)'**
  String get goodWithPoints;

  /// No description provided for @mediumWithPoints.
  ///
  /// In ar, this message translates to:
  /// **'متوسط (+1 نقطة)'**
  String get mediumWithPoints;

  /// No description provided for @badWithPoints.
  ///
  /// In ar, this message translates to:
  /// **'سيء (-1 نقطة)'**
  String get badWithPoints;

  /// No description provided for @pointsForEntry.
  ///
  /// In ar, this message translates to:
  /// **'نقاط هذا الإدخال: {points}'**
  String pointsForEntry(Object points);

  /// No description provided for @languageArabic.
  ///
  /// In ar, this message translates to:
  /// **'العربية'**
  String get languageArabic;

  /// No description provided for @languageTurkish.
  ///
  /// In ar, this message translates to:
  /// **'التركية'**
  String get languageTurkish;

  /// No description provided for @languageEnglish.
  ///
  /// In ar, this message translates to:
  /// **'الإنجليزية'**
  String get languageEnglish;

  /// No description provided for @pageStudied.
  ///
  /// In ar, this message translates to:
  /// **'الصفحات المدروسة'**
  String get pageStudied;

  /// No description provided for @home.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// No description provided for @lesson.
  ///
  /// In ar, this message translates to:
  /// **'الدرس'**
  String get lesson;

  /// No description provided for @lessons.
  ///
  /// In ar, this message translates to:
  /// **'الدروس'**
  String get lessons;

  /// No description provided for @homePlaceholder.
  ///
  /// In ar, this message translates to:
  /// **'الصفحة الرئيسية (تجريبي)'**
  String get homePlaceholder;

  /// No description provided for @selectedSchoolId.
  ///
  /// In ar, this message translates to:
  /// **'معرّف الجامع المحددة'**
  String get selectedSchoolId;

  /// No description provided for @selectedDate.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ المحدد'**
  String get selectedDate;

  /// No description provided for @takeAttendance.
  ///
  /// In ar, this message translates to:
  /// **'أخذ الحضور'**
  String get takeAttendance;

  /// No description provided for @noSchoolSelected.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم اختيار الجامع'**
  String get noSchoolSelected;

  /// No description provided for @noSchoolOrDateSelected.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم اختيار جامع أو تاريخ'**
  String get noSchoolOrDateSelected;

  /// No description provided for @selectSchoolInProfile.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إضافة الجامع أو اختياره من الملف الشخصي.'**
  String get selectSchoolInProfile;

  /// No description provided for @openTeacherProfile.
  ///
  /// In ar, this message translates to:
  /// **'فتح ملف المعلم'**
  String get openTeacherProfile;

  /// No description provided for @loadingReports.
  ///
  /// In ar, this message translates to:
  /// **'جار تحميل التقارير...'**
  String get loadingReports;

  /// No description provided for @loadingMeetingData.
  ///
  /// In ar, this message translates to:
  /// **'جار تحميل بيانات الاجتماع...'**
  String get loadingMeetingData;

  /// No description provided for @loadingStudents.
  ///
  /// In ar, this message translates to:
  /// **'جار تحميل الطلاب...'**
  String get loadingStudents;

  /// No description provided for @monthlyMeetingNotes.
  ///
  /// In ar, this message translates to:
  /// **'الاجتماع الشهري'**
  String get monthlyMeetingNotes;

  /// No description provided for @editMonthlyMeetingNotes.
  ///
  /// In ar, this message translates to:
  /// **'تعديل ملاحظات الاجتماع الشهري'**
  String get editMonthlyMeetingNotes;

  /// No description provided for @lessonEntries.
  ///
  /// In ar, this message translates to:
  /// **'سجلات الدروس'**
  String get lessonEntries;

  /// No description provided for @noLessonEntriesFound.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد سجلات للدروس'**
  String get noLessonEntriesFound;

  /// No description provided for @studentDetails.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الطالب'**
  String get studentDetails;

  /// No description provided for @studentInformation.
  ///
  /// In ar, this message translates to:
  /// **'معلومات الطالب'**
  String get studentInformation;

  /// No description provided for @basicInformation.
  ///
  /// In ar, this message translates to:
  /// **'المعلومات الأساسية'**
  String get basicInformation;

  /// No description provided for @statistics.
  ///
  /// In ar, this message translates to:
  /// **'الإحصائيات'**
  String get statistics;

  /// No description provided for @totalEntries.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي السجلات'**
  String get totalEntries;

  /// No description provided for @totalPointsDelta.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي تغير النقاط'**
  String get totalPointsDelta;

  /// No description provided for @passedRepeat.
  ///
  /// In ar, this message translates to:
  /// **'نجح / إعادة'**
  String get passedRepeat;

  /// No description provided for @attitudeSummary.
  ///
  /// In ar, this message translates to:
  /// **'السلوك (جيد/متوسط/سيء)'**
  String get attitudeSummary;

  /// No description provided for @dateRange.
  ///
  /// In ar, this message translates to:
  /// **'نطاق التاريخ'**
  String get dateRange;

  /// No description provided for @exportPdf.
  ///
  /// In ar, this message translates to:
  /// **'تصدير PDF'**
  String get exportPdf;

  /// No description provided for @studentNotFound.
  ///
  /// In ar, this message translates to:
  /// **'الطالب غير موجود'**
  String get studentNotFound;

  /// No description provided for @name.
  ///
  /// In ar, this message translates to:
  /// **'الاسم'**
  String get name;

  /// No description provided for @firstName.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الأول'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In ar, this message translates to:
  /// **'اسم العائلة'**
  String get lastName;

  /// No description provided for @parentPhoneNumber.
  ///
  /// In ar, this message translates to:
  /// **'رقم هاتف ولي الأمر'**
  String get parentPhoneNumber;

  /// No description provided for @currentPoints.
  ///
  /// In ar, this message translates to:
  /// **'النقاط الحالية'**
  String get currentPoints;

  /// No description provided for @lessonLoggingMode.
  ///
  /// In ar, this message translates to:
  /// **'وضع تسجيل الدروس'**
  String get lessonLoggingMode;

  /// No description provided for @oneEntryPerDay.
  ///
  /// In ar, this message translates to:
  /// **'إدخال واحد لكل طالب في اليوم'**
  String get oneEntryPerDay;

  /// No description provided for @multipleEntriesPerDay.
  ///
  /// In ar, this message translates to:
  /// **'إدخالات متعددة في اليوم'**
  String get multipleEntriesPerDay;

  /// No description provided for @loggingMode.
  ///
  /// In ar, this message translates to:
  /// **'وضع التسجيل'**
  String get loggingMode;

  /// No description provided for @noSchools.
  ///
  /// In ar, this message translates to:
  /// **'لم تتم إضافة جوامع بعد'**
  String get noSchools;

  /// No description provided for @addSchool.
  ///
  /// In ar, this message translates to:
  /// **'إضافة جامع'**
  String get addSchool;

  /// No description provided for @editSchool.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الجامع'**
  String get editSchool;

  /// No description provided for @deleteSchool.
  ///
  /// In ar, this message translates to:
  /// **'حذف الجامع'**
  String get deleteSchool;

  /// No description provided for @deleteStudent.
  ///
  /// In ar, this message translates to:
  /// **'حذف الطالب'**
  String get deleteStudent;

  /// No description provided for @confirmDeleteStudent.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من حذف الطالب'**
  String get confirmDeleteStudent;

  /// No description provided for @confirmDeleteSchool.
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من حذف المدرسة'**
  String get confirmDeleteSchool;

  /// No description provided for @schoolDeleted.
  ///
  /// In ar, this message translates to:
  /// **'تم حذف الجامع'**
  String get schoolDeleted;

  /// No description provided for @schoolUpdated.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديث الجامع'**
  String get schoolUpdated;

  /// No description provided for @schoolAdded.
  ///
  /// In ar, this message translates to:
  /// **'تمت إضافة الجامع'**
  String get schoolAdded;

  /// No description provided for @teacherProfile.
  ///
  /// In ar, this message translates to:
  /// **'ملف المعلم'**
  String get teacherProfile;

  /// No description provided for @teacherProfileSaved.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ ملف المعلم'**
  String get teacherProfileSaved;

  /// No description provided for @teacherSetup.
  ///
  /// In ar, this message translates to:
  /// **'إعداد المعلم'**
  String get teacherSetup;

  /// No description provided for @setupTitle.
  ///
  /// In ar, this message translates to:
  /// **'إعداد المعلم'**
  String get setupTitle;

  /// No description provided for @completeSetup.
  ///
  /// In ar, this message translates to:
  /// **'إكمال الإعداد'**
  String get completeSetup;

  /// No description provided for @teacherInformation.
  ///
  /// In ar, this message translates to:
  /// **'معلومات المعلم'**
  String get teacherInformation;

  /// No description provided for @schoolName.
  ///
  /// In ar, this message translates to:
  /// **'اسم الجامع'**
  String get schoolName;

  /// No description provided for @lessonsCount.
  ///
  /// In ar, this message translates to:
  /// **'عدد الدروس'**
  String get lessonsCount;

  /// No description provided for @schoolNameRequired.
  ///
  /// In ar, this message translates to:
  /// **'اسم الجامع مطلوب'**
  String get schoolNameRequired;

  /// No description provided for @lessonsCountRange.
  ///
  /// In ar, this message translates to:
  /// **'يجب أن يكون عدد الدروس بين 1 و 20'**
  String get lessonsCountRange;

  /// No description provided for @fillAllTeacherFields.
  ///
  /// In ar, this message translates to:
  /// **'يرجى تعبئة جميع بيانات المعلم'**
  String get fillAllTeacherFields;

  /// No description provided for @fillAllFields.
  ///
  /// In ar, this message translates to:
  /// **'يرجى تعبئة جميع الحقول المطلوبة'**
  String get fillAllFields;

  /// No description provided for @addAtLeastOneSchool.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إضافة الجامع واحدة على الأقل'**
  String get addAtLeastOneSchool;

  /// No description provided for @setupAlreadyCompleted.
  ///
  /// In ar, this message translates to:
  /// **'تم إكمال الإعداد بالفعل'**
  String get setupAlreadyCompleted;

  /// No description provided for @errorLoadingData.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء تحميل البيانات'**
  String get errorLoadingData;

  /// No description provided for @errorSavingReport.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء حفظ التقرير'**
  String get errorSavingReport;

  /// No description provided for @errorExportingPdf.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء تصدير ملف PDF'**
  String get errorExportingPdf;

  /// No description provided for @errorGeneratingPdf.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء إنشاء ملف PDF'**
  String get errorGeneratingPdf;

  /// No description provided for @errorFinishingMeeting.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء إنهاء الاجتماع'**
  String get errorFinishingMeeting;

  /// No description provided for @errorSavingSetup.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء حفظ الإعداد'**
  String get errorSavingSetup;

  /// No description provided for @reportSavedTitle.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ التقرير'**
  String get reportSavedTitle;

  /// No description provided for @reportSavedMessage.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ تقرير اليوم بنجاح.'**
  String get reportSavedMessage;

  /// No description provided for @pdfExported.
  ///
  /// In ar, this message translates to:
  /// **'تم تصدير ملف PDF'**
  String get pdfExported;

  /// No description provided for @unknownSchool.
  ///
  /// In ar, this message translates to:
  /// **'مدرسة غير معروفة'**
  String get unknownSchool;

  /// No description provided for @change.
  ///
  /// In ar, this message translates to:
  /// **'تغيير'**
  String get change;

  /// No description provided for @month.
  ///
  /// In ar, this message translates to:
  /// **'الشهر'**
  String get month;

  /// No description provided for @topStudents.
  ///
  /// In ar, this message translates to:
  /// **'أفضل 3 طلاب'**
  String get topStudents;

  /// No description provided for @absent.
  ///
  /// In ar, this message translates to:
  /// **'غائب'**
  String get absent;

  /// No description provided for @logged.
  ///
  /// In ar, this message translates to:
  /// **'تم التسجيل'**
  String get logged;

  /// No description provided for @searchStudents.
  ///
  /// In ar, this message translates to:
  /// **'البحث عن الطلاب'**
  String get searchStudents;

  /// No description provided for @addFirstStudent.
  ///
  /// In ar, this message translates to:
  /// **'إضافة أول طالب'**
  String get addFirstStudent;

  /// No description provided for @addStudentToGetStarted.
  ///
  /// In ar, this message translates to:
  /// **'أضف طالبا للبدء.'**
  String get addStudentToGetStarted;

  /// No description provided for @noMatchingStudents.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد طلاب مطابقون'**
  String get noMatchingStudents;

  /// No description provided for @noStudentsYet.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد طلاب بعد'**
  String get noStudentsYet;

  /// No description provided for @selectSchoolTitle.
  ///
  /// In ar, this message translates to:
  /// **'اختيار الجامع'**
  String get selectSchoolTitle;

  /// No description provided for @noSchoolsFound.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم العثور على جوامع.'**
  String get noSchoolsFound;

  /// No description provided for @manageSchools.
  ///
  /// In ar, this message translates to:
  /// **'إدارة الجوامع'**
  String get manageSchools;

  /// No description provided for @attendance.
  ///
  /// In ar, this message translates to:
  /// **'الحضور'**
  String get attendance;

  /// No description provided for @enterLessonDetails.
  ///
  /// In ar, this message translates to:
  /// **'أدخل تفاصيل الدرس...'**
  String get enterLessonDetails;

  /// No description provided for @studentUpdatedTitle.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديث الطالب'**
  String get studentUpdatedTitle;

  /// No description provided for @studentUpdatedMessage.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديث الطالب بنجاح.'**
  String get studentUpdatedMessage;

  /// No description provided for @studentDeletedTitle.
  ///
  /// In ar, this message translates to:
  /// **'تم حذف الطالب'**
  String get studentDeletedTitle;

  /// No description provided for @studentDeletedMessage.
  ///
  /// In ar, this message translates to:
  /// **'تم حذف الطالب بنجاح.'**
  String get studentDeletedMessage;

  /// No description provided for @fillFirstLastName.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال الاسم الأول واسم العائلة'**
  String get fillFirstLastName;

  /// No description provided for @viewReport.
  ///
  /// In ar, this message translates to:
  /// **'عرض التقرير'**
  String get viewReport;

  /// No description provided for @level.
  ///
  /// In ar, this message translates to:
  /// **'المستوى'**
  String get level;

  /// No description provided for @passed.
  ///
  /// In ar, this message translates to:
  /// **'نجح'**
  String get passed;

  /// No description provided for @repeat.
  ///
  /// In ar, this message translates to:
  /// **'إعادة'**
  String get repeat;

  /// No description provided for @schools.
  ///
  /// In ar, this message translates to:
  /// **'المدارس'**
  String get schools;

  /// No description provided for @pointsManagement.
  ///
  /// In ar, this message translates to:
  /// **'إدارة النقاط'**
  String get pointsManagement;

  /// No description provided for @pagesStudiedHint.
  ///
  /// In ar, this message translates to:
  /// **'مثال: 12، 13 أو الصفحة 12؛ الصفحة 13'**
  String get pagesStudiedHint;

  /// No description provided for @separateMultiplePages.
  ///
  /// In ar, this message translates to:
  /// **'افصل الصفحات المتعددة بفواصل '**
  String get separateMultiplePages;

  /// No description provided for @additionalNotes.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظات إضافية'**
  String get additionalNotes;

  /// No description provided for @savedTitle.
  ///
  /// In ar, this message translates to:
  /// **'تم الحفظ'**
  String get savedTitle;

  /// No description provided for @savedMessage.
  ///
  /// In ar, this message translates to:
  /// **'تم الحفظ بنجاح'**
  String get savedMessage;

  /// No description provided for @lessonSavedSuccess.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ الدرس بنجاح'**
  String get lessonSavedSuccess;

  /// No description provided for @lessonsLabel.
  ///
  /// In ar, this message translates to:
  /// **'الدروس'**
  String get lessonsLabel;

  /// No description provided for @addStudent.
  ///
  /// In ar, this message translates to:
  /// **'إضافة طالب'**
  String get addStudent;

  /// No description provided for @addStudentTitle.
  ///
  /// In ar, this message translates to:
  /// **'إضافة طالب جديد'**
  String get addStudentTitle;

  /// No description provided for @enterStudentName.
  ///
  /// In ar, this message translates to:
  /// **'أدخل اسم الطالب'**
  String get enterStudentName;

  /// No description provided for @enterParentPhone.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقم هاتف ولي الأمر'**
  String get enterParentPhone;

  /// No description provided for @selectLevel.
  ///
  /// In ar, this message translates to:
  /// **'اختر المستوى'**
  String get selectLevel;

  /// No description provided for @studentAdded.
  ///
  /// In ar, this message translates to:
  /// **'تم إضافة الطالب'**
  String get studentAdded;

  /// No description provided for @studentAddedSuccess.
  ///
  /// In ar, this message translates to:
  /// **'تم إضافة الطالب بنجاح'**
  String get studentAddedSuccess;

  /// No description provided for @errorTitle.
  ///
  /// In ar, this message translates to:
  /// **'خطأ'**
  String get errorTitle;

  /// No description provided for @noStudents.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد طلاب'**
  String get noStudents;

  /// No description provided for @pdfStudentReportTitle.
  ///
  /// In ar, this message translates to:
  /// **'تقرير الطالب'**
  String get pdfStudentReportTitle;

  /// No description provided for @pdfGeneralReportTitle.
  ///
  /// In ar, this message translates to:
  /// **'التقرير العام'**
  String get pdfGeneralReportTitle;

  /// No description provided for @pdfReportDate.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ التقرير'**
  String get pdfReportDate;

  /// No description provided for @pdfSchoolName.
  ///
  /// In ar, this message translates to:
  /// **'الجامع'**
  String get pdfSchoolName;

  /// No description provided for @pdfTeacherName.
  ///
  /// In ar, this message translates to:
  /// **'المعلم'**
  String get pdfTeacherName;

  /// No description provided for @pdfClassName.
  ///
  /// In ar, this message translates to:
  /// **'الحلقة'**
  String get pdfClassName;

  /// No description provided for @pdfStudentName.
  ///
  /// In ar, this message translates to:
  /// **'الطالب'**
  String get pdfStudentName;

  /// No description provided for @pdfEntriesTableTitle.
  ///
  /// In ar, this message translates to:
  /// **'سجلات الدروس'**
  String get pdfEntriesTableTitle;

  /// No description provided for @pdfDailyLessonsHistoryTitle.
  ///
  /// In ar, this message translates to:
  /// **'سجل الدروس اليومية'**
  String get pdfDailyLessonsHistoryTitle;

  /// No description provided for @pdfColDate.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ'**
  String get pdfColDate;

  /// No description provided for @pdfColPageLearned.
  ///
  /// In ar, this message translates to:
  /// **'الصفحة المدروسة'**
  String get pdfColPageLearned;

  /// No description provided for @pdfColPassed.
  ///
  /// In ar, this message translates to:
  /// **'نجح؟'**
  String get pdfColPassed;

  /// No description provided for @pdfColNote.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظة'**
  String get pdfColNote;

  /// No description provided for @pdfColLessonNumber.
  ///
  /// In ar, this message translates to:
  /// **'رقم الدرس'**
  String get pdfColLessonNumber;

  /// No description provided for @pdfColLessonTaught.
  ///
  /// In ar, this message translates to:
  /// **'الدرس المُدرَّس'**
  String get pdfColLessonTaught;

  /// No description provided for @pdfYes.
  ///
  /// In ar, this message translates to:
  /// **'نعم'**
  String get pdfYes;

  /// No description provided for @pdfNo.
  ///
  /// In ar, this message translates to:
  /// **'لا'**
  String get pdfNo;

  /// No description provided for @pdfNone.
  ///
  /// In ar, this message translates to:
  /// **'-'**
  String get pdfNone;

  /// No description provided for @pdfUpTo.
  ///
  /// In ar, this message translates to:
  /// **'حتى'**
  String get pdfUpTo;

  /// No description provided for @pdfNoLessonsFound.
  ///
  /// In ar, this message translates to:
  /// **'لم يتم العثور على دروس'**
  String get pdfNoLessonsFound;

  /// No description provided for @levelLabel.
  ///
  /// In ar, this message translates to:
  /// **'المستوى'**
  String get levelLabel;

  /// No description provided for @currentPointsLabel.
  ///
  /// In ar, this message translates to:
  /// **'النقاط الحالية'**
  String get currentPointsLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
