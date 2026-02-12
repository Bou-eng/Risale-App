// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Risale Uygulaması';

  @override
  String get students => 'Öğrenciler';

  @override
  String get reports => 'Raporlar';

  @override
  String get monthlyMeeting => 'Aylık Toplantı';

  @override
  String get finishMeeting => 'Toplantıyı Bitir';

  @override
  String get changeSchool => 'Camii Değiştir';

  @override
  String get changeDate => 'Tarihi Değiştir';

  @override
  String get save => 'Kaydet';

  @override
  String get exportDayReportPdf => 'Günlük Raporu Dışa Aktar';

  @override
  String get exportGeneralReportPdf => 'Genel Raporu Dışa Aktar';

  @override
  String get reportSaved => 'Rapor başarıyla kaydedildi';

  @override
  String get meetingFinishedPointsReset =>
      'Toplantı sona erdi ve puanlar sıfırlandı';

  @override
  String get error => 'Hata';

  @override
  String get ok => 'Tamam';

  @override
  String get cancel => 'İptal';

  @override
  String get emptyStateSelectSchool => 'Lütfen bir Camii seçin';

  @override
  String get delete => 'Sil';

  @override
  String get edit => 'Düzenle';

  @override
  String get add => 'Ekle';

  @override
  String get back => 'Geri';

  @override
  String get search => 'Ara';

  @override
  String get noData => 'Veri yok';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get success => 'Başarılı';

  @override
  String get warning => 'Uyarı';

  @override
  String get confirmDelete => 'Bu öğeyi silmek istediğinizden emin misiniz?';

  @override
  String get language => 'Dil';

  @override
  String get settings => 'Ayarlar';

  @override
  String get profile => 'Profil';

  @override
  String get logout => 'Çıkış Yap';

  @override
  String get notes => 'Notlar (isteğe bağlı)';

  @override
  String get date => 'Tarih';

  @override
  String get school => 'Okul';

  @override
  String get teacher => 'Öğretmen';

  @override
  String get schoolClass => 'Sınıf';

  @override
  String get student => 'Öğrenci';

  @override
  String get studentReport => 'Öğrenci Raporu';

  @override
  String get dayReport => 'Günlük Rapor';

  @override
  String get generalReport => 'Genel Rapor';

  @override
  String get generalReportTitle => 'Genel Camii Raporu';

  @override
  String get passedLessons => 'Başarılı Dersler';

  @override
  String get repeatedLessons => 'Tekrarlanan Dersler';

  @override
  String get points => 'Puanlar';

  @override
  String get attitude => 'Davranış';

  @override
  String get good => 'İyi';

  @override
  String get medium => 'Orta';

  @override
  String get bad => 'Kötü';

  @override
  String get passedWithPoints => 'Geçti (+1 puan)';

  @override
  String get repeatWithPoints => 'Tekrar (0 puan)';

  @override
  String get goodWithPoints => 'İyi (+2 puan)';

  @override
  String get mediumWithPoints => 'Orta (+1 puan)';

  @override
  String get badWithPoints => 'Kötü (-1 puan)';

  @override
  String pointsForEntry(Object points) {
    return 'Bu kayıt için puan: $points';
  }

  @override
  String get languageArabic => 'Arapça';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languageEnglish => 'İngilizce';

  @override
  String get pageStudied => 'Çalışılan Sayfalar';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get lesson => 'Ders';

  @override
  String get lessons => 'Dersler';

  @override
  String get homePlaceholder => 'Ana Sayfa (yer tutucu)';

  @override
  String get selectedSchoolId => 'Seçili Camii ID';

  @override
  String get selectedDate => 'Seçili Tarih';

  @override
  String get takeAttendance => 'Yoklama Al';

  @override
  String get noSchoolSelected => 'Camii seçilmedi';

  @override
  String get noSchoolOrDateSelected => 'Camii veya tarih seçilmedi';

  @override
  String get selectSchoolInProfile =>
      'Lütfen profilinizden Camii ekleyin veya seçin.';

  @override
  String get openTeacherProfile => 'Öğretmen Profilini Aç';

  @override
  String get loadingReports => 'Raporlar yükleniyor...';

  @override
  String get loadingMeetingData => 'Toplantı verileri yükleniyor...';

  @override
  String get loadingStudents => 'Öğrenciler yükleniyor...';

  @override
  String get monthlyMeetingNotes => 'Aylık Toplantı';

  @override
  String get editMonthlyMeetingNotes => 'Aylık toplantı notlarını düzenle';

  @override
  String get lessonEntries => 'Ders Kayıtları';

  @override
  String get noLessonEntriesFound => 'Ders kaydı bulunamadı';

  @override
  String get studentDetails => 'Öğrenci Detayları';

  @override
  String get studentInformation => 'Öğrenci Bilgileri';

  @override
  String get basicInformation => 'Temel Bilgiler';

  @override
  String get statistics => 'İstatistikler';

  @override
  String get totalEntries => 'Toplam Kayıt';

  @override
  String get totalPointsDelta => 'Toplam Puan Değişimi';

  @override
  String get passedRepeat => 'Başarılı / Tekrar';

  @override
  String get attitudeSummary => 'Davranış (İyi/Orta/Kötü)';

  @override
  String get dateRange => 'Tarih Aralığı';

  @override
  String get exportPdf => 'PDF Dışa Aktar';

  @override
  String get studentNotFound => 'Öğrenci bulunamadı';

  @override
  String get name => 'İsim';

  @override
  String get firstName => 'Ad';

  @override
  String get lastName => 'Soyad';

  @override
  String get parentPhoneNumber => 'Veli Telefonu';

  @override
  String get currentPoints => 'Mevcut Puan';

  @override
  String get lessonLoggingMode => 'Ders Kayıt Modu';

  @override
  String get oneEntryPerDay => 'Günde öğrenci başına tek kayıt';

  @override
  String get multipleEntriesPerDay => 'Günde birden fazla kayıt';

  @override
  String get loggingMode => 'Kayıt Modu';

  @override
  String get noSchools => 'Henüz Camii eklenmedi';

  @override
  String get addSchool => 'Camii Ekle';

  @override
  String get editSchool => 'Camii Düzenle';

  @override
  String get deleteSchool => 'Camii Sil';

  @override
  String get deleteStudent => 'Öğrenciyi Sil';

  @override
  String get confirmDeleteStudent =>
      'Öğrenciyi silmek istediğinize emin misiniz';

  @override
  String get confirmDeleteSchool => 'Camii silmek istediğinize emin misiniz';

  @override
  String get schoolDeleted => 'Camii silindi';

  @override
  String get schoolUpdated => 'Camii güncellendi';

  @override
  String get schoolAdded => 'Camii eklendi';

  @override
  String get teacherProfile => 'Öğretmen Profili';

  @override
  String get teacherProfileSaved => 'Öğretmen profili kaydedildi';

  @override
  String get teacherSetup => 'Öğretmen Kurulumu';

  @override
  String get setupTitle => 'Öğretmen Kurulumu';

  @override
  String get completeSetup => 'Kurulumu Tamamla';

  @override
  String get teacherInformation => 'Öğretmen Bilgileri';

  @override
  String get schoolName => 'Camii Adı';

  @override
  String get lessonsCount => 'Ders Sayısı';

  @override
  String get schoolNameRequired => 'Camii adı gerekli';

  @override
  String get lessonsCountRange => 'Ders sayısı 1 ile 20 arasında olmalıdır';

  @override
  String get fillAllTeacherFields => 'Lütfen tüm öğretmen alanlarını doldurun';

  @override
  String get fillAllFields => 'Lütfen tüm gerekli alanları doldurun';

  @override
  String get addAtLeastOneSchool => 'Lütfen en az bir Camii ekleyin';

  @override
  String get setupAlreadyCompleted => 'Kurulum zaten tamamlandı';

  @override
  String get errorLoadingData => 'Veri yüklenirken hata';

  @override
  String get errorSavingReport => 'Rapor kaydedilirken hata';

  @override
  String get errorExportingPdf => 'PDF dışa aktarılırken hata';

  @override
  String get errorGeneratingPdf => 'PDF oluşturulurken hata';

  @override
  String get errorFinishingMeeting => 'Toplantı bitirilirken hata';

  @override
  String get errorSavingSetup => 'Kurulum kaydedilirken hata';

  @override
  String get reportSavedTitle => 'Rapor Kaydedildi';

  @override
  String get reportSavedMessage => 'Günlük rapor başarıyla kaydedildi.';

  @override
  String get pdfExported => 'PDF dışa aktarıldı';

  @override
  String get unknownSchool => 'Bilinmeyen Camii';

  @override
  String get change => 'Değiştir';

  @override
  String get month => 'Ay';

  @override
  String get topStudents => 'En İyi 3 Öğrenci';

  @override
  String get absent => 'Devamsız';

  @override
  String get logged => 'Kaydedildi';

  @override
  String get searchStudents => 'Öğrenci ara';

  @override
  String get addFirstStudent => 'İlk Öğrenciyi Ekle';

  @override
  String get addStudentToGetStarted => 'Başlamak için öğrenci ekleyin.';

  @override
  String get noMatchingStudents => 'Eşleşen öğrenci yok';

  @override
  String get noStudentsYet => 'Henüz öğrenci yok';

  @override
  String get selectSchoolTitle => 'Camii Seç';

  @override
  String get noSchoolsFound => 'Camii bulunamadı.';

  @override
  String get manageSchools => 'Camii Yönet';

  @override
  String get attendance => 'Yoklama';

  @override
  String get enterLessonDetails => 'Ders detaylarını girin...';

  @override
  String get studentUpdatedTitle => 'Öğrenci Güncellendi';

  @override
  String get studentUpdatedMessage => 'Öğrenci başarıyla güncellendi.';

  @override
  String get studentDeletedTitle => 'Öğrenci Silindi';

  @override
  String get studentDeletedMessage => 'Öğrenci başarıyla silindi.';

  @override
  String get fillFirstLastName => 'Lütfen ad ve soyadı girin';

  @override
  String get viewReport => 'Raporu Gör';

  @override
  String get level => 'Seviye';

  @override
  String get passed => 'Geçti';

  @override
  String get repeat => 'Tekrar';

  @override
  String get schools => 'Camiler';

  @override
  String get pointsManagement => 'Puanları Yönet';

  @override
  String get pagesStudiedHint => 'örn., 12, 13 veya Sayfa 12; Sayfa 13';

  @override
  String get separateMultiplePages => 'Birden fazla sayfayı virgül ile ayırın';

  @override
  String get additionalNotes => 'Ek notlar';

  @override
  String get savedTitle => 'Kaydedildi';

  @override
  String get savedMessage => 'Başarıyla kaydedildi';

  @override
  String get lessonSavedSuccess => 'Ders başarıyla kaydedildi';

  @override
  String get lessonsLabel => 'Dersler';

  @override
  String get addStudent => 'Öğrenci Ekle';

  @override
  String get addStudentTitle => 'Yeni Öğrenci Ekle';

  @override
  String get enterStudentName => 'Öğrenci adı girin';

  @override
  String get enterParentPhone => 'Veli telefon numarasını girin';

  @override
  String get selectLevel => 'Seviye Seçin';

  @override
  String get studentAdded => 'Öğrenci Eklendi';

  @override
  String get studentAddedSuccess => 'Öğrenci başarıyla eklendi';

  @override
  String get errorTitle => 'Hata';

  @override
  String get noStudents => 'Öğrenci yok';

  @override
  String get pdfStudentReportTitle => 'Öğrenci Raporu';

  @override
  String get pdfGeneralReportTitle => 'Genel Rapor';

  @override
  String get pdfReportDate => 'Rapor Tarihi';

  @override
  String get pdfSchoolName => 'Camii';

  @override
  String get pdfTeacherName => 'Öğretmen';

  @override
  String get pdfClassName => 'Sınıf';

  @override
  String get pdfStudentName => 'Öğrenci';

  @override
  String get pdfEntriesTableTitle => 'Ders Kayıtları';

  @override
  String get pdfDailyLessonsHistoryTitle => 'Günlük Ders Rapor Geçmişi';

  @override
  String get pdfColDate => 'Tarih';

  @override
  String get pdfColPageLearned => 'Öğrenilen Sayfa';

  @override
  String get pdfColPassed => 'Geçti mi?';

  @override
  String get pdfColNote => 'Not';

  @override
  String get pdfColLessonNumber => 'Ders #';

  @override
  String get pdfColLessonTaught => 'Öğretilen Ders';

  @override
  String get pdfYes => 'Evet';

  @override
  String get pdfNo => 'Hayır';

  @override
  String get pdfNone => '-';

  @override
  String get pdfUpTo => 'Kadar';

  @override
  String get pdfNoLessonsFound => 'Ders bulunamadı';

  @override
  String get levelLabel => 'Seviye';

  @override
  String get currentPointsLabel => 'Mevcut Puan';
}
