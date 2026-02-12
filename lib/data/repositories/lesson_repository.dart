import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import '../db/app_database.dart';
import '../util/date_utils.dart' as app_date_utils;
import 'student_repository.dart';

class LessonRepository {
  final AppDatabase _db;

  LessonRepository(this._db);

  /// Upsert a single lesson entry (for oneEntryPerDay mode) with points update in transaction
  Future<LessonEntry> upsertSingleEntry({
    required int studentId,
    required int schoolId,
    required DateTime date,
    required String pageStudied,
    required bool isPassed,
    required int attitude,
    String? notes,
    required int pointsDelta,
    required StudentRepository studentRepo,
    int? oldPointsDelta,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    final now = DateTime.now();

    // Execute lesson save + points update in a single transaction
    return await _db.transaction(() async {
      // Check if entry exists (entryIndex null or 0)
      final existing =
          await (_db.select(_db.lessonEntries)..where(
                (t) =>
                    t.studentId.equals(studentId) &
                    t.date.equals(dateStr) &
                    t.entryIndex.isNull(),
              ))
              .getSingleOrNull();

      if (existing != null) {
        // Update existing - use where() to avoid missing required fields
        await (_db.update(
          _db.lessonEntries,
        )..where((t) => t.id.equals(existing.id))).write(
          LessonEntriesCompanion(
            pageStudied: Value(pageStudied),
            isPassed: Value(isPassed),
            attitude: Value(attitude),
            notes: Value(notes),
            pointsDelta: Value(pointsDelta),
          ),
        );

        // Calculate adjustment for edit mode
        final oldDelta = oldPointsDelta ?? existing.pointsDelta;
        final adjustment = pointsDelta - oldDelta;
        debugPrint(
          'LESSON_UPDATE: studentId=$studentId oldDelta=$oldDelta newDelta=$pointsDelta adjustment=$adjustment',
        );

        // Update student points
        await studentRepo.addPoints(studentId, adjustment);

        return (await _getLessonEntryById(existing.id))!;
      } else {
        // Insert new
        final companion = LessonEntriesCompanion.insert(
          studentId: studentId,
          schoolId: schoolId,
          date: dateStr,
          entryIndex: const Value(null),
          pageStudied: pageStudied,
          isPassed: isPassed,
          attitude: attitude,
          notes: Value(notes),
          pointsDelta: pointsDelta,
          createdAt: now,
        );
        final id = await _db.into(_db.lessonEntries).insert(companion);

        debugPrint(
          'LESSON_INSERT: studentId=$studentId pointsDelta=$pointsDelta isPassed=$isPassed attitude=$attitude',
        );

        // Update student points
        await studentRepo.addPoints(studentId, pointsDelta);

        return (await _getLessonEntryById(id))!;
      }
    });
  }

  /// Insert a lesson entry for multiple entries per day mode with points update in transaction
  Future<LessonEntry> insertMultiEntry({
    required int studentId,
    required int schoolId,
    required DateTime date,
    required int entryIndex,
    required String pageStudied,
    required bool isPassed,
    required int attitude,
    String? notes,
    required int pointsDelta,
    required StudentRepository studentRepo,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    final now = DateTime.now();

    return await _db.transaction(() async {
      final companion = LessonEntriesCompanion.insert(
        studentId: studentId,
        schoolId: schoolId,
        date: dateStr,
        entryIndex: Value(entryIndex),
        pageStudied: pageStudied,
        isPassed: isPassed,
        attitude: attitude,
        notes: Value(notes),
        pointsDelta: pointsDelta,
        createdAt: now,
      );
      final id = await _db.into(_db.lessonEntries).insert(companion);

      debugPrint(
        'LESSON_MULTI_INSERT: studentId=$studentId pointsDelta=$pointsDelta entryIndex=$entryIndex',
      );

      // Update student points
      await studentRepo.addPoints(studentId, pointsDelta);

      return (await _getLessonEntryById(id))!;
    });
  }

  /// Get lesson entry by ID
  Future<LessonEntry?> _getLessonEntryById(int id) async {
    return await (_db.select(
      _db.lessonEntries,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// List all lesson entries for a student
  Future<List<LessonEntry>> listStudentEntries(int studentId) async {
    return await (_db.select(_db.lessonEntries)
          ..where((t) => t.studentId.equals(studentId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .get();
  }

  /// List lesson entries by school and date
  Future<List<LessonEntry>> listBySchoolAndDate({
    required int schoolId,
    required DateTime date,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    return await (_db.select(_db.lessonEntries)
          ..where((t) => t.schoolId.equals(schoolId) & t.date.equals(dateStr)))
        .get();
  }

  /// Get single entry for a student on a date (for one-entry-per-day mode)
  Future<LessonEntry?> getSingleEntry({
    required int studentId,
    required DateTime date,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    return await (_db.select(_db.lessonEntries)..where(
          (t) =>
              t.studentId.equals(studentId) &
              t.date.equals(dateStr) &
              t.entryIndex.isNull(),
        ))
        .getSingleOrNull();
  }

  /// Check if entry exists for student on a date
  Future<bool> hasEntryForDate({
    required int studentId,
    required DateTime date,
  }) async {
    final entry = await getSingleEntry(studentId: studentId, date: date);
    return entry != null;
  }

  /// Get next entry index for multiple entries mode
  Future<int> getNextEntryIndex({
    required int studentId,
    required DateTime date,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    final entries =
        await (_db.select(_db.lessonEntries)..where(
              (t) => t.studentId.equals(studentId) & t.date.equals(dateStr),
            ))
            .get();

    if (entries.isEmpty) return 1;

    // Find max entryIndex
    int maxIndex = 0;
    for (final entry in entries) {
      final idx = entry.entryIndex ?? 0;
      if (idx > maxIndex) maxIndex = idx;
    }
    return maxIndex + 1;
  }
}
