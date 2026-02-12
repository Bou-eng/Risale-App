import 'package:drift/drift.dart';
import '../db/app_database.dart';
import '../util/date_utils.dart' as app_date_utils;

class DayReportRepository {
  final AppDatabase _db;

  DayReportRepository(this._db);

  /// Upsert a lesson text for a specific day and lesson index
  Future<DayReport> upsertLessonText({
    required int schoolId,
    required DateTime date,
    required int lessonIndex,
    required String text,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    final now = DateTime.now();

    // Check if report exists
    final existing =
        await (_db.select(_db.dayReports)..where(
              (t) =>
                  t.schoolId.equals(schoolId) &
                  t.date.equals(dateStr) &
                  t.lessonIndex.equals(lessonIndex),
            ))
            .getSingleOrNull();

    if (existing != null) {
      // Update existing
      final companion = DayReportsCompanion(
        id: Value(existing.id),
        content: Value(text),
      );
      await _db.update(_db.dayReports).replace(companion);
      return (await _getDayReportById(existing.id))!;
    } else {
      // Insert new
      final companion = DayReportsCompanion.insert(
        schoolId: schoolId,
        date: dateStr,
        lessonIndex: lessonIndex,
        content: text,
        createdAt: now,
      );
      final id = await _db.into(_db.dayReports).insert(companion);
      return (await _getDayReportById(id))!;
    }
  }

  /// Get day report by ID
  Future<DayReport?> _getDayReportById(int id) async {
    return await (_db.select(
      _db.dayReports,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Get all reports for a school on a specific date
  Future<List<DayReport>> getDayReport({
    required int schoolId,
    required DateTime date,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    return await (_db.select(_db.dayReports)
          ..where((t) => t.schoolId.equals(schoolId) & t.date.equals(dateStr))
          ..orderBy([(t) => OrderingTerm.asc(t.lessonIndex)]))
        .get();
  }

  /// Get report by school and date (returns first matching report)
  Future<DayReport?> getBySchoolAndDate(int schoolId, DateTime date) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    return await (_db.select(_db.dayReports)
          ..where((t) => t.schoolId.equals(schoolId) & t.date.equals(dateStr))
          ..limit(1))
        .getSingleOrNull();
  }

  /// List all day reports for a school up to and including a given date, ordered by date ASC
  Future<List<DayReport>> listReportsUpToDate({
    required int schoolId,
    required DateTime endDate,
  }) async {
    final endDateStr = app_date_utils.DateUtils.toIsoDate(endDate);
    return await (_db.select(_db.dayReports)
          ..where(
            (t) =>
                t.schoolId.equals(schoolId) &
                t.date.isSmallerOrEqualValue(endDateStr),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
  }
}
