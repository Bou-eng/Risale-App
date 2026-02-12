import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import '../db/app_database.dart';
import '../util/date_utils.dart' as app_date_utils;

class MeetingRepository {
  final AppDatabase _db;

  MeetingRepository(this._db);

  /// Get meeting by school and month (monthKey = first day of month)
  Future<Meeting?> getBySchoolAndMonth(int schoolId, DateTime monthKey) async {
    final monthStr = app_date_utils.DateUtils.toIsoDate(monthKey);
    return await (_db.select(_db.meetings)
          ..where((t) => t.schoolId.equals(schoolId) & t.date.equals(monthStr)))
        .getSingleOrNull();
  }

  /// Upsert meeting with top 3 student IDs for a school and month
  Future<void> upsertMeetingTop3({
    required int schoolId,
    required DateTime monthKey,
    required int? top1StudentId,
    required int? top2StudentId,
    required int? top3StudentId,
  }) async {
    final monthStr = app_date_utils.DateUtils.toIsoDate(monthKey);
    final now = DateTime.now();

    final existing = await getBySchoolAndMonth(schoolId, monthKey);

    if (existing != null) {
      // Update existing
      await (_db.update(
        _db.meetings,
      )..where((t) => t.id.equals(existing.id))).write(
        MeetingsCompanion(
          top1StudentId: Value(top1StudentId),
          top2StudentId: Value(top2StudentId),
          top3StudentId: Value(top3StudentId),
          updatedAt: Value(now),
        ),
      );
    } else {
      // Insert new
      await _db
          .into(_db.meetings)
          .insert(
            MeetingsCompanion.insert(
              schoolId: schoolId,
              date: monthStr,
              top1StudentId: Value(top1StudentId),
              top2StudentId: Value(top2StudentId),
              top3StudentId: Value(top3StudentId),
              createdAt: now,
            ),
          );
    }
  }

  /// Upsert meeting for a school and month (legacy method for notes only)
  Future<void> upsertMeeting(
    int schoolId,
    DateTime monthKey,
    String content,
  ) async {
    final monthStr = app_date_utils.DateUtils.toIsoDate(monthKey);
    final now = DateTime.now();

    final existing = await getBySchoolAndMonth(schoolId, monthKey);

    if (existing != null) {
      // Update existing
      await (_db.update(
        _db.meetings,
      )..where((t) => t.id.equals(existing.id))).write(
        MeetingsCompanion(content: Value(content), updatedAt: Value(now)),
      );
    } else {
      // Insert new
      await _db
          .into(_db.meetings)
          .insert(
            MeetingsCompanion.insert(
              schoolId: schoolId,
              date: monthStr,
              content: Value(content),
              createdAt: now,
            ),
          );
    }
  }

  /// Create a new meeting (legacy method - kept for compatibility)
  Future<Meeting> createMeeting({
    required int schoolId,
    required DateTime date,
    int? top1StudentId,
    int? top2StudentId,
    int? top3StudentId,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    final now = DateTime.now();

    final companion = MeetingsCompanion.insert(
      schoolId: schoolId,
      date: dateStr,
      top1StudentId: Value(top1StudentId),
      top2StudentId: Value(top2StudentId),
      top3StudentId: Value(top3StudentId),
      createdAt: now,
    );
    final id = await _db.into(_db.meetings).insert(companion);
    return (await _getMeetingById(id))!;
  }

  /// Get meeting by ID
  Future<Meeting?> _getMeetingById(int id) async {
    return await (_db.select(
      _db.meetings,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// List meetings for a school
  Future<List<Meeting>> listMeetings(int schoolId) async {
    return await (_db.select(_db.meetings)
          ..where((t) => t.schoolId.equals(schoolId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .get();
  }

  /// Get meeting for a specific school and date (legacy method)
  Future<Meeting?> getMeetingByDate({
    required int schoolId,
    required DateTime date,
  }) async {
    final dateStr = app_date_utils.DateUtils.toIsoDate(date);
    return await (_db.select(_db.meetings)
          ..where((t) => t.schoolId.equals(schoolId) & t.date.equals(dateStr)))
        .getSingleOrNull();
  }

  /// Finish monthly meeting: record top 3 and reset all student points in a transaction
  Future<void> finishMeeting({
    required int schoolId,
    required DateTime monthKey,
    required List<int> top3StudentIds,
  }) async {
    await _db.transaction(() async {
      // Extract top 1, 2, 3 from list
      final top1 = top3StudentIds.isNotEmpty ? top3StudentIds[0] : null;
      final top2 = top3StudentIds.length > 1 ? top3StudentIds[1] : null;
      final top3 = top3StudentIds.length > 2 ? top3StudentIds[2] : null;

      // Upsert meeting with top 3 student IDs
      await upsertMeetingTop3(
        schoolId: schoolId,
        monthKey: monthKey,
        top1StudentId: top1,
        top2StudentId: top2,
        top3StudentId: top3,
      );

      // Reset all points for this school
      await (_db.update(
        _db.students,
      )..where((t) => t.schoolId.equals(schoolId))).write(
        StudentsCompanion(
          currentPoints: const Value(0),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });

    debugPrint(
      'MEETING_FINISHED: schoolId=$schoolId monthKey=$monthKey top3=$top3StudentIds',
    );
  }
}
