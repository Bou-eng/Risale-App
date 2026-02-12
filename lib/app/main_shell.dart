import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:risale_app/l10n/app_localizations.dart';
import '../state/locale_provider.dart';
import '../state/providers.dart';
import '../ui/widgets/language_selector.dart';
import 'bootstrap_gate.dart';
import 'pages/home_page.dart';
import 'pages/students_page.dart';
import 'pages/lesson_page.dart';
import 'pages/reports_page.dart';

/// MainShell: Bottom navigation with 4 tabs (Home, Students, Lesson, Reports)
/// Uses IndexedStack to preserve tab state during navigation
class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const StudentsPage(),
    const LessonPage(),
    const ReportsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final locale = ref.watch(localeProvider);
    final isRtl = locale.languageCode == 'ar';

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.appTitle),
          centerTitle: true,
          actions: [
            const LanguageSelectorIconButton(),
            IconButton(
              icon: const Icon(Icons.school),
              tooltip: t.changeSchool,
              onPressed: () {
                // Clear selected school and return to school selection
                ref
                    .read(globalAppStateProvider.notifier)
                    .setSelectedSchool(null);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const BootstrapGate()),
                );
              },
            ),
          ],
        ),
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: t.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.people),
              label: t.students,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.book),
              label: t.lessons,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.assessment),
              label: t.reports,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
