import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/db/app_database.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../state/locale_provider.dart';
import '../../state/providers.dart';
import '../../services/pdf/student_report_pdf_service.dart';
import '../../services/pdf/pdf_labels.dart';
import '../../ui/widgets/app_card.dart';
import '../../ui/widgets/loading_indicator.dart';
import 'package:intl/intl.dart';

class StudentReportPage extends ConsumerWidget {
  final int studentId;

  const StudentReportPage({required this.studentId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final studentRepo = ref.watch(studentRepositoryProvider);
    final lessonRepo = ref.watch(lessonRepositoryProvider);
    final schoolRepo = ref.watch(schoolRepositoryProvider);
    final teacherRepo = ref.watch(teacherRepositoryProvider);
    final refreshTrigger = ref.watch(studentsRefreshTriggerProvider);
    final locale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.studentReport)),
      body: FutureBuilder<Student?>(
        key: ValueKey(refreshTrigger),
        future: studentRepo.getStudentById(studentId),
        builder: (context, studentSnapshot) {
          if (studentSnapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }

          if (studentSnapshot.data == null) {
            return Center(child: Text(t.studentNotFound));
          }

          final student = studentSnapshot.data!;

          return FutureBuilder<List<LessonEntry>>(
            future: lessonRepo.listStudentEntries(studentId),
            builder: (context, entriesSnapshot) {
              if (entriesSnapshot.connectionState == ConnectionState.waiting) {
                return const LoadingIndicator();
              }

              final entries = entriesSnapshot.data ?? [];

              // Compute stats
              final totalEntries = entries.length;
              final totalPointsDelta = entries.fold<int>(
                0,
                (sum, e) => sum + e.pointsDelta,
              );
              final passedCount = entries.where((e) => e.isPassed).length;
              final repeatCount = entries.where((e) => !e.isPassed).length;

              // Attitude: 0=good, 1=medium, 2=bad
              final goodAttitudeCount = entries
                  .where((e) => e.attitude == 0)
                  .length;
              final mediumAttitudeCount = entries
                  .where((e) => e.attitude == 1)
                  .length;
              final badAttitudeCount = entries
                  .where((e) => e.attitude == 2)
                  .length;

              // Date range
              DateTime? earliestDate;
              DateTime? latestDate;
              if (entries.isNotEmpty) {
                final dates = entries
                    .map((e) {
                      try {
                        return DateTime.parse(e.date);
                      } catch (_) {
                        return null;
                      }
                    })
                    .whereType<DateTime>()
                    .toList();

                if (dates.isNotEmpty) {
                  dates.sort();
                  earliestDate = dates.first;
                  latestDate = dates.last;
                }
              }

              return FutureBuilder<School?>(
                future: schoolRepo.getSchoolById(student.schoolId),
                builder: (context, schoolSnapshot) {
                  final school = schoolSnapshot.data;

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Student Info Card
                        AppCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t.studentInformation,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${t.name}:'),
                                  Text(
                                    '${student.firstName} ${student.lastName}',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              if (student.level != null) ...[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${t.level}:'),
                                    Text(student.level!),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                              if (student.parentPhone != null) ...[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${t.parentPhoneNumber}:'),
                                    Text(student.parentPhone!),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${t.currentPoints}:'),
                                  Text('${student.currentPoints}'),
                                ],
                              ),
                              if (school != null) ...[
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${t.school}:'),
                                    Text(school.name),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Stats Card
                        AppCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t.statistics,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${t.totalEntries}:'),
                                  Text('$totalEntries'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${t.totalPointsDelta}:'),
                                  Text('$totalPointsDelta'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${t.passedRepeat}:'),
                                  Text('$passedCount / $repeatCount'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${t.attitudeSummary}:'),
                                  Text(
                                    '$goodAttitudeCount / $mediumAttitudeCount / $badAttitudeCount',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${t.dateRange}:'),
                                  Text(
                                    earliestDate != null && latestDate != null
                                        ? '${DateFormat('yyyy-MM-dd').format(earliestDate)} to ${DateFormat('yyyy-MM-dd').format(latestDate)}'
                                        : t.noData,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Export PDF Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              try {
                                final teacher = await teacherRepo.getTeacher();
                                final teacherName = teacher != null
                                    ? '${teacher.firstName} ${teacher.lastName}'
                                    : '-';
                                final className =
                                    teacher?.className ?? school?.name ?? '-';

                                // Build localized labels
                                final labels = PdfLabels(
                                  studentReportTitle: t.pdfStudentReportTitle,
                                  generalReportTitle: t.pdfGeneralReportTitle,
                                  reportDate: t.pdfReportDate,
                                  schoolName: t.pdfSchoolName,
                                  teacherName: t.pdfTeacherName,
                                  className: t.pdfClassName,
                                  studentName: t.pdfStudentName,
                                  entriesTableTitle: t.pdfEntriesTableTitle,
                                  dailyLessonsHistoryTitle:
                                      t.pdfDailyLessonsHistoryTitle,
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

                                await StudentReportPdfService.generateAndSharePdf(
                                  student: student,
                                  schoolName: school?.name ?? '-',
                                  teacherName: teacherName,
                                  className: className,
                                  entries: entries,
                                  locale: locale,
                                  labels: labels,
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${t.errorGeneratingPdf}: $e',
                                    ),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.picture_as_pdf),
                            label: Text(t.exportPdf),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Entries Section
                        Text(
                          t.lessonEntries,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        if (entries.isEmpty)
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(t.noLessonEntriesFound),
                            ),
                          )
                        else
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: [
                                DataColumn(label: Text(t.date)),
                                DataColumn(label: Text(t.pageStudied)),
                                DataColumn(label: Text(t.passedRepeat)),
                                DataColumn(label: Text(t.attitude)),
                                DataColumn(label: Text(t.points)),
                                DataColumn(label: Text(t.notes)),
                              ],
                              rows: entries.map((entry) {
                                final passRepeat = entry.isPassed
                                    ? t.passed
                                    : t.repeat;
                                final attitude = entry.attitude == 0
                                    ? t.good
                                    : entry.attitude == 1
                                    ? t.medium
                                    : t.bad;
                                return DataRow(
                                  cells: [
                                    DataCell(Text(entry.date)),
                                    DataCell(
                                      Text(
                                        entry.pageStudied.length > 15
                                            ? '${entry.pageStudied.substring(0, 15)}...'
                                            : entry.pageStudied,
                                      ),
                                    ),
                                    DataCell(Text(passRepeat)),
                                    DataCell(Text(attitude)),
                                    DataCell(Text('${entry.pointsDelta}')),
                                    DataCell(
                                      Text(
                                        entry.notes != null &&
                                                entry.notes!.isNotEmpty
                                            ? entry.notes!.substring(0, 15)
                                            : '-',
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
