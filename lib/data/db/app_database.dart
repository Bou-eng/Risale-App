import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// ============================================================================
// TABLE DEFINITIONS
// ============================================================================

/// TeacherProfile table (single row pattern)
class TeacherProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get className => text()();
  IntColumn get lessonLoggingMode =>
      integer()(); // 0 = oneEntryPerDay, 1 = multipleEntriesPerDay
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Schools table
class Schools extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get lessonsCount => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Students table
class Students extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get schoolId =>
      integer().references(Schools, #id, onDelete: KeyAction.cascade)();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get parentPhone => text().nullable()();
  TextColumn get level => text().nullable()();
  IntColumn get currentPoints => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Attendance table
class Attendances extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get studentId =>
      integer().references(Students, #id, onDelete: KeyAction.cascade)();
  IntColumn get schoolId => integer()(); // duplicate for faster queries
  TextColumn get date => text()(); // ISO date string (yyyy-mm-dd)
  BoolColumn get isAbsent => boolean()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {studentId, date},
  ];
}

/// LessonEntries table
class LessonEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get studentId =>
      integer().references(Students, #id, onDelete: KeyAction.cascade)();
  IntColumn get schoolId => integer()();
  TextColumn get date => text()(); // ISO date string
  IntColumn get entryIndex =>
      integer().nullable()(); // for multiple entries per day mode
  TextColumn get pageStudied => text()();
  BoolColumn get isPassed => boolean()();
  IntColumn get attitude => integer()(); // 0 = good, 1 = medium, 2 = bad
  TextColumn get notes => text().nullable()();
  IntColumn get pointsDelta => integer()(); // computed points for this entry
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {studentId, date, entryIndex},
  ];
}

/// DayReports table
class DayReports extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get schoolId =>
      integer().references(Schools, #id, onDelete: KeyAction.cascade)();
  TextColumn get date => text()(); // ISO date string
  IntColumn get lessonIndex => integer()(); // 1..N
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {schoolId, date, lessonIndex},
  ];
}

/// Meetings table
class Meetings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get schoolId =>
      integer().references(Schools, #id, onDelete: KeyAction.cascade)();
  TextColumn get date =>
      text()(); // ISO date string for meeting month (first day of month)
  TextColumn get content =>
      text().withDefault(const Constant(''))(); // Meeting notes
  IntColumn get top1StudentId => integer().nullable()();
  IntColumn get top2StudentId => integer().nullable()();
  IntColumn get top3StudentId => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {schoolId, date},
  ];
}

// ============================================================================
// DATABASE
// ============================================================================

@DriftDatabase(
  tables: [
    TeacherProfiles,
    Schools,
    Students,
    Attendances,
    LessonEntries,
    DayReports,
    Meetings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.addColumn(students, students.parentPhone);
      }
    },
  );

  // Singleton pattern
  static AppDatabase? _instance;

  static AppDatabase get instance {
    _instance ??= AppDatabase();
    return _instance!;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'teacher_app.db'));
    return NativeDatabase(file);
  });
}
