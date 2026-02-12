import 'db/app_database.dart';
import 'repositories/teacher_repository.dart';
import 'repositories/school_repository.dart';
import 'repositories/student_repository.dart';
import 'repositories/attendance_repository.dart';
import 'repositories/lesson_repository.dart';
import 'util/date_utils.dart' as app_date_utils;

/// Debug function to test database initialization and basic CRUD operations
Future<void> runDatabaseTest() async {
  print('=== DATABASE TEST START ===\n');

  // Get database instance
  final db = AppDatabase.instance;

  // Initialize repositories
  final teacherRepo = TeacherRepository(db);
  final schoolRepo = SchoolRepository(db);
  final studentRepo = StudentRepository(db);
  final attendanceRepo = AttendanceRepository(db);
  final lessonRepo = LessonRepository(db);

  try {
    // 1. Check if teacher profile exists
    print('1. Checking teacher profile...');
    final teacherExists = await teacherRepo.teacherExists();
    print('   Teacher exists: $teacherExists\n');

    // 2. Insert teacher profile
    print('2. Creating teacher profile...');
    final teacher = await teacherRepo.upsertTeacher(
      firstName: 'Ahmed',
      lastName: 'Hassan',
      className: '5A',
      lessonLoggingMode: 0, // oneEntryPerDay
    );
    print('   Teacher created: ${teacher.firstName} ${teacher.lastName}');
    print('   Class: ${teacher.className}');
    print('   Logging mode: ${teacher.lessonLoggingMode}\n');

    // 3. Insert 2 schools
    print('3. Creating schools...');
    final school1 = await schoolRepo.createSchool(
      name: 'المدرسة الأولى',
      lessonsCount: 5,
    );
    final school2 = await schoolRepo.createSchool(
      name: 'المدرسة الثانية',
      lessonsCount: 6,
    );
    print('   School 1: ${school1.name} (${school1.lessonsCount} lessons)');
    print('   School 2: ${school2.name} (${school2.lessonsCount} lessons)\n');

    // 4. Insert 2 students in school 1
    print('4. Creating students in School 1...');
    final student1 = await studentRepo.createStudent(
      schoolId: school1.id,
      firstName: 'محمد',
      lastName: 'علي',
      parentPhone: '555-000-0001',
      level: 'متقدم',
    );
    final student2 = await studentRepo.createStudent(
      schoolId: school1.id,
      firstName: 'فاطمة',
      lastName: 'أحمد',
      parentPhone: '555-000-0002',
      level: 'متوسط',
    );
    print(
      '   Student 1: ${student1.firstName} ${student1.lastName}, Parent Phone: ${student1.parentPhone}, Level: ${student1.level}',
    );
    print(
      '   Student 2: ${student2.firstName} ${student2.lastName}, Parent Phone: ${student2.parentPhone}, Level: ${student2.level}\n',
    );

    // 5. Write attendance record for today
    print('5. Recording attendance for today...');
    final today = app_date_utils.DateUtils.today();
    await attendanceRepo.setAbsent(
      studentId: student1.id,
      schoolId: school1.id,
      date: today,
      isAbsent: false,
    );
    await attendanceRepo.setAbsent(
      studentId: student2.id,
      schoolId: school1.id,
      date: today,
      isAbsent: true,
    );
    print('   ${student1.firstName}: Present');
    print('   ${student2.firstName}: Absent\n');

    // 6. Write lesson entry for today
    print('6. Creating lesson entry...');
    final lessonEntry = await lessonRepo.upsertSingleEntry(
      studentId: student1.id,
      schoolId: school1.id,
      date: today,
      pageStudied: 'Page 45-50',
      isPassed: true,
      attitude: 0, // good
      notes: 'Excellent performance',
      pointsDelta: 5,
      studentRepo: studentRepo,
    );
    print('   Lesson for ${student1.firstName}:');
    print('   - Page: ${lessonEntry.pageStudied}');
    print('   - Passed: ${lessonEntry.isPassed}');
    print(
      '   - Attitude: ${lessonEntry.attitude == 0
          ? "Good"
          : lessonEntry.attitude == 1
          ? "Medium"
          : "Bad"}',
    );
    print('   - Points: +${lessonEntry.pointsDelta}');
    print('   - Notes: ${lessonEntry.notes}\n');

    // 7. Update student points
    print('7. Updating student points...');
    await studentRepo.addPoints(student1.id, lessonEntry.pointsDelta);
    final updatedStudent = await studentRepo.getStudentById(student1.id);
    print(
      '   ${updatedStudent!.firstName} current points: ${updatedStudent.currentPoints}\n',
    );

    // 8. Read back and verify
    print('8. Verifying data...');
    final allSchools = await schoolRepo.getAllSchools();
    print('   Total schools: ${allSchools.length}');

    final studentsInSchool1 = await studentRepo.listBySchool(school1.id);
    print('   Students in School 1: ${studentsInSchool1.length}');

    final todayAttendance = await attendanceRepo.getByDate(
      schoolId: school1.id,
      date: today,
    );
    print('   Attendance records for today: ${todayAttendance.length}');

    final todayLessons = await lessonRepo.listBySchoolAndDate(
      schoolId: school1.id,
      date: today,
    );
    print('   Lesson entries for today: ${todayLessons.length}\n');

    print('=== DATABASE TEST COMPLETED SUCCESSFULLY ===');
  } catch (e, stackTrace) {
    print('\n!!! ERROR DURING DATABASE TEST !!!');
    print('Error: $e');
    print('StackTrace: $stackTrace');
  }
}
