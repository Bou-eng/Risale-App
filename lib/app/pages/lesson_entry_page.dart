import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../data/db/app_database.dart';
import '../../state/providers.dart';
import '../../ui/widgets/app_button.dart';
import '../../ui/widgets/app_card.dart';
import '../../ui/widgets/app_feedback.dart';
import '../../ui/widgets/app_text_field.dart';
import '../../ui/widgets/empty_state_widget.dart';
import '../../ui/widgets/loading_indicator.dart';

class LessonEntryPage extends ConsumerStatefulWidget {
  final int studentId;
  final List<int> orderedStudentIds;
  final int currentIndex;

  const LessonEntryPage({
    super.key,
    required this.studentId,
    required this.orderedStudentIds,
    required this.currentIndex,
  });

  @override
  ConsumerState<LessonEntryPage> createState() => _LessonEntryPageState();
}

class _LessonEntryPageState extends ConsumerState<LessonEntryPage> {
  final _pageStudiedController = TextEditingController();
  final _notesController = TextEditingController();
  bool _isPassed = true;
  int _attitude = 0; // 0 = good, 1 = medium, 2 = bad
  bool _isLoading = true;
  bool _isSaving = false;
  Student? _student;
  LessonEntry? _existingEntry;
  int _lessonLoggingMode = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _pageStudiedController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final selectedDate = ref.read(selectedDateProvider);
      final studentRepo = ref.read(studentRepositoryProvider);
      final lessonRepo = ref.read(lessonRepositoryProvider);
      final teacherRepo = ref.read(teacherRepositoryProvider);

      // Load student
      final student = await studentRepo.getStudentById(widget.studentId);

      // Load teacher profile to get lesson logging mode
      final teacher = await teacherRepo.getTeacher();
      final loggingMode = teacher?.lessonLoggingMode ?? 0;

      // Load existing entry if in one-entry-per-day mode
      LessonEntry? existingEntry;
      if (loggingMode == 0) {
        existingEntry = await lessonRepo.getSingleEntry(
          studentId: widget.studentId,
          date: selectedDate,
        );

        // Prefill fields if editing existing entry
        if (existingEntry != null) {
          _pageStudiedController.text = existingEntry.pageStudied;
          _isPassed = existingEntry.isPassed;
          _attitude = existingEntry.attitude;
          _notesController.text = existingEntry.notes ?? '';
        }
      }

