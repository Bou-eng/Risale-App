import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/db/app_database.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../state/locale_provider.dart';
import '../../state/providers.dart';
import '../../services/pdf/general_report_pdf_service.dart';
import '../../services/pdf/pdf_labels.dart';
import '../../ui/widgets/app_button.dart';
import '../../ui/widgets/app_card.dart';
import '../../ui/widgets/app_feedback.dart';
import '../../ui/widgets/app_text_field.dart';
import '../../ui/widgets/empty_state_widget.dart';
import '../../ui/widgets/loading_indicator.dart';
import 'teacher_profile_page.dart';
import 'monthly_meeting_page.dart';

class ReportsPage extends ConsumerStatefulWidget {
  const ReportsPage({super.key});

  @override
  ConsumerState<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends ConsumerState<ReportsPage> {
  final List<TextEditingController> _lessonControllers = [];
  bool _isLoading = true;
  bool _isSaving = false;
  bool _isExporting = false;
  School? _selectedSchool;
  DateTime? _selectedDate;

  // Subscriptions for listening to provider changes
  ProviderSubscription<int?>? _schoolSubscription;
  ProviderSubscription<DateTime>? _dateSubscription;

  @override
  void initState() {
    super.initState();

    // Load data initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });

    // Listen to selectedSchoolId changes
    _schoolSubscription = ref.listenManual(selectedSchoolIdProvider, (
      previous,
      next,
    ) {
      if (previous != next) {
        _loadData();
      }
    });

    // Listen to selectedDate changes
    _dateSubscription = ref.listenManual(selectedDateProvider, (
      previous,
      next,
    ) {
      if (previous != next) {
        _loadData();
      }
    });
  }

  @override
  void dispose() {
    _schoolSubscription?.close();
    _dateSubscription?.close();
    for (final controller in _lessonControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _loadData() async {
    final t = AppLocalizations.of(context)!;
    final selectedSchoolId = ref.read(selectedSchoolIdProvider);
    final selectedDate = ref.read(selectedDateProvider);

    if (selectedSchoolId == null) {
      setState(() {
        _selectedSchool = null;
        _selectedDate = null;
        _isLoading = false;
        _lessonControllers.clear();
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final schoolRepo = ref.read(schoolRepositoryProvider);
      final dayReportRepo = ref.read(dayReportRepositoryProvider);

      // Load school details
      final school = await schoolRepo.getSchoolById(selectedSchoolId);

      if (school == null) {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Clear old controllers
      for (final controller in _lessonControllers) {
        controller.dispose();
      }
      _lessonControllers.clear();

      // Load existing reports for this day
      final existingReports = await dayReportRepo.getDayReport(
        schoolId: selectedSchoolId,
        date: selectedDate,
      );

      // Create controllers for each lesson
      for (int i = 1; i <= school.lessonsCount; i++) {
        final controller = TextEditingController();

        // Find report for this lesson index and prefill
        try {
          final report = existingReports.firstWhere((r) => r.lessonIndex == i);
          controller.text = report.content;
        } catch (e) {
          // No report for this index, leave empty
          controller.text = '';
        }

        _lessonControllers.add(controller);
      }

      setState(() {
        _selectedSchool = school;
        _selectedDate = selectedDate;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        AppFeedback.showSnackBar(
          context,
          '${t.errorLoadingData}: $e',
          isError: true,
        );
      }
    }
  }

  Future<void> _pickDate() async {
    final currentDate = ref.read(selectedDateProvider);
    final picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null && mounted) {
      ref.read(globalAppStateProvider.notifier).setSelectedDate(picked);
    }
  }

  Future<void> _saveReport() async {
    final t = AppLocalizations.of(context)!;
    if (_selectedSchool == null || _selectedDate == null) {
      AppFeedback.showSnackBar(
        context,
        t.noSchoolOrDateSelected,
        isError: true,
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final dayReportRepo = ref.read(dayReportRepositoryProvider);

      // Save each lesson
      for (int i = 0; i < _lessonControllers.length; i++) {
        final lessonIndex = i + 1; // 1-based index
        final content = _lessonControllers[i].text.trim();

        await dayReportRepo.upsertLessonText(
          schoolId: _selectedSchool!.id,
          date: _selectedDate!,
          lessonIndex: lessonIndex,
          text: content,
        );
      }

      if (mounted) {
        await AppFeedback.showSuccessDialog(
          context,
          title: t.reportSavedTitle,
          message: t.reportSavedMessage,
        );
      }
    } catch (e) {
      if (mounted) {
        AppFeedback.showSnackBar(
          context,
          '${t.errorSavingReport}: $e',
          isError: true,
        );
      }
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  Future<void> _exportGeneralReportPdf() async {
    final t = AppLocalizations.of(context)!;
    if (_selectedSchool == null) {
      AppFeedback.showSnackBar(context, t.noSchoolSelected, isError: true);
      return;
    }

    setState(() {
      _isExporting = true;
    });

    try {
      final teacherRepo = ref.read(teacherRepositoryProvider);
      final studentRepo = ref.read(studentRepositoryProvider);
      final lessonRepo = ref.read(lessonRepositoryProvider);
      final dayReportRepo = ref.read(dayReportRepositoryProvider);
      final locale = ref.read(localeProvider);

      final teacher = await teacherRepo.getTeacher();
      final teacherName = teacher != null
          ? '${teacher.firstName} ${teacher.lastName}'
          : '-';
      final className = teacher?.className ?? _selectedSchool?.name ?? '-';

      // Load all students for the school
      final students = await studentRepo.listBySchool(_selectedSchool!.id);

      // Build student sections
      final studentSections = <StudentSection>[];
      for (final student in students) {
        // Get lesson entries for student
        final entries = await lessonRepo.listStudentEntries(student.id);

        // Limit to last 100 entries
        final displayEntries = entries.length > 100
            ? entries.sublist(entries.length - 100)
            : entries;

        studentSections.add(
          StudentSection(student: student, entries: displayEntries),
        );
      }

      // Load day reports up to selected date
      final dayReports = await dayReportRepo.listReportsUpToDate(
        schoolId: _selectedSchool!.id,
        endDate: _selectedDate ?? DateTime.now(),
      );

      // Debug: log how many reports were found
      debugPrint('DEBUG: Found ${dayReports.length} day reports for export');

      // Build day lesson rows from reports
      // Each report row already represents one lesson (lessonIndex + content)
      final dayLessonRows = <DayLessonRow>[];
      for (final report in dayReports) {
        // Skip empty lessons
        final text = report.content.trim();
        if (text.isEmpty) continue;

        dayLessonRows.add(
          DayLessonRow(
            date: report.date,
            lessonIndex: report.lessonIndex,
            text: text,
          ),
        );
      }

      debugPrint(
        'DEBUG: Built ${dayLessonRows.length} day lesson rows for PDF',
      );

      // Build localized labels
      final t = AppLocalizations.of(context)!;
      final labels = PdfLabels(
        studentReportTitle: t.pdfStudentReportTitle,
        generalReportTitle: t.pdfGeneralReportTitle,
        reportDate: t.pdfReportDate,
        schoolName: t.pdfSchoolName,
        teacherName: t.pdfTeacherName,
        className: t.pdfClassName,
        studentName: t.pdfStudentName,
        entriesTableTitle: t.pdfEntriesTableTitle,
        dailyLessonsHistoryTitle: t.pdfDailyLessonsHistoryTitle,
        colDate: t.pdfColDate,
        colPageLearned: t.pdfColPageLearned,
        colPassed: t.pdfColPassed,
        colNote: t.pdfColNote,
        colLessonNumber: t.pdfColLessonNumber,
        colLessonTaught: t.pdfColLessonTaught,
        yes: t.pdfYes,
        no: t.pdfNo,
        none: t.pdfNone,
        upTo: t.pdfUpTo,
        noLessonsFound: t.pdfNoLessonsFound,
      );

      await GeneralReportPdfService.exportGeneralReportPdf(
        school: _selectedSchool!,
        endDate: _selectedDate ?? DateTime.now(),
        teacherName: teacherName,
        className: className,
        studentSections: studentSections,
        dayLessonRows: dayLessonRows,
        locale: locale,
        labels: labels,
      );

      if (mounted) {
        AppFeedback.showSnackBar(context, t.pdfExported);
      }
    } catch (e) {
      if (mounted) {
        AppFeedback.showSnackBar(
          context,
          '${t.errorExportingPdf}: $e',
          isError: true,
        );
      }
    } finally {
      setState(() {
        _isExporting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final selectedSchoolId = ref.watch(selectedSchoolIdProvider);

    if (selectedSchoolId == null) {
      return Scaffold(
        appBar: AppBar(title: Text(t.reports)),
        body: EmptyStateWidget(
          title: t.noSchoolSelected,
          message: t.selectSchoolInProfile,
          actionLabel: t.openTeacherProfile,
          onAction: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TeacherProfilePage()),
            );
          },
        ),
      );
    }

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(t.reports)),
        body: LoadingIndicator(message: t.loadingReports),
      );
    }

    final localeName = Localizations.localeOf(context).toLanguageTag();
    final dateFormatter = DateFormat.yMMMMd(localeName);
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(t.reports)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Monthly Meeting Section
            AppCard(
              padding: EdgeInsets.zero,
              child: ListTile(
                leading: Icon(Icons.event_note, color: colors.primary),
                title: Text(t.monthlyMeeting, style: textTheme.titleMedium),
                subtitle: Text(
                  t.editMonthlyMeetingNotes,
                  style: textTheme.bodySmall,
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MonthlyMeetingPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // Day Lessons Report Section
            Text(t.dayReport, style: textTheme.titleLarge),
            const SizedBox(height: 16),

            // School and Date Info
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.school, style: textTheme.bodySmall),
                  const SizedBox(height: 4),
                  Text(
                    _selectedSchool?.name ?? t.unknownSchool,
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t.date, style: textTheme.bodySmall),
                            const SizedBox(height: 4),
                            Text(
                              dateFormatter.format(
                                _selectedDate ?? DateTime.now(),
                              ),
                              style: textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      AppButton.secondary(
                        label: t.change,
                        onPressed: _pickDate,
                        leading: const Icon(Icons.calendar_today, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Lesson text fields
            Text(t.lessons, style: textTheme.titleMedium),
            const SizedBox(height: 12),
            ..._buildLessonFields(),
            const SizedBox(height: 24),

            // Save button
            SizedBox(
              width: double.infinity,
              child: AppButton.primary(
                label: t.save,
                onPressed: _isSaving ? null : _saveReport,
                isLoading: _isSaving,
              ),
            ),
            const SizedBox(height: 12),

            // Export General Report PDF button
            SizedBox(
              width: double.infinity,
              child: AppButton.secondary(
                label: t.exportGeneralReportPdf,
                onPressed: _isExporting ? null : _exportGeneralReportPdf,
                isLoading: _isExporting,
                leading: const Icon(Icons.summarize, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLessonFields() {
    final t = AppLocalizations.of(context)!;
    return List.generate(_lessonControllers.length, (index) {
      final lessonNum = index + 1;
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: AppTextField(
          controller: _lessonControllers[index],
          label: '${t.lesson} $lessonNum',
          hint: t.enterLessonDetails,
          maxLines: 3,
          minLines: 1,
        ),
      );
    });
  }
}
