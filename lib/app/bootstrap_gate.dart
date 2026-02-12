import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../state/providers.dart';
import '../state/locale_provider.dart';
import '../data/db/app_database.dart';
import 'main_shell.dart';
import 'pages/setup_page.dart';
import 'pages/teacher_profile_page.dart';

/// BootstrapGate: Async router that decides what to show on startup
///
/// Uses bootstrapProvider (FutureProvider) to ensure bootstrap logic runs
/// only once and is cached by Riverpod. This prevents re-running bootstrap
/// on every widget rebuild.
///
/// Logic:
/// 1. Check if teacher profile exists (via bootstrapProvider)
/// 2. If not -> show SetupPage
/// 3. If yes -> check selectedSchoolId
///    - If null -> show SchoolSelectionWidget (school selection)
///    - If set -> show MainShell
class BootstrapGate extends ConsumerWidget {
  const BootstrapGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the bootstrap provider once - it caches the result
    final bootstrapAsync = ref.watch(bootstrapProvider);
    final selectedSchoolId = ref.watch(selectedSchoolIdProvider);

    return bootstrapAsync.when(
      data: (teacherExists) {
        if (!teacherExists) {
          return const SetupPage();
        }

        // Teacher exists - check if school is selected
        if (selectedSchoolId == null) {
          // No school selected - show school selection
          return const _SchoolSelectionPage();
        } else {
          // School is selected - show main app
          return const MainShell();
        }
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
      error: (error, stackTrace) {
        return Scaffold(body: Center(child: Text('Error: $error')));
      },
    );
  }
}

/// School selection page widget
class _SchoolSelectionPage extends ConsumerWidget {
  const _SchoolSelectionPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final schoolRepo = ref.watch(schoolRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.selectSchoolTitle),
        actions: [
          PopupMenuButton<String>(
            tooltip: t.language,
            icon: const Icon(Icons.language),
            onSelected: (value) {
              ref.read(localeProvider.notifier).setLocale(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'ar', child: Text(t.languageArabic)),
              PopupMenuItem(value: 'tr', child: Text(t.languageTurkish)),
              PopupMenuItem(value: 'en', child: Text(t.languageEnglish)),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<School>>(
        future: schoolRepo.getAllSchools(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('${t.error}: ${snapshot.error}'));
          }

          final schools = snapshot.data ?? [];

          if (schools.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(t.noSchoolsFound),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TeacherProfilePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                    ),
                    child: Text(t.manageSchools),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: schools.length,
            itemBuilder: (context, index) {
              final school = schools[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  title: Text(school.name),
                  subtitle: Text('${school.lessonsCount} ${t.lessons}'),
                  onTap: () {
                    ref
                        .read(globalAppStateProvider.notifier)
                        .setSelectedSchool(school.id);
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: null,
    );
  }
}
