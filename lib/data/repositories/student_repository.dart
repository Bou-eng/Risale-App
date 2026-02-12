import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import '../db/app_database.dart';

class StudentRepository {
  final AppDatabase _db;

  StudentRepository(this._db);

  /// Create a new student
  Future<Student> createStudent({
    required int schoolId,
    required String firstName,
    required String lastName,
    String? parentPhone,
    String? level,
  }) async {
    final now = DateTime.now();
    final companion = StudentsCompanion.insert(
      schoolId: schoolId,
      firstName: firstName,
      lastName: lastName,
      parentPhone: Value(parentPhone),
      level: Value(level),
      currentPoints: const Value(0),
      createdAt: now,
      updatedAt: now,
    );
    final id = await _db.into(_db.students).insert(companion);
    return (await getStudentById(id))!;
  }

  /// Get student by ID
  Future<Student?> getStudentById(int id) async {
    return await (_db.select(
      _db.students,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Update a student
  Future<Student> updateStudent({
    required int id,
    required String firstName,
    required String lastName,
    String? parentPhone,
    String? level,
  }) async {
    final now = DateTime.now();
    final companion = StudentsCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      parentPhone: Value(parentPhone),
      level: Value(level),
      updatedAt: Value(now),
    );
    await _db.update(_db.students).replace(companion);
    return (await getStudentById(id))!;
  }

  /// Delete a student and all related data (cascading delete)
  Future<void> deleteStudent(int id) async {
    // Delete all lesson entries for this student
    await (_db.delete(
      _db.lessonEntries,
    )..where((t) => t.studentId.equals(id))).go();

    // Delete all attendances for this student
    await (_db.delete(
      _db.attendances,
    )..where((t) => t.studentId.equals(id))).go();

    // Delete the student row
    await (_db.delete(_db.students)..where((t) => t.id.equals(id))).go();
  }

  /// List students by school
  Future<List<Student>> listBySchool(int schoolId) async {
    return await (_db.select(
      _db.students,
    )..where((t) => t.schoolId.equals(schoolId))).get();
  }

  /// List students by school with a stable ordering
  Future<List<Student>> listStudentsBySchool(int schoolId) async {
    return await (_db.select(_db.students)
          ..where((t) => t.schoolId.equals(schoolId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.firstName),
            (t) => OrderingTerm(expression: t.lastName),
          ]))
        .get();
  }

  /// Search students by school and name query
  Future<List<Student>> searchBySchool(int schoolId, String query) async {
    final lowerQuery = query.toLowerCase();
    return await (_db.select(_db.students)..where(
          (t) =>
              t.schoolId.equals(schoolId) &
              (t.firstName.lower().like('%$lowerQuery%') |
                  t.lastName.lower().like('%$lowerQuery%')),
        ))
        .get();
  }

  /// Add points to a student (safe partial update with verification)
  Future<void> addPoints(int studentId, int delta) async {
    // Read current student
    final student = await getStudentById(studentId);
    if (student == null) {
      debugPrint('ERROR: Student $studentId not found when adding points');
      return;
    }

    final oldPoints = student.currentPoints;
    final newPoints = oldPoints + delta;

    debugPrint(
      'POINTS_UPDATE: studentId=$studentId oldPoints=$oldPoints delta=$delta newPoints=$newPoints',
    );

    // Use update().where().write() to safely update only currentPoints
    await (_db.update(
      _db.students,
    )..where((t) => t.id.equals(studentId))).write(
      StudentsCompanion(
        currentPoints: Value(newPoints),
        updatedAt: Value(DateTime.now()),
      ),
    );

    // Verify the update worked
    final updatedStudent = await getStudentById(studentId);
    if (updatedStudent != null) {
      debugPrint(
        'POINTS_VERIFIED: studentId=$studentId actualPoints=${updatedStudent.currentPoints}',
      );
      if (updatedStudent.currentPoints != newPoints) {
        debugPrint(
          'ERROR: Points update failed! Expected $newPoints but got ${updatedStudent.currentPoints}',
        );
      }
    }
  }

  /// Get top students by points for a school
  Future<List<Student>> topStudentsByPoints(int schoolId, int limit) async {
    return await (_db.select(_db.students)
          ..where((t) => t.schoolId.equals(schoolId))
          ..orderBy([
            (t) => OrderingTerm(
              expression: t.currentPoints,
              mode: OrderingMode.desc,
            ),
          ])
          ..limit(limit))
        .get();
  }

  /// Reset points to 0 for all students in a school
  Future<void> resetPointsForSchool(int schoolId) async {
    await (_db.update(
      _db.students,
    )..where((t) => t.schoolId.equals(schoolId))).write(
      StudentsCompanion(
        currentPoints: const Value(0),
        updatedAt: Value(DateTime.now()),
      ),
    );
    debugPrint('POINTS_RESET: All students in schoolId=$schoolId reset to 0');
  }
}
