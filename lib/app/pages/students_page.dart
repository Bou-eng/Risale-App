import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/db/app_database.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../../state/providers.dart';
import '../../ui/theme/app_theme.dart';
import '../../ui/widgets/app_card.dart';
import '../../ui/widgets/app_text_field.dart';
import '../../ui/widgets/empty_state_widget.dart';
import '../../ui/widgets/loading_indicator.dart';
import 'teacher_profile_page.dart';
import 'add_student_page.dart';
import 'student_detail_page.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final selectedSchoolId = ref.watch(selectedSchoolIdProvider);

    if (selectedSchoolId == null) {
      return Scaffold(
        appBar: AppBar(title: Text(t.students)),
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

    return _StudentsListPage(schoolId: selectedSchoolId);
  }
}

class _StudentsListPage extends ConsumerStatefulWidget {
  final int schoolId;

  const _StudentsListPage({required this.schoolId});

  @override
  ConsumerState<_StudentsListPage> createState() => _StudentsListPageState();
}

class _StudentsListPageState extends ConsumerState<_StudentsListPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    final initialQuery = ref.read(studentsSearchQueryProvider);
    _searchController = TextEditingController(text: initialQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    ref.read(studentsSearchQueryProvider.notifier).state = '';
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh students list when page comes back into focus
    ref.invalidate(studentsListProvider);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final schoolRepo = ref.watch(schoolRepositoryProvider);
    final studentsAsync = ref.watch(studentsListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.students)),
      body: FutureBuilder<School?>(
        future: schoolRepo.getSchoolById(widget.schoolId),
        builder: (context, schoolSnapshot) {
          if (schoolSnapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }

          final schoolName = schoolSnapshot.data?.name ?? t.unknownSchool;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    schoolName,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: AppTextField(
                    controller: _searchController,
                    label: t.searchStudents,
                    prefixIcon: const Icon(Icons.search),
                    onChanged: (value) {
                      ref.read(studentsSearchQueryProvider.notifier).state =
                          value;
                    },
                  ),
                ),
              ),
              studentsAsync.when(
                loading: () =>
                    const SliverFillRemaining(child: LoadingIndicator()),
                error: (error, stack) => SliverFillRemaining(
                  child: Center(child: Text('${t.error}: $error')),
                ),
                data: (students) {
                  if (students.isEmpty) {
                    return SliverFillRemaining(
                      child: EmptyStateWidget(
                        title: _searchController.text.trim().isEmpty
                            ? t.noStudentsYet
                            : t.noMatchingStudents,
                        message: t.addStudentToGetStarted,
                        actionLabel: t.addFirstStudent,
                        onAction: () => _openAddStudent(context),
                      ),
                    );
                  }

                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final student = students[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: AppCard(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              '${student.firstName} ${student.lastName}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            subtitle: student.level != null
                                ? Text('${t.level}: ${student.level}')
                                : null,
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.12),
                                borderRadius: AppRadii.pill,
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.2),
                                ),
                              ),
                              child: Text(
                                '${student.currentPoints} ${t.points}',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    StudentDetailPage(student: student),
                              ),
                            ),
                          ),
                        ),
                      );
                    }, childCount: students.length),
                  );
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddStudent(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openAddStudent(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddStudentPage(schoolId: widget.schoolId),
      ),
    );
  }
}