      setState(() {
        _student = student;
        _existingEntry = existingEntry;
        _lessonLoggingMode = loggingMode;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        AppFeedback.showSnackBar(
          context,
          'Error loading data: $e',
          isError: true,
        );
      }
    }
  }

  int _calculatePointsDelta() {
    int points = 0;

    // Pass/Repeat points
    if (_isPassed) {
      points += 1;
    }

    // Attitude points
    switch (_attitude) {
      case 0: // Good
        points += 2;
        break;
      case 1: // Medium
        points += 1;
        break;
      case 2: // Bad
        points -= 1;
        break;
    }

    return points;
  }

  Future<void> _saveLesson() async {
    // Validate
    if (_pageStudiedController.text.trim().isEmpty) {
      AppFeedback.showSnackBar(
        context,
        'Page studied is required',
        isError: true,
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final selectedSchoolId = ref.read(selectedSchoolIdProvider);
      final selectedDate = ref.read(selectedDateProvider);
      final lessonRepo = ref.read(lessonRepositoryProvider);
      final studentRepo = ref.read(studentRepositoryProvider);

      if (selectedSchoolId == null) {
        throw Exception('No school selected');
      }

      final newPointsDelta = _calculatePointsDelta();
      debugPrint(
        'SAVE_LESSON: studentId=${widget.studentId} pointsDelta=$newPointsDelta',
      );

      if (_lessonLoggingMode == 0) {
        // One-entry-per-day mode
        final oldPointsDelta = _existingEntry?.pointsDelta ?? 0;
        final pointsAdjustment = newPointsDelta - oldPointsDelta;
        debugPrint(
          'ONE_ENTRY_MODE: oldDelta=$oldPointsDelta newDelta=$newPointsDelta adjustment=$pointsAdjustment',
        );

        // Upsert entry (includes points update in transaction)
        await lessonRepo.upsertSingleEntry(
          studentId: widget.studentId,
          schoolId: selectedSchoolId,
          date: selectedDate,
          pageStudied: _pageStudiedController.text.trim(),
          isPassed: _isPassed,
          attitude: _attitude,
          notes: _notesController.text.trim().isEmpty
              ? null
              : _notesController.text.trim(),
          pointsDelta: newPointsDelta,
          studentRepo: studentRepo,
          oldPointsDelta: oldPointsDelta,
        );
      } else {
        // Multiple-entries-per-day mode
        final nextIndex = await lessonRepo.getNextEntryIndex(
          studentId: widget.studentId,
          date: selectedDate,
        );
        debugPrint(
          'MULTI_ENTRY_MODE: studentId=${widget.studentId} nextIndex=$nextIndex pointsDelta=$newPointsDelta',
        );

        await lessonRepo.insertMultiEntry(
          studentId: widget.studentId,
          schoolId: selectedSchoolId,
          date: selectedDate,
          entryIndex: nextIndex,
          pageStudied: _pageStudiedController.text.trim(),
          isPassed: _isPassed,
          attitude: _attitude,
          notes: _notesController.text.trim().isEmpty
              ? null
              : _notesController.text.trim(),
          pointsDelta: newPointsDelta,
          studentRepo: studentRepo,
        );
      }

      // Trigger students list refresh so points update is visible
      ref.invalidate(studentsListProvider);

      if (mounted) {
        final t = AppLocalizations.of(context)!;
        await AppFeedback.showSuccessDialog(
          context,
          title: t.savedTitle,
          message: t.lessonSavedSuccess,
        );

        if (mounted) {
          Navigator.of(context).pop(true); // Return true to indicate success
        }
      }
    } catch (e) {
      debugPrint('ERROR_SAVING_LESSON: $e');
      if (mounted) {
        AppFeedback.showSnackBar(
          context,
          'Error saving lesson: $e',
          isError: true,
        );
      }
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Lesson Entry')),
        body: const LoadingIndicator(),
      );
    }

    if (_student == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Lesson Entry')),
        body: const EmptyStateWidget(
          title: 'Student not found',
          message: 'Please try again from the students list.',
        ),
      );
    }

    final pointsDelta = _calculatePointsDelta();
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('${_student!.firstName} ${_student!.lastName}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student info
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_student!.firstName} ${_student!.lastName}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (_student!.level != null)
                    Text(
                      '${t.levelLabel}: ${_student!.level}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  Text(
                    '${t.currentPointsLabel}: ${_student!.currentPoints}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (_existingEntry != null)
                    Text(
                      'Editing existing entry',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Page Studied (supports multiple pages)
            AppTextField(
              controller: _pageStudiedController,
              label: t.pageStudied,
              hint: t.pagesStudiedHint,
              helperText: t.separateMultiplePages,
              maxLines: 3,
              minLines: 1,
            ),
            const SizedBox(height: 16),

            // Pass/Repeat
            Text(
              t.passedRepeat,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: Text(t.passedWithPoints),
                    value: true,
                    groupValue: _isPassed,
                    onChanged: (value) {
                      setState(() {
                        _isPassed = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: Text(t.repeatWithPoints),
                    value: false,
                    groupValue: _isPassed,
                    onChanged: (value) {
                      setState(() {
                        _isPassed = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Attitude
            Text(t.attitude, style: Theme.of(context).textTheme.titleMedium),
            DropdownButtonFormField<int>(
              initialValue: _attitude,
              decoration: const InputDecoration(),
              items: [
                DropdownMenuItem(value: 0, child: Text(t.goodWithPoints)),
                DropdownMenuItem(value: 1, child: Text(t.mediumWithPoints)),
                DropdownMenuItem(value: 2, child: Text(t.badWithPoints)),
              ],
              onChanged: (value) {
                setState(() {
                  _attitude = value!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Notes
            AppTextField(
              controller: _notesController,
              label: t.notes,
              hint: t.additionalNotes,
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // Points Preview
            AppCard(
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    t.pointsForEntry(pointsDelta),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: AppButton.primary(
                label: t.save,
                onPressed: _isSaving ? null : _saveLesson,
                isLoading: _isSaving,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
