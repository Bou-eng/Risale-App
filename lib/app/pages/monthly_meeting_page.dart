import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/db/app_database.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../state/providers.dart';
import '../../ui/theme/app_theme.dart';
import '../../ui/widgets/app_button.dart';
import '../../ui/widgets/app_card.dart';
import '../../ui/widgets/app_feedback.dart';
import '../../ui/widgets/empty_state_widget.dart';
import '../../ui/widgets/loading_indicator.dart';
import 'teacher_profile_page.dart';

class MonthlyMeetingPage extends ConsumerStatefulWidget {
  const MonthlyMeetingPage({super.key});

  @override
  ConsumerState<MonthlyMeetingPage> createState() => _MonthlyMeetingPageState();
}

class _MonthlyMeetingPageState extends ConsumerState<MonthlyMeetingPage> {
  List<Student> _topStudents = [];
  bool _isLoading = true;
  bool _isFinishing = false;
  School? _school;
  DateTime? _monthKey;

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
    setState(() {
      _isLoading = true;
    });

    try {
      final selectedSchoolId = ref.read(selectedSchoolIdProvider);
      final selectedDate = ref.read(selectedDateProvider);

      if (selectedSchoolId == null) {
        setState(() {
          _school = null;
          _monthKey = null;
          _topStudents = [];
          _isLoading = false;
        });
        return;
      }

      // Derive monthKey from selectedDate (first day of month)
      final monthKey = DateTime(selectedDate.year, selectedDate.month, 1);

      final schoolRepo = ref.read(schoolRepositoryProvider);
      final studentRepo = ref.read(studentRepositoryProvider);

      // Load school
      final school = await schoolRepo.getSchoolById(selectedSchoolId);

      // Load top 3 students by points
      final topStudents = await studentRepo.topStudentsByPoints(
        selectedSchoolId,
        3,
      );

      setState(() {
        _school = school;
        _monthKey = monthKey;
        _topStudents = topStudents;
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

  Future<void> _finishMeeting() async {
    final t = AppLocalizations.of(context)!;
    if (_school == null || _monthKey == null) return;

    setState(() {
      _isFinishing = true;
    });

    try {
      final studentRepo = ref.read(studentRepositoryProvider);
      final meetingRepo = ref.read(meetingRepositoryProvider);

      // Re-fetch top 3 to ensure fresh data
      final freshTop3 = await studentRepo.topStudentsByPoints(_school!.id, 3);
      final top3Ids = freshTop3.map((s) => s.id).toList();

      // Finish meeting (upsert + reset points in transaction)
      await meetingRepo.finishMeeting(
        schoolId: _school!.id,
        monthKey: _monthKey!,
        top3StudentIds: top3Ids,
      );

      if (mounted) {
        final t = AppLocalizations.of(context)!;
        AppFeedback.showSnackBar(context, t.meetingFinishedPointsReset);
      }

      // Trigger refresh in StudentReportPage
      ref.read(studentsRefreshTriggerProvider.notifier).state++;

      // Reload data (points should now be 0)
      await _loadData();
    } catch (e) {
      if (mounted) {
        AppFeedback.showSnackBar(
          context,
          '${t.errorFinishingMeeting}: $e',
          isError: true,
        );
      }
    } finally {
      setState(() {
        _isFinishing = false;
      });
    }
  }

  Future<void> _changeMonth() async {
    final selectedDate = ref.read(selectedDateProvider);
    final newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (newDate != null) {
      ref.read(globalAppStateProvider.notifier).setSelectedDate(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedSchoolId = ref.watch(selectedSchoolIdProvider);

    if (selectedSchoolId == null) {
      final t = AppLocalizations.of(context)!;
      return Scaffold(
        appBar: AppBar(title: Text(t.monthlyMeeting)),
        body: EmptyStateWidget(
          title: t.emptyStateSelectSchool,
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
      final t = AppLocalizations.of(context)!;
      return Scaffold(
        appBar: AppBar(title: Text(t.monthlyMeeting)),
        body: LoadingIndicator(message: t.loadingMeetingData),
      );
    }

    if (_school == null) {
      final t = AppLocalizations.of(context)!;
      return Scaffold(
        appBar: AppBar(title: Text(t.monthlyMeeting)),
        body: EmptyStateWidget(
          title: t.noSchoolsFound,
          message: t.selectSchoolInProfile,
        ),
      );
    }

    final t = AppLocalizations.of(context)!;
    final monthFormat = DateFormat('MMMM yyyy');
    final monthDisplay = _monthKey != null
        ? monthFormat.format(_monthKey!)
        : '';
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(t.monthlyMeeting)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // School and Month Header
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.school, style: textTheme.bodySmall),
                      const SizedBox(height: 4),
                      Text(_school!.name, style: textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t.month, style: textTheme.bodySmall),
                            const SizedBox(height: 4),
                            Text(monthDisplay, style: textTheme.titleMedium),
                          ],
                        ),
                      ),
                      AppButton.secondary(
                        label: t.changeDate,
                        onPressed: _changeMonth,
                        leading: const Icon(Icons.calendar_today, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Top 3 Students List
            Text(t.topStudents, style: textTheme.titleLarge),
            const SizedBox(height: 12),
            if (_topStudents.isEmpty)
              AppCard(
                child: Center(
                  child: Text(t.noData, style: textTheme.bodySmall),
                ),
              )
            else
              ..._buildTopStudentsList(),
            const SizedBox(height: 32),

            // Finish Meeting Button
            SizedBox(
              width: double.infinity,
              child: AppButton.primary(
                label: t.finishMeeting,
                onPressed: _isFinishing ? null : _finishMeeting,
                isLoading: _isFinishing,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTopStudentsList() {
    final t = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return _topStudents.asMap().entries.map((entry) {
      final index = entry.key;
      final student = entry.value;
      final rank = index + 1;

      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: AppCard(
          child: Row(
            children: [
              // Rank badge
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _getRankColor(rank),
                  borderRadius: AppRadii.pill,
                ),
                child: Center(
                  child: Text(
                    '$rank',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Student info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${student.firstName} ${student.lastName}',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${t.points}: ${student.currentPoints}',
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xFFFDBB2D); // Gold
      case 2:
        return const Color(0xFFC0C0C0); // Silver
      case 3:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return AppColors.primary;
    }
  }
}
