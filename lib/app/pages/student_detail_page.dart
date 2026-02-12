import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/db/app_database.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../state/providers.dart';
import '../../ui/widgets/app_button.dart';
import '../../ui/widgets/app_card.dart';
import '../../ui/widgets/app_feedback.dart';
import '../../ui/widgets/app_text_field.dart';
import 'student_report_page.dart';

class StudentDetailPage extends ConsumerStatefulWidget {
  final Student student;

  const StudentDetailPage({required this.student, super.key});

  @override
  ConsumerState<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends ConsumerState<StudentDetailPage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _parentPhoneController;
  late TextEditingController _levelController;
  late int _currentPoints;
  bool _isEditing = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
      text: widget.student.firstName,
    );
    _lastNameController = TextEditingController(text: widget.student.lastName);
    _parentPhoneController = TextEditingController(
      text: widget.student.parentPhone ?? '',
    );
    _levelController = TextEditingController(text: widget.student.level ?? '');
    _currentPoints = widget.student.currentPoints;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _parentPhoneController.dispose();
    _levelController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reload student data from DB when page becomes visible
    _reloadStudent();
  }

  Future<void> _reloadStudent() async {
    try {
      final studentRepo = ref.read(studentRepositoryProvider);
      final updatedStudent = await studentRepo.getStudentById(
        widget.student.id,
      );
      if (updatedStudent != null && mounted) {
        setState(() {
          _currentPoints = updatedStudent.currentPoints;
        });
        debugPrint(
          'StudentDetailPage: Reloaded student points = ${updatedStudent.currentPoints}',
        );
      }
    } catch (e) {
      debugPrint('Error reloading student: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.studentDetails),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: _onDelete,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Basic Information Section
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t.basicInformation, style: textTheme.titleMedium),
                        if (!_isEditing)
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => setState(() => _isEditing = true),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (_isEditing)
                      Column(
                        children: [
                          AppTextField(
                            controller: _firstNameController,
                            label: t.firstName,
                          ),
                          const SizedBox(height: 12),
                          AppTextField(
                            controller: _lastNameController,
                            label: t.lastName,
                          ),
                          const SizedBox(height: 12),
                          AppTextField(
                            controller: _parentPhoneController,
                            label: t.parentPhoneNumber,
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 12),
                          AppTextField(
                            controller: _levelController,
                            label: t.level,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppButton.secondary(
                                label: t.cancel,
                                onPressed: () {
                                  _firstNameController.text =
                                      widget.student.firstName;
                                  _lastNameController.text =
                                      widget.student.lastName;
                                  _parentPhoneController.text =
                                      widget.student.parentPhone ?? '';
                                  _levelController.text =
                                      widget.student.level ?? '';
                                  setState(() => _isEditing = false);
                                },
                              ),
                              const SizedBox(width: 8),
                              AppButton.primary(
                                label: t.save,
                                onPressed: _isSaving ? null : _onSave,
                                isLoading: _isSaving,
                              ),
                            ],
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_firstNameController.text} ${_lastNameController.text}',
                            style: textTheme.titleMedium,
                          ),
                          if (_parentPhoneController.text.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '${t.parentPhoneNumber}: ${_parentPhoneController.text}',
                                style: textTheme.bodySmall,
                              ),
                            ),
                          if (_levelController.text.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                '${t.level}: ${_levelController.text}',
                                style: textTheme.bodySmall,
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Points Management Section
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.pointsManagement, style: textTheme.titleMedium),
                    const SizedBox(height: 24),
                    Center(
                      child: Column(
                        children: [
                          Text(t.currentPoints, style: textTheme.bodySmall),
                          const SizedBox(height: 8),
                          Text('$_currentPoints', style: textTheme.titleLarge),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppButton.danger(
                                label: '-1',
                                onPressed: _onPointsDecrement,
                                leading: const Icon(Icons.remove, size: 16),
                              ),
                              const SizedBox(width: 16),
                              AppButton.primary(
                                label: '+1',
                                onPressed: _onPointsIncrement,
                                leading: const Icon(Icons.add, size: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // View Report Button
              SizedBox(
                width: double.infinity,
                child: AppButton.secondary(
                  label: t.viewReport,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            StudentReportPage(studentId: widget.student.id),
                      ),
                    );
                  },
                  leading: const Icon(Icons.assessment, size: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onSave() async {
    final t = AppLocalizations.of(context)!;
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty) {
      AppFeedback.showSnackBar(context, t.fillFirstLastName, isError: true);
      return;
    }

    setState(() => _isSaving = true);

    try {
      final parentPhone = _parentPhoneController.text.trim().isEmpty
          ? null
          : _parentPhoneController.text.trim();
      final level = _levelController.text.trim().isEmpty
          ? null
          : _levelController.text.trim();

      final studentRepo = ref.read(studentRepositoryProvider);
      await studentRepo.updateStudent(
        id: widget.student.id,
        firstName: firstName,
        lastName: lastName,
        parentPhone: parentPhone,
        level: level,
      );

      ref
          .read(studentsRefreshTriggerProvider.notifier)
          .update((state) => state + 1);

      if (mounted) {
        setState(() {
          _isEditing = false;
          _isSaving = false;
        });
        AppFeedback.showSuccessDialog(
          context,
          title: t.studentUpdatedTitle,
          message: t.studentUpdatedMessage,
        );
      }
    } catch (e) {
      setState(() => _isSaving = false);
      if (mounted) {
        AppFeedback.showSnackBar(context, '${t.error}: $e', isError: true);
      }
    }
  }

  void _onPointsIncrement() {
    _updatePoints(1);
  }

  void _onPointsDecrement() {
    if (_currentPoints > 0) {
      _updatePoints(-1);
    }
  }

  Future<void> _updatePoints(int delta) async {
    final t = AppLocalizations.of(context)!;
    try {
      final studentRepo = ref.read(studentRepositoryProvider);
      await studentRepo.addPoints(widget.student.id, delta);

      setState(() {
        _currentPoints += delta;
      });

      ref
          .read(studentsRefreshTriggerProvider.notifier)
          .update((state) => state + 1);
    } catch (e) {
      if (mounted) {
        AppFeedback.showSnackBar(context, '${t.error}: $e', isError: true);
      }
    }
  }

  Future<void> _onDelete() async {
    final t = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.deleteStudent),
        content: Text(
          '${t.confirmDeleteStudent} "${_firstNameController.text} ${_lastNameController.text}"?',
        ),
        actions: [
          AppButton.secondary(
            label: t.cancel,
            onPressed: () => Navigator.pop(dialogContext, false),
          ),
          AppButton.danger(
            label: t.delete,
            onPressed: () => Navigator.pop(dialogContext, true),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final studentRepo = ref.read(studentRepositoryProvider);
        await studentRepo.deleteStudent(widget.student.id);

        ref
            .read(studentsRefreshTriggerProvider.notifier)
            .update((state) => state + 1);

        if (mounted) {
          Navigator.pop(context);
          AppFeedback.showSuccessDialog(
            context,
            title: t.studentDeletedTitle,
            message: t.studentDeletedMessage,
          );
        }
      } catch (e) {
        if (mounted) {
          AppFeedback.showSnackBar(context, '${t.error}: $e', isError: true);
        }
      }
    }
  }
}
