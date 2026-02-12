import 'package:drift/drift.dart';
import '../db/app_database.dart';

class TeacherRepository {
  final AppDatabase _db;

  TeacherRepository(this._db);

  /// Get the teacher profile (only one should exist)
  Future<TeacherProfile?> getTeacher() async {
    final query = _db.select(_db.teacherProfiles);
    final results = await query.get();
    return results.isEmpty ? null : results.first;
  }

  /// Check if a teacher profile exists
  Future<bool> teacherExists() async {
    final teacher = await getTeacher();
    return teacher != null;
  }

  /// Upsert (insert or update) teacher profile (single row pattern)
  Future<TeacherProfile> upsertTeacher({
    required String firstName,
    required String lastName,
    required String className,
    required int lessonLoggingMode,
  }) async {
    final now = DateTime.now();
    final existing = await getTeacher();

    if (existing != null) {
      // Update existing
      final companion = TeacherProfilesCompanion(
        id: Value(existing.id),
        firstName: Value(firstName),
        lastName: Value(lastName),
        className: Value(className),
        lessonLoggingMode: Value(lessonLoggingMode),
        updatedAt: Value(now),
      );
      await _db.update(_db.teacherProfiles).replace(companion);
      return (await getTeacher())!;
    } else {
      // Insert new
      final companion = TeacherProfilesCompanion.insert(
        firstName: firstName,
        lastName: lastName,
        className: className,
        lessonLoggingMode: lessonLoggingMode,
        createdAt: now,
        updatedAt: now,
      );
      await _db.into(_db.teacherProfiles).insert(companion);
      return (await getTeacher())!;
    }
  }
}
