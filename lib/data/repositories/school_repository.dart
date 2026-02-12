import 'package:drift/drift.dart';
import '../db/app_database.dart';

class SchoolRepository {
  final AppDatabase _db;

  SchoolRepository(this._db);

  /// Create a new school
  Future<School> createSchool({
    required String name,
    required int lessonsCount,
  }) async {
    final now = DateTime.now();
    final companion = SchoolsCompanion.insert(
      name: name,
      lessonsCount: lessonsCount,
      createdAt: now,
      updatedAt: now,
    );
    final id = await _db.into(_db.schools).insert(companion);
    return (await getSchoolById(id))!;
  }

  /// Get school by ID
  Future<School?> getSchoolById(int id) async {
    return await (_db.select(
      _db.schools,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  /// Update a school
  Future<School> updateSchool({
    required int id,
    required String name,
    required int lessonsCount,
  }) async {
    final now = DateTime.now();
    final companion = SchoolsCompanion(
      id: Value(id),
      name: Value(name),
      lessonsCount: Value(lessonsCount),
      updatedAt: Value(now),
    );
    await _db.update(_db.schools).replace(companion);
    return (await getSchoolById(id))!;
  }

  /// Delete a school
  Future<void> deleteSchool(int id) async {
    await (_db.delete(_db.schools)..where((t) => t.id.equals(id))).go();
  }

  /// Get all schools
  Future<List<School>> getAllSchools() async {
    return await _db.select(_db.schools).get();
  }
}
