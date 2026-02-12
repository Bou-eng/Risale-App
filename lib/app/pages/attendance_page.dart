import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../data/db/app_database.dart';
import '../../state/providers.dart';
import 'teacher_profile_page.dart';
import 'package:intl/intl.dart';

class AttendancePage extends ConsumerStatefulWidget {
  const AttendancePage({super.key});

  @override
  ConsumerState<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends ConsumerState<AttendancePage> {
  List<Student> _students = [];
  Map<int, bool> _isAbsentByStudentId = {};
  bool _isLoading = true;
  bool _isSaving = false;
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
    final t = AppLocalizations.of(context)!;
    final selectedSchoolId = ref.read(selectedSchoolIdProvider);
    final selectedDate = ref.read(selectedDateProvider);

    if (selectedSchoolId == null) {
      setState(() {
        _students = [];
        _isAbsentByStudentId = {};
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

      // Load school
      final school = await schoolRepo.getSchoolById(selectedSchoolId);

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

      // For students without attendance records, default to present (false)
      for (final student in students) {
        if (!isAbsentMap.containsKey(student.id)) {
          isAbsentMap[student.id] = false;
        }
      }

      setState(() {
        _students = students;
        _isAbsentByStudentId = isAbsentMap;
        _selectedSchool = school;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${t.errorTitle}: $e')));
      }
    }
  }

  Future<void> _saveAttendance() async {
    final t = AppLocalizations.of(context)!;
    final selectedSchoolId = ref.read(selectedSchoolIdProvider);
    final selectedDate = ref.read(selectedDateProvider);

    if (selectedSchoolId == null) return;

    setState(() {
      _isSaving = true;
    });

    try {
      final attendanceRepo = ref.read(attendanceRepositoryProvider);
      await attendanceRepo.saveAttendanceForDay(
        schoolId: selectedSchoolId,
        date: selectedDate,
        isAbsentByStudentId: _isAbsentByStudentId,
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(t.savedMessage)));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${t.errorTitle}: $e')));
      }
    } finally {
      setState(() {
        _isSaving = false;
      });
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

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final selectedSchoolId = ref.watch(selectedSchoolIdProvider);
    final selectedDate = ref.watch(selectedDateProvider);
    final localeName = Localizations.localeOf(context).toLanguageTag();
    final dateFormatter = DateFormat.yMMMMd(localeName);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.attendance),
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
                        _selectedSchool?.name ?? t.unknownSchool,
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
                                  Text(
                                    isAbsent ? t.absent : t.logged,
                                    style: TextStyle(
                                      color: isAbsent
                                          ? Colors.red
                                          : Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Switch(
                                    value: isAbsent,
                                    onChanged: (value) {
                                      setState(() {
                                        _isAbsentByStudentId[student.id] =
                                            value;
                                      });
                                    },
                                    activeThumbColor: Colors.red,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),

                // Save button
                if (_students.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: _isSaving ? null : _saveAttendance,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: _isSaving
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text(t.save, style: const TextStyle(fontSize: 16)),
                    ),
                  ),
              ],
            ),
    );
  }
}
