import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/db/app_database.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../state/providers.dart';
import 'teacher_profile_page.dart';
import 'lesson_entry_page.dart';
import 'package:intl/intl.dart';

class LessonPage extends ConsumerStatefulWidget {
  const LessonPage({super.key});

  @override
  ConsumerState<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends ConsumerState<LessonPage> {
  List<Student> _students = [];
  Map<int, bool> _isAbsentByStudentId = {};
  Map<int, bool> _hasLoggedByStudentId = {};
  bool _isLoading = true;
  School? _selectedSchool;

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
    super.dispose();
  }

  Future<void> _loadData() async {
    final selectedSchoolId = ref.read(selectedSchoolIdProvider);
    final selectedDate = ref.read(selectedDateProvider);

    if (selectedSchoolId == null) {
      setState(() {
        _students = [];
        _isAbsentByStudentId = {};
        _hasLoggedByStudentId = {};
        _isLoading = false;
        _selectedSchool = null;
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final schoolRepo = ref.read(schoolRepositoryProvider);
      final studentRepo = ref.read(studentRepositoryProvider);
      final attendanceRepo = ref.read(attendanceRepositoryProvider);
      final lessonRepo = ref.read(lessonRepositoryProvider);
      final teacherRepo = ref.read(teacherRepositoryProvider);

      // Load school
      final school = await schoolRepo.getSchoolById(selectedSchoolId);

      // Load teacher profile to get lesson logging mode
      final teacher = await teacherRepo.getTeacher();
      final loggingMode = teacher?.lessonLoggingMode ?? 0;

      // Load students for this school
      final students = await studentRepo.listBySchool(selectedSchoolId);

      // Load existing attendance for this date
      final attendanceRecords = await attendanceRepo.getByDate(
        schoolId: selectedSchoolId,
        date: selectedDate,
      );

      // Build map of studentId -> isAbsent
      final isAbsentMap = <int, bool>{};
      for (final record in attendanceRecords) {
        isAbsentMap[record.studentId] = record.isAbsent;
      }
      // Default to present (false) if no record
      for (final student in students) {
        if (!isAbsentMap.containsKey(student.id)) {
          isAbsentMap[student.id] = false;
        }
      }

      // Check if lesson entries exist for each student (for one-entry-per-day mode)
      final hasLoggedMap = <int, bool>{};
      if (loggingMode == 0) {
        // Only show "Logged" badge in one-entry-per-day mode
        for (final student in students) {
          final hasEntry = await lessonRepo.hasEntryForDate(
            studentId: student.id,
            date: selectedDate,
          );
          hasLoggedMap[student.id] = hasEntry;
        }
      }

      setState(() {
        _students = students;
        _isAbsentByStudentId = isAbsentMap;
        _hasLoggedByStudentId = hasLoggedMap;
        _selectedSchool = school;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        final t = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${t.error}: $e')));
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

  void _openLessonEntry(int studentId, int studentIndex) async {
    // Always allow opening LessonEntryPage
    // In one-entry-per-day mode, it will load existing entry and open in edit mode
    // In multi-entry mode, it will allow appending a new entry

    // Build ordered list of student IDs for Save & Next
    final orderedStudentIds = _students.map((s) => s.id).toList();

    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (_) => LessonEntryPage(
              studentId: studentId,
              orderedStudentIds: orderedStudentIds,
              currentIndex: studentIndex,
            ),
          ),
        )
        .then((_) {
          // Reload data when returning from lesson entry
          _loadData();
        });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final selectedSchoolId = ref.watch(selectedSchoolIdProvider);
    final selectedDate = ref.watch(selectedDateProvider);
    final localeName = Localizations.localeOf(context).toLanguageTag();
    final dateFormatter = DateFormat.yMMMMd(localeName);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.lessons),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: selectedSchoolId == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    t.noSchoolSelected,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const TeacherProfilePage(),
                        ),
                      );
                    },
                    child: Text(t.openTeacherProfile),
                  ),
                ],
              ),
            )
          : _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Header: School name and date
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedSchool?.name ?? 'Unknown School',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            dateFormatter.format(selectedDate),
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          TextButton.icon(
                            onPressed: _pickDate,
                            icon: const Icon(Icons.calendar_today, size: 16),
                            label: Text(t.changeDate),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Student list
                Expanded(
                  child: _students.isEmpty
                      ? Center(
                          child: Text(
                            t.addStudentToGetStarted,
                            style: const TextStyle(fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _students.length,
                          itemBuilder: (context, index) {
                            final student = _students[index];
                            final isAbsent =
                                _isAbsentByStudentId[student.id] ?? false;
                            final hasLogged =
                                _hasLoggedByStudentId[student.id] ?? false;

                            return ListTile(
                              title: Text(
                                '${student.firstName} ${student.lastName}',
                                style: TextStyle(
                                  color: isAbsent ? Colors.red : null,
                                  decoration: isAbsent
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              subtitle: student.level != null
                                  ? Text('${t.level}: ${student.level}')
                                  : null,
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (isAbsent)
                                    Chip(
                                      label: Text(
                                        t.absent,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                      padding: EdgeInsets.zero,
                                    ),
                                  if (hasLogged && !isAbsent)
                                    Chip(
                                      label: Text(
                                        t.logged,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.green,
                                      padding: EdgeInsets.zero,
                                    ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.chevron_right),
                                ],
                              ),
                              onTap: () => _openLessonEntry(student.id, index),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
