import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../state/providers.dart';
import '../../ui/widgets/app_button.dart';
import '../../ui/widgets/app_card.dart';
import '../../ui/widgets/app_feedback.dart';
import '../../ui/widgets/app_text_field.dart';

class AddStudentPage extends ConsumerStatefulWidget {
  final int schoolId;

  const AddStudentPage({required this.schoolId, super.key});

  @override
  ConsumerState<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends ConsumerState<AddStudentPage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _parentPhoneController;
  late TextEditingController _levelController;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _parentPhoneController = TextEditingController();
    _levelController = TextEditingController();
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
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.addStudent),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.studentInformation,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
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
                    AppTextField(controller: _levelController, label: t.level),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: AppButton.primary(
                  label: t.addStudent,
                  onPressed: _isSaving ? null : _onSave,
                  isLoading: _isSaving,
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
      await studentRepo.createStudent(
        schoolId: widget.schoolId,
        firstName: firstName,
        lastName: lastName,
        parentPhone: parentPhone,
        level: level,
      );

      // Refresh students list
      ref
          .read(studentsRefreshTriggerProvider.notifier)
          .update((state) => state + 1);

      if (mounted) {
        Navigator.pop(context);
        AppFeedback.showSuccessDialog(
          context,
          title: t.studentAddedSuccess,
          message: t.studentAdded,
        );
      }
    } catch (e) {
      setState(() => _isSaving = false);
      if (mounted) {
        AppFeedback.showSnackBar(context, '${t.errorTitle}: $e', isError: true);
      }
    }
  }
}
