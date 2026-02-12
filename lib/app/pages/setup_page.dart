import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../state/providers.dart';
import '../main_shell.dart';

/// Model for a school being added during setup
class _SchoolInput {
  String name;
  int lessonsCount;

  _SchoolInput({required this.name, required this.lessonsCount});
}

/// Real teacher setup page with form
class SetupPage extends ConsumerStatefulWidget {
  const SetupPage({super.key});

  @override
  ConsumerState<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends ConsumerState<SetupPage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _classNameController;
  late TextEditingController _schoolNameController;
  late TextEditingController _lessonsCountController;

  int _lessonLoggingMode = 0;
  final List<_SchoolInput> _schools = [];
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _classNameController = TextEditingController();
    _schoolNameController = TextEditingController();
    _lessonsCountController = TextEditingController(text: '5');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _classNameController.dispose();
    _schoolNameController.dispose();
    _lessonsCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.setupTitle)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTeacherSection(),
              const SizedBox(height: 24),
              _buildSchoolsSection(),
              const SizedBox(height: 24),
              _buildLoggingModeSection(),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _onSave,
                  child: _isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(t.completeSetup),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeacherSection() {
    final t = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.teacherInformation,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: t.firstName,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: t.lastName,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _classNameController,
              decoration: InputDecoration(
                labelText: t.schoolClass,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchoolsSection() {
    final t = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.schools,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (_schools.isEmpty)
              Text(
                t.noSchools,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _schools.length,
                itemBuilder: (context, index) {
                  final school = _schools[index];
                  return ListTile(
                    title: Text(school.name),
                    subtitle: Text('${school.lessonsCount} ${t.lessons}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _schools.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            const SizedBox(height: 16),
            TextField(
              controller: _schoolNameController,
              decoration: InputDecoration(
                labelText: t.schoolName,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _lessonsCountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: t.lessonsCount,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: _addSchool,
                  icon: const Icon(Icons.add),
                  label: Text(t.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoggingModeSection() {
    final t = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.lessonLoggingMode,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            RadioListTile<int>(
              title: Text(t.oneEntryPerDay),
              value: 0,
              groupValue: _lessonLoggingMode,
              onChanged: (value) {
                setState(() {
                  _lessonLoggingMode = value ?? 0;
                });
              },
            ),
            RadioListTile<int>(
              title: Text(t.multipleEntriesPerDay),
              value: 1,
              groupValue: _lessonLoggingMode,
              onChanged: (value) {
                setState(() {
                  _lessonLoggingMode = value ?? 0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addSchool() {
    final t = AppLocalizations.of(context)!;
    final name = _schoolNameController.text.trim();
    final lessonsCountStr = _lessonsCountController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.schoolNameRequired)));
      return;
    }

    final lessonsCount = int.tryParse(lessonsCountStr);
    if (lessonsCount == null || lessonsCount < 1 || lessonsCount > 20) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.lessonsCountRange)));
      return;
    }

    setState(() {
      _schools.add(_SchoolInput(name: name, lessonsCount: lessonsCount));
      _schoolNameController.clear();
      _lessonsCountController.text = '5';
    });
  }

  Future<void> _onSave() async {
    final t = AppLocalizations.of(context)!;
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final className = _classNameController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty || className.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.fillAllFields)));
      return;
    }

    if (_schools.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.addAtLeastOneSchool)));
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final teacherRepo = ref.read(teacherRepositoryProvider);
      final schoolRepo = ref.read(schoolRepositoryProvider);
      final appStateNotifier = ref.read(globalAppStateProvider.notifier);

      final alreadyExists = await teacherRepo.teacherExists();
      if (alreadyExists) {
        final schools = await schoolRepo.getAllSchools();
        if (schools.isNotEmpty) {
          appStateNotifier.setSelectedSchool(schools.first.id);
        }
        setState(() {
          _isSaving = false;
        });
        if (mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const MainShell()),
            (route) => false,
          );
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.setupAlreadyCompleted)));
        }
        return;
      }

      await teacherRepo.upsertTeacher(
        firstName: firstName,
        lastName: lastName,
        className: className,
        lessonLoggingMode: _lessonLoggingMode,
      );

      int? firstSchoolId;
      for (final school in _schools) {
        final savedSchool = await schoolRepo.createSchool(
          name: school.name,
          lessonsCount: school.lessonsCount,
        );
        firstSchoolId ??= savedSchool.id;
      }

      if (firstSchoolId != null) {
        appStateNotifier.setSelectedSchool(firstSchoolId);
      }

      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const MainShell()),
          (route) => false,
        );
      }
    } catch (e) {
      print('Error saving setup: $e');
      setState(() {
        _isSaving = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${t.error}: $e')));
      }
    }
  }
}
