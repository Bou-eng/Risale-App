import 'package:drift/drift.dart';
import '../db/app_database.dart';
import '../util/date_utils.dart' as app_date_utils;

class AttendanceRepository {
  final AppDatabase _db;

  AttendanceRepository(this._db);

  /// Set attendance status for a student on a specific date
  Future<void> setAbsent({
    required int studentId,
    required int schoolId,
    required DateTime date,
    required bool isAbsent,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    final now = DateTime.now();

    // Use insertOrReplace mode for proper upsert (handles unique constraint on studentId + date)
    final companion = AttendancesCompanion.insert(
      studentId: studentId,
      schoolId: schoolId,
      date: dateStr,
      isAbsent: isAbsent,
      createdAt: now,
    );

    await _db
        .into(_db.attendances)
        .insert(companion, mode: InsertMode.insertOrReplace);
  }

  /// Get all attendance records for a school on a specific date
  Future<List<Attendance>> getByDate({
    required int schoolId,
    required DateTime date,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    return await (_db.select(_db.attendances)
          ..where((t) => t.schoolId.equals(schoolId) & t.date.equals(dateStr)))
        .get();
  }

  /// Check if a student is marked absent on a specific date
  Future<bool> isAbsent({
    required int studentId,
    required DateTime date,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    final record =
        await (_db.select(_db.attendances)..where(
              (t) => t.studentId.equals(studentId) & t.date.equals(dateStr),
            ))
            .getSingleOrNull();
    return record?.isAbsent ?? false;
  }

  /// Bulk save attendance for multiple students on a specific date
  Future<void> saveAttendanceForDay({
    required int schoolId,
    required DateTime date,
    required Map<int, bool> isAbsentByStudentId,
  }) async {
    for (final entry in isAbsentByStudentId.entries) {
      await setAbsent(
        studentId: entry.key,
        schoolId: schoolId,
        date: date,
        isAbsent: entry.value,
      );
    }
  }
}
