import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/db/app_database.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../state/providers.dart';

/// Teacher Profile Page - Edit teacher info and manage schools
class TeacherProfilePage extends ConsumerStatefulWidget {
  const TeacherProfilePage({super.key});

  @override
  ConsumerState<TeacherProfilePage> createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends ConsumerState<TeacherProfilePage> {
  int _refreshTrigger = 0;

  void _triggerRefresh() {
    setState(() {
      _refreshTrigger++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final teacherRepo = ref.watch(teacherRepositoryProvider);
    final schoolRepo = ref.watch(schoolRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.teacherProfile),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        key: ValueKey(_refreshTrigger),
        future: Future.wait([
          teacherRepo.getTeacher(),
          schoolRepo.getAllSchools(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('${t.error}: ${snapshot.error}'));
          }

          final teacher = snapshot.data?[0] as TeacherProfile?;
          final schools = (snapshot.data?[1] as List<School>?) ?? [];

          if (teacher == null) {
            return Center(child: Text(t.noData));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _EditTeacherSection(teacher: teacher),
                  const SizedBox(height: 24),
                  _ManageSchoolsSection(
                    schools: schools,
                    onSchoolsChanged: _triggerRefresh,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Section to edit teacher information
class _EditTeacherSection extends ConsumerStatefulWidget {
  final TeacherProfile teacher;

  const _EditTeacherSection({required this.teacher});

  @override
  ConsumerState<_EditTeacherSection> createState() =>
      _EditTeacherSectionState();
}

class _EditTeacherSectionState extends ConsumerState<_EditTeacherSection> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _classNameController;
  late int _lessonLoggingMode;
  bool _isEditing = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
      text: widget.teacher.firstName,
    );
    _lastNameController = TextEditingController(text: widget.teacher.lastName);
    _classNameController = TextEditingController(
      text: widget.teacher.className,
    );
    _lessonLoggingMode = widget.teacher.lessonLoggingMode;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _classNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.teacherInformation,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (!_isEditing)
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      setState(() => _isEditing = true);
                    },
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isEditing)
              Column(
                children: [
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
                  const SizedBox(height: 16),
                  Text(
                    t.lessonLoggingMode,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() => _isEditing = false);
                        },
                        child: Text(t.cancel),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _isSaving ? null : _onSaveTeacher,
                        child: _isSaving
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(t.save),
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
                  ),
                  Text(
                    '${t.schoolClass}: ${_classNameController.text}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '${t.loggingMode}: ${_lessonLoggingMode == 0 ? t.oneEntryPerDay : t.multipleEntriesPerDay}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSaveTeacher() async {
    final t = AppLocalizations.of(context)!;
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final className = _classNameController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty || className.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(t.fillAllTeacherFields)));
      return;
    }

    setState(() => _isSaving = true);

    try {
      final teacherRepo = ref.read(teacherRepositoryProvider);
      await teacherRepo.upsertTeacher(
        firstName: firstName,
        lastName: lastName,
        className: className,
        lessonLoggingMode: _lessonLoggingMode,
      );

      setState(() {
        _isEditing = false;
        _isSaving = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(t.teacherProfileSaved)));
      }
    } catch (e) {
      setState(() => _isSaving = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${t.error}: $e')));
      }
    }
  }
}

/// Section to manage schools
class _ManageSchoolsSection extends ConsumerWidget {
  final List<School> schools;
  final VoidCallback onSchoolsChanged;

  const _ManageSchoolsSection({
    required this.schools,
    required this.onSchoolsChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.schools,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _showSchoolDialog(context, ref),
                  icon: const Icon(Icons.add),
                  label: Text(t.add),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (schools.isEmpty)
              Text(t.noSchools)
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: schools.length,
                itemBuilder: (context, index) {
                  final school = schools[index];
                  return ListTile(
                    title: Text(school.name),
                    subtitle: Text('${school.lessonsCount} ${t.lessons}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () =>
                              _showSchoolDialog(context, ref, school: school),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteSchool(context, ref, school),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showSchoolDialog(
    BuildContext context,
    WidgetRef ref, {
    School? school,
  }) {
    final t = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (dialogContext) => _SchoolDialog(
        school: school,
        onSave: (name, lessonsCount) async {
          try {
            final schoolRepo = ref.read(schoolRepositoryProvider);
            if (school != null) {
              await schoolRepo.updateSchool(
                id: school.id,
                name: name,
                lessonsCount: lessonsCount,
              );
            } else {
              await schoolRepo.createSchool(
                name: name,
                lessonsCount: lessonsCount,
              );
            }
            if (context.mounted) {
              Navigator.pop(dialogContext);
              onSchoolsChanged();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    school != null ? t.schoolUpdated : t.schoolAdded,
                  ),
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('${t.error}: $e')));
            }
          }
        },
      ),
    );
  }

  Future<void> _deleteSchool(
    BuildContext context,
    WidgetRef ref,
    School school,
  ) async {
    final t = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.deleteSchool),
        content: Text('${t.confirmDeleteSchool} "${school.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(t.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(t.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final schoolRepo = ref.read(schoolRepositoryProvider);
        final selectedSchoolId = ref.read(selectedSchoolIdProvider);

        await schoolRepo.deleteSchool(school.id);

        // Update global state if deleted school was selected
        if (selectedSchoolId == school.id) {
          final appStateNotifier = ref.read(globalAppStateProvider.notifier);
          final remainingSchools = await schoolRepo.getAllSchools();
          if (remainingSchools.isNotEmpty) {
            appStateNotifier.setSelectedSchool(remainingSchools.first.id);
          } else {
            appStateNotifier.setSelectedSchool(null);
          }
        }

        onSchoolsChanged();

        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(t.schoolDeleted)));
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('${t.error}: $e')));
        }
      }
    }
  }
}

/// Dialog for adding/editing schools
class _SchoolDialog extends StatefulWidget {
  final School? school;
  final Function(String name, int lessonsCount) onSave;

  const _SchoolDialog({required this.school, required this.onSave});

  @override
  State<_SchoolDialog> createState() => _SchoolDialogState();
}

class _SchoolDialogState extends State<_SchoolDialog> {
  late TextEditingController _nameController;
  late TextEditingController _lessonsCountController;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.school?.name ?? '');
    _lessonsCountController = TextEditingController(
      text: (widget.school?.lessonsCount ?? 5).toString(),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lessonsCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(widget.school != null ? t.editSchool : t.addSchool),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: t.schoolName),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _lessonsCountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: t.lessonsCount),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(t.cancel),
        ),
        ElevatedButton(
          onPressed: _isSaving ? null : _onSave,
          child: _isSaving
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(t.save),
        ),
      ],
    );
  }

  Future<void> _onSave() async {
    final t = AppLocalizations.of(context)!;
    final name = _nameController.text.trim();
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

    setState(() => _isSaving = true);

    try {
      await widget.onSave(name, lessonsCount);
    } finally {
      setState(() => _isSaving = false);
    }
  }
}
