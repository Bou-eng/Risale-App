// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TeacherProfilesTable extends TeacherProfiles
    with TableInfo<$TeacherProfilesTable, TeacherProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeacherProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _classNameMeta = const VerificationMeta(
    'className',
  );
  @override
  late final GeneratedColumn<String> className = GeneratedColumn<String>(
    'class_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lessonLoggingModeMeta = const VerificationMeta(
    'lessonLoggingMode',
  );
  @override
  late final GeneratedColumn<int> lessonLoggingMode = GeneratedColumn<int>(
    'lesson_logging_mode',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    firstName,
    lastName,
    className,
    lessonLoggingMode,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teacher_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeacherProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('class_name')) {
      context.handle(
        _classNameMeta,
        className.isAcceptableOrUnknown(data['class_name']!, _classNameMeta),
      );
    } else if (isInserting) {
      context.missing(_classNameMeta);
    }
    if (data.containsKey('lesson_logging_mode')) {
      context.handle(
        _lessonLoggingModeMeta,
        lessonLoggingMode.isAcceptableOrUnknown(
          data['lesson_logging_mode']!,
          _lessonLoggingModeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lessonLoggingModeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeacherProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeacherProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      className: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}class_name'],
      )!,
      lessonLoggingMode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lesson_logging_mode'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TeacherProfilesTable createAlias(String alias) {
    return $TeacherProfilesTable(attachedDatabase, alias);
  }
}

class TeacherProfile extends DataClass implements Insertable<TeacherProfile> {
  final int id;
  final String firstName;
  final String lastName;
  final String className;
  final int lessonLoggingMode;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TeacherProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.className,
    required this.lessonLoggingMode,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['class_name'] = Variable<String>(className);
    map['lesson_logging_mode'] = Variable<int>(lessonLoggingMode);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TeacherProfilesCompanion toCompanion(bool nullToAbsent) {
    return TeacherProfilesCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      className: Value(className),
      lessonLoggingMode: Value(lessonLoggingMode),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TeacherProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeacherProfile(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      className: serializer.fromJson<String>(json['className']),
      lessonLoggingMode: serializer.fromJson<int>(json['lessonLoggingMode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'className': serializer.toJson<String>(className),
      'lessonLoggingMode': serializer.toJson<int>(lessonLoggingMode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TeacherProfile copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? className,
    int? lessonLoggingMode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => TeacherProfile(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    className: className ?? this.className,
    lessonLoggingMode: lessonLoggingMode ?? this.lessonLoggingMode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  TeacherProfile copyWithCompanion(TeacherProfilesCompanion data) {
    return TeacherProfile(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      className: data.className.present ? data.className.value : this.className,
      lessonLoggingMode: data.lessonLoggingMode.present
          ? data.lessonLoggingMode.value
          : this.lessonLoggingMode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeacherProfile(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('className: $className, ')
          ..write('lessonLoggingMode: $lessonLoggingMode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    firstName,
    lastName,
    className,
    lessonLoggingMode,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeacherProfile &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.className == this.className &&
          other.lessonLoggingMode == this.lessonLoggingMode &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TeacherProfilesCompanion extends UpdateCompanion<TeacherProfile> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> className;
  final Value<int> lessonLoggingMode;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TeacherProfilesCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.className = const Value.absent(),
    this.lessonLoggingMode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TeacherProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    required String className,
    required int lessonLoggingMode,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : firstName = Value(firstName),
       lastName = Value(lastName),
       className = Value(className),
       lessonLoggingMode = Value(lessonLoggingMode),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<TeacherProfile> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? className,
    Expression<int>? lessonLoggingMode,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (className != null) 'class_name': className,
      if (lessonLoggingMode != null) 'lesson_logging_mode': lessonLoggingMode,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TeacherProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? firstName,
    Value<String>? lastName,
    Value<String>? className,
    Value<int>? lessonLoggingMode,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return TeacherProfilesCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      className: className ?? this.className,
      lessonLoggingMode: lessonLoggingMode ?? this.lessonLoggingMode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (className.present) {
      map['class_name'] = Variable<String>(className.value);
    }
    if (lessonLoggingMode.present) {
      map['lesson_logging_mode'] = Variable<int>(lessonLoggingMode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeacherProfilesCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('className: $className, ')
          ..write('lessonLoggingMode: $lessonLoggingMode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SchoolsTable extends Schools with TableInfo<$SchoolsTable, School> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lessonsCountMeta = const VerificationMeta(
    'lessonsCount',
  );
  @override
  late final GeneratedColumn<int> lessonsCount = GeneratedColumn<int>(
    'lessons_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    lessonsCount,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schools';
  @override
  VerificationContext validateIntegrity(
    Insertable<School> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lessons_count')) {
      context.handle(
        _lessonsCountMeta,
        lessonsCount.isAcceptableOrUnknown(
          data['lessons_count']!,
          _lessonsCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lessonsCountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  School map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return School(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      lessonsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lessons_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SchoolsTable createAlias(String alias) {
    return $SchoolsTable(attachedDatabase, alias);
  }
}

class School extends DataClass implements Insertable<School> {
  final int id;
  final String name;
  final int lessonsCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  const School({
    required this.id,
    required this.name,
    required this.lessonsCount,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['lessons_count'] = Variable<int>(lessonsCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SchoolsCompanion toCompanion(bool nullToAbsent) {
    return SchoolsCompanion(
      id: Value(id),
      name: Value(name),
      lessonsCount: Value(lessonsCount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory School.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return School(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lessonsCount: serializer.fromJson<int>(json['lessonsCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lessonsCount': serializer.toJson<int>(lessonsCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  School copyWith({
    int? id,
    String? name,
    int? lessonsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => School(
    id: id ?? this.id,
    name: name ?? this.name,
    lessonsCount: lessonsCount ?? this.lessonsCount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  School copyWithCompanion(SchoolsCompanion data) {
    return School(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      lessonsCount: data.lessonsCount.present
          ? data.lessonsCount.value
          : this.lessonsCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('School(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lessonsCount: $lessonsCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, lessonsCount, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is School &&
          other.id == this.id &&
          other.name == this.name &&
          other.lessonsCount == this.lessonsCount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SchoolsCompanion extends UpdateCompanion<School> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> lessonsCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SchoolsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lessonsCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SchoolsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int lessonsCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       lessonsCount = Value(lessonsCount),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<School> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? lessonsCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lessonsCount != null) 'lessons_count': lessonsCount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SchoolsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? lessonsCount,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SchoolsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lessonsCount: lessonsCount ?? this.lessonsCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lessonsCount.present) {
      map['lessons_count'] = Variable<int>(lessonsCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchoolsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lessonsCount: $lessonsCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<int> schoolId = GeneratedColumn<int>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES schools (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentPhoneMeta = const VerificationMeta(
    'parentPhone',
  );
  @override
  late final GeneratedColumn<String> parentPhone = GeneratedColumn<String>(
    'parent_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
    'level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentPointsMeta = const VerificationMeta(
    'currentPoints',
  );
  @override
  late final GeneratedColumn<int> currentPoints = GeneratedColumn<int>(
    'current_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    schoolId,
    firstName,
    lastName,
    parentPhone,
    level,
    currentPoints,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(
    Insertable<Student> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('parent_phone')) {
      context.handle(
        _parentPhoneMeta,
        parentPhone.isAcceptableOrUnknown(
          data['parent_phone']!,
          _parentPhoneMeta,
        ),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('current_points')) {
      context.handle(
        _currentPointsMeta,
        currentPoints.isAcceptableOrUnknown(
          data['current_points']!,
          _currentPointsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}school_id'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      parentPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_phone'],
      ),
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}level'],
      ),
      currentPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_points'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final int schoolId;
  final String firstName;
  final String lastName;
  final String? parentPhone;
  final String? level;
  final int currentPoints;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Student({
    required this.id,
    required this.schoolId,
    required this.firstName,
    required this.lastName,
    this.parentPhone,
    this.level,
    required this.currentPoints,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['school_id'] = Variable<int>(schoolId);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || parentPhone != null) {
      map['parent_phone'] = Variable<String>(parentPhone);
    }
    if (!nullToAbsent || level != null) {
      map['level'] = Variable<String>(level);
    }
    map['current_points'] = Variable<int>(currentPoints);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      firstName: Value(firstName),
      lastName: Value(lastName),
      parentPhone: parentPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(parentPhone),
      level: level == null && nullToAbsent
          ? const Value.absent()
          : Value(level),
      currentPoints: Value(currentPoints),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Student.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      schoolId: serializer.fromJson<int>(json['schoolId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      parentPhone: serializer.fromJson<String?>(json['parentPhone']),
      level: serializer.fromJson<String?>(json['level']),
      currentPoints: serializer.fromJson<int>(json['currentPoints']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'schoolId': serializer.toJson<int>(schoolId),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'parentPhone': serializer.toJson<String?>(parentPhone),
      'level': serializer.toJson<String?>(level),
      'currentPoints': serializer.toJson<int>(currentPoints),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Student copyWith({
    int? id,
    int? schoolId,
    String? firstName,
    String? lastName,
    Value<String?> parentPhone = const Value.absent(),
    Value<String?> level = const Value.absent(),
    int? currentPoints,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Student(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    parentPhone: parentPhone.present ? parentPhone.value : this.parentPhone,
    level: level.present ? level.value : this.level,
    currentPoints: currentPoints ?? this.currentPoints,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Student copyWithCompanion(StudentsCompanion data) {
    return Student(
      id: data.id.present ? data.id.value : this.id,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      parentPhone: data.parentPhone.present
          ? data.parentPhone.value
          : this.parentPhone,
      level: data.level.present ? data.level.value : this.level,
      currentPoints: data.currentPoints.present
          ? data.currentPoints.value
          : this.currentPoints,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('parentPhone: $parentPhone, ')
          ..write('level: $level, ')
          ..write('currentPoints: $currentPoints, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    schoolId,
    firstName,
    lastName,
    parentPhone,
    level,
    currentPoints,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.parentPhone == this.parentPhone &&
          other.level == this.level &&
          other.currentPoints == this.currentPoints &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<int> schoolId;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> parentPhone;
  final Value<String?> level;
  final Value<int> currentPoints;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.parentPhone = const Value.absent(),
    this.level = const Value.absent(),
    this.currentPoints = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    required int schoolId,
    required String firstName,
    required String lastName,
    this.parentPhone = const Value.absent(),
    this.level = const Value.absent(),
    this.currentPoints = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : schoolId = Value(schoolId),
       firstName = Value(firstName),
       lastName = Value(lastName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<int>? schoolId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? parentPhone,
    Expression<String>? level,
    Expression<int>? currentPoints,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schoolId != null) 'school_id': schoolId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (parentPhone != null) 'parent_phone': parentPhone,
      if (level != null) 'level': level,
      if (currentPoints != null) 'current_points': currentPoints,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StudentsCompanion copyWith({
    Value<int>? id,
    Value<int>? schoolId,
    Value<String>? firstName,
    Value<String>? lastName,
    Value<String?>? parentPhone,
    Value<String?>? level,
    Value<int>? currentPoints,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return StudentsCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      parentPhone: parentPhone ?? this.parentPhone,
      level: level ?? this.level,
      currentPoints: currentPoints ?? this.currentPoints,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<int>(schoolId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (parentPhone.present) {
      map['parent_phone'] = Variable<String>(parentPhone.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (currentPoints.present) {
      map['current_points'] = Variable<int>(currentPoints.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('parentPhone: $parentPhone, ')
          ..write('level: $level, ')
          ..write('currentPoints: $currentPoints, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AttendancesTable extends Attendances
    with TableInfo<$AttendancesTable, Attendance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES students (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<int> schoolId = GeneratedColumn<int>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isAbsentMeta = const VerificationMeta(
    'isAbsent',
  );
  @override
  late final GeneratedColumn<bool> isAbsent = GeneratedColumn<bool>(
    'is_absent',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_absent" IN (0, 1))',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentId,
    schoolId,
    date,
    isAbsent,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendances';
  @override
  VerificationContext validateIntegrity(
    Insertable<Attendance> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_absent')) {
      context.handle(
        _isAbsentMeta,
        isAbsent.isAcceptableOrUnknown(data['is_absent']!, _isAbsentMeta),
      );
    } else if (isInserting) {
      context.missing(_isAbsentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {studentId, date},
  ];
  @override
  Attendance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attendance(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_id'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}school_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      isAbsent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_absent'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AttendancesTable createAlias(String alias) {
    return $AttendancesTable(attachedDatabase, alias);
  }
}

class Attendance extends DataClass implements Insertable<Attendance> {
  final int id;
  final int studentId;
  final int schoolId;
  final String date;
  final bool isAbsent;
  final DateTime createdAt;
  const Attendance({
    required this.id,
    required this.studentId,
    required this.schoolId,
    required this.date,
    required this.isAbsent,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<int>(studentId);
    map['school_id'] = Variable<int>(schoolId);
    map['date'] = Variable<String>(date);
    map['is_absent'] = Variable<bool>(isAbsent);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AttendancesCompanion toCompanion(bool nullToAbsent) {
    return AttendancesCompanion(
      id: Value(id),
      studentId: Value(studentId),
      schoolId: Value(schoolId),
      date: Value(date),
      isAbsent: Value(isAbsent),
      createdAt: Value(createdAt),
    );
  }

  factory Attendance.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attendance(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<int>(json['studentId']),
      schoolId: serializer.fromJson<int>(json['schoolId']),
      date: serializer.fromJson<String>(json['date']),
      isAbsent: serializer.fromJson<bool>(json['isAbsent']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<int>(studentId),
      'schoolId': serializer.toJson<int>(schoolId),
      'date': serializer.toJson<String>(date),
      'isAbsent': serializer.toJson<bool>(isAbsent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Attendance copyWith({
    int? id,
    int? studentId,
    int? schoolId,
    String? date,
    bool? isAbsent,
    DateTime? createdAt,
  }) => Attendance(
    id: id ?? this.id,
    studentId: studentId ?? this.studentId,
    schoolId: schoolId ?? this.schoolId,
    date: date ?? this.date,
    isAbsent: isAbsent ?? this.isAbsent,
    createdAt: createdAt ?? this.createdAt,
  );
  Attendance copyWithCompanion(AttendancesCompanion data) {
    return Attendance(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      date: data.date.present ? data.date.value : this.date,
      isAbsent: data.isAbsent.present ? data.isAbsent.value : this.isAbsent,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Attendance(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('schoolId: $schoolId, ')
          ..write('date: $date, ')
          ..write('isAbsent: $isAbsent, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, studentId, schoolId, date, isAbsent, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attendance &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.schoolId == this.schoolId &&
          other.date == this.date &&
          other.isAbsent == this.isAbsent &&
          other.createdAt == this.createdAt);
}

class AttendancesCompanion extends UpdateCompanion<Attendance> {
  final Value<int> id;
  final Value<int> studentId;
  final Value<int> schoolId;
  final Value<String> date;
  final Value<bool> isAbsent;
  final Value<DateTime> createdAt;
  const AttendancesCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.date = const Value.absent(),
    this.isAbsent = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AttendancesCompanion.insert({
    this.id = const Value.absent(),
    required int studentId,
    required int schoolId,
    required String date,
    required bool isAbsent,
    required DateTime createdAt,
  }) : studentId = Value(studentId),
       schoolId = Value(schoolId),
       date = Value(date),
       isAbsent = Value(isAbsent),
       createdAt = Value(createdAt);
  static Insertable<Attendance> custom({
    Expression<int>? id,
    Expression<int>? studentId,
    Expression<int>? schoolId,
    Expression<String>? date,
    Expression<bool>? isAbsent,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (schoolId != null) 'school_id': schoolId,
      if (date != null) 'date': date,
      if (isAbsent != null) 'is_absent': isAbsent,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AttendancesCompanion copyWith({
    Value<int>? id,
    Value<int>? studentId,
    Value<int>? schoolId,
    Value<String>? date,
    Value<bool>? isAbsent,
    Value<DateTime>? createdAt,
  }) {
    return AttendancesCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      schoolId: schoolId ?? this.schoolId,
      date: date ?? this.date,
      isAbsent: isAbsent ?? this.isAbsent,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<int>(schoolId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (isAbsent.present) {
      map['is_absent'] = Variable<bool>(isAbsent.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendancesCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('schoolId: $schoolId, ')
          ..write('date: $date, ')
          ..write('isAbsent: $isAbsent, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $LessonEntriesTable extends LessonEntries
    with TableInfo<$LessonEntriesTable, LessonEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES students (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<int> schoolId = GeneratedColumn<int>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entryIndexMeta = const VerificationMeta(
    'entryIndex',
  );
  @override
  late final GeneratedColumn<int> entryIndex = GeneratedColumn<int>(
    'entry_index',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pageStudiedMeta = const VerificationMeta(
    'pageStudied',
  );
  @override
  late final GeneratedColumn<String> pageStudied = GeneratedColumn<String>(
    'page_studied',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPassedMeta = const VerificationMeta(
    'isPassed',
  );
  @override
  late final GeneratedColumn<bool> isPassed = GeneratedColumn<bool>(
    'is_passed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_passed" IN (0, 1))',
    ),
  );
  static const VerificationMeta _attitudeMeta = const VerificationMeta(
    'attitude',
  );
  @override
  late final GeneratedColumn<int> attitude = GeneratedColumn<int>(
    'attitude',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pointsDeltaMeta = const VerificationMeta(
    'pointsDelta',
  );
  @override
  late final GeneratedColumn<int> pointsDelta = GeneratedColumn<int>(
    'points_delta',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentId,
    schoolId,
    date,
    entryIndex,
    pageStudied,
    isPassed,
    attitude,
    notes,
    pointsDelta,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lesson_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LessonEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('entry_index')) {
      context.handle(
        _entryIndexMeta,
        entryIndex.isAcceptableOrUnknown(data['entry_index']!, _entryIndexMeta),
      );
    }
    if (data.containsKey('page_studied')) {
      context.handle(
        _pageStudiedMeta,
        pageStudied.isAcceptableOrUnknown(
          data['page_studied']!,
          _pageStudiedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pageStudiedMeta);
    }
    if (data.containsKey('is_passed')) {
      context.handle(
        _isPassedMeta,
        isPassed.isAcceptableOrUnknown(data['is_passed']!, _isPassedMeta),
      );
    } else if (isInserting) {
      context.missing(_isPassedMeta);
    }
    if (data.containsKey('attitude')) {
      context.handle(
        _attitudeMeta,
        attitude.isAcceptableOrUnknown(data['attitude']!, _attitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_attitudeMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('points_delta')) {
      context.handle(
        _pointsDeltaMeta,
        pointsDelta.isAcceptableOrUnknown(
          data['points_delta']!,
          _pointsDeltaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pointsDeltaMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {studentId, date, entryIndex},
  ];
  @override
  LessonEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LessonEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_id'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}school_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      entryIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entry_index'],
      ),
      pageStudied: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}page_studied'],
      )!,
      isPassed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_passed'],
      )!,
      attitude: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attitude'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      pointsDelta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points_delta'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LessonEntriesTable createAlias(String alias) {
    return $LessonEntriesTable(attachedDatabase, alias);
  }
}

class LessonEntry extends DataClass implements Insertable<LessonEntry> {
  final int id;
  final int studentId;
  final int schoolId;
  final String date;
  final int? entryIndex;
  final String pageStudied;
  final bool isPassed;
  final int attitude;
  final String? notes;
  final int pointsDelta;
  final DateTime createdAt;
  const LessonEntry({
    required this.id,
    required this.studentId,
    required this.schoolId,
    required this.date,
    this.entryIndex,
    required this.pageStudied,
    required this.isPassed,
    required this.attitude,
    this.notes,
    required this.pointsDelta,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<int>(studentId);
    map['school_id'] = Variable<int>(schoolId);
    map['date'] = Variable<String>(date);
    if (!nullToAbsent || entryIndex != null) {
      map['entry_index'] = Variable<int>(entryIndex);
    }
    map['page_studied'] = Variable<String>(pageStudied);
    map['is_passed'] = Variable<bool>(isPassed);
    map['attitude'] = Variable<int>(attitude);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['points_delta'] = Variable<int>(pointsDelta);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LessonEntriesCompanion toCompanion(bool nullToAbsent) {
    return LessonEntriesCompanion(
      id: Value(id),
      studentId: Value(studentId),
      schoolId: Value(schoolId),
      date: Value(date),
      entryIndex: entryIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(entryIndex),
      pageStudied: Value(pageStudied),
      isPassed: Value(isPassed),
      attitude: Value(attitude),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      pointsDelta: Value(pointsDelta),
      createdAt: Value(createdAt),
    );
  }

  factory LessonEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LessonEntry(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<int>(json['studentId']),
      schoolId: serializer.fromJson<int>(json['schoolId']),
      date: serializer.fromJson<String>(json['date']),
      entryIndex: serializer.fromJson<int?>(json['entryIndex']),
      pageStudied: serializer.fromJson<String>(json['pageStudied']),
      isPassed: serializer.fromJson<bool>(json['isPassed']),
      attitude: serializer.fromJson<int>(json['attitude']),
      notes: serializer.fromJson<String?>(json['notes']),
      pointsDelta: serializer.fromJson<int>(json['pointsDelta']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<int>(studentId),
      'schoolId': serializer.toJson<int>(schoolId),
      'date': serializer.toJson<String>(date),
      'entryIndex': serializer.toJson<int?>(entryIndex),
      'pageStudied': serializer.toJson<String>(pageStudied),
      'isPassed': serializer.toJson<bool>(isPassed),
      'attitude': serializer.toJson<int>(attitude),
      'notes': serializer.toJson<String?>(notes),
      'pointsDelta': serializer.toJson<int>(pointsDelta),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LessonEntry copyWith({
    int? id,
    int? studentId,
    int? schoolId,
    String? date,
    Value<int?> entryIndex = const Value.absent(),
    String? pageStudied,
    bool? isPassed,
    int? attitude,
    Value<String?> notes = const Value.absent(),
    int? pointsDelta,
    DateTime? createdAt,
  }) => LessonEntry(
    id: id ?? this.id,
    studentId: studentId ?? this.studentId,
    schoolId: schoolId ?? this.schoolId,
    date: date ?? this.date,
    entryIndex: entryIndex.present ? entryIndex.value : this.entryIndex,
    pageStudied: pageStudied ?? this.pageStudied,
    isPassed: isPassed ?? this.isPassed,
    attitude: attitude ?? this.attitude,
    notes: notes.present ? notes.value : this.notes,
    pointsDelta: pointsDelta ?? this.pointsDelta,
    createdAt: createdAt ?? this.createdAt,
  );
  LessonEntry copyWithCompanion(LessonEntriesCompanion data) {
    return LessonEntry(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      date: data.date.present ? data.date.value : this.date,
      entryIndex: data.entryIndex.present
          ? data.entryIndex.value
          : this.entryIndex,
      pageStudied: data.pageStudied.present
          ? data.pageStudied.value
          : this.pageStudied,
      isPassed: data.isPassed.present ? data.isPassed.value : this.isPassed,
      attitude: data.attitude.present ? data.attitude.value : this.attitude,
      notes: data.notes.present ? data.notes.value : this.notes,
      pointsDelta: data.pointsDelta.present
          ? data.pointsDelta.value
          : this.pointsDelta,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LessonEntry(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('schoolId: $schoolId, ')
          ..write('date: $date, ')
          ..write('entryIndex: $entryIndex, ')
          ..write('pageStudied: $pageStudied, ')
          ..write('isPassed: $isPassed, ')
          ..write('attitude: $attitude, ')
          ..write('notes: $notes, ')
          ..write('pointsDelta: $pointsDelta, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    studentId,
    schoolId,
    date,
    entryIndex,
    pageStudied,
    isPassed,
    attitude,
    notes,
    pointsDelta,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LessonEntry &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.schoolId == this.schoolId &&
          other.date == this.date &&
          other.entryIndex == this.entryIndex &&
          other.pageStudied == this.pageStudied &&
          other.isPassed == this.isPassed &&
          other.attitude == this.attitude &&
          other.notes == this.notes &&
          other.pointsDelta == this.pointsDelta &&
          other.createdAt == this.createdAt);
}

class LessonEntriesCompanion extends UpdateCompanion<LessonEntry> {
  final Value<int> id;
  final Value<int> studentId;
  final Value<int> schoolId;
  final Value<String> date;
  final Value<int?> entryIndex;
  final Value<String> pageStudied;
  final Value<bool> isPassed;
  final Value<int> attitude;
  final Value<String?> notes;
  final Value<int> pointsDelta;
  final Value<DateTime> createdAt;
  const LessonEntriesCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.date = const Value.absent(),
    this.entryIndex = const Value.absent(),
    this.pageStudied = const Value.absent(),
    this.isPassed = const Value.absent(),
    this.attitude = const Value.absent(),
    this.notes = const Value.absent(),
    this.pointsDelta = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LessonEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int studentId,
    required int schoolId,
    required String date,
    this.entryIndex = const Value.absent(),
    required String pageStudied,
    required bool isPassed,
    required int attitude,
    this.notes = const Value.absent(),
    required int pointsDelta,
    required DateTime createdAt,
  }) : studentId = Value(studentId),
       schoolId = Value(schoolId),
       date = Value(date),
       pageStudied = Value(pageStudied),
       isPassed = Value(isPassed),
       attitude = Value(attitude),
       pointsDelta = Value(pointsDelta),
       createdAt = Value(createdAt);
  static Insertable<LessonEntry> custom({
    Expression<int>? id,
    Expression<int>? studentId,
    Expression<int>? schoolId,
    Expression<String>? date,
    Expression<int>? entryIndex,
    Expression<String>? pageStudied,
    Expression<bool>? isPassed,
    Expression<int>? attitude,
    Expression<String>? notes,
    Expression<int>? pointsDelta,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (schoolId != null) 'school_id': schoolId,
      if (date != null) 'date': date,
      if (entryIndex != null) 'entry_index': entryIndex,
      if (pageStudied != null) 'page_studied': pageStudied,
      if (isPassed != null) 'is_passed': isPassed,
      if (attitude != null) 'attitude': attitude,
      if (notes != null) 'notes': notes,
      if (pointsDelta != null) 'points_delta': pointsDelta,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LessonEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? studentId,
    Value<int>? schoolId,
    Value<String>? date,
    Value<int?>? entryIndex,
    Value<String>? pageStudied,
    Value<bool>? isPassed,
    Value<int>? attitude,
    Value<String?>? notes,
    Value<int>? pointsDelta,
    Value<DateTime>? createdAt,
  }) {
    return LessonEntriesCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      schoolId: schoolId ?? this.schoolId,
      date: date ?? this.date,
      entryIndex: entryIndex ?? this.entryIndex,
      pageStudied: pageStudied ?? this.pageStudied,
      isPassed: isPassed ?? this.isPassed,
      attitude: attitude ?? this.attitude,
      notes: notes ?? this.notes,
      pointsDelta: pointsDelta ?? this.pointsDelta,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<int>(schoolId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (entryIndex.present) {
      map['entry_index'] = Variable<int>(entryIndex.value);
    }
    if (pageStudied.present) {
      map['page_studied'] = Variable<String>(pageStudied.value);
    }
    if (isPassed.present) {
      map['is_passed'] = Variable<bool>(isPassed.value);
    }
    if (attitude.present) {
      map['attitude'] = Variable<int>(attitude.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (pointsDelta.present) {
      map['points_delta'] = Variable<int>(pointsDelta.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonEntriesCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('schoolId: $schoolId, ')
          ..write('date: $date, ')
          ..write('entryIndex: $entryIndex, ')
          ..write('pageStudied: $pageStudied, ')
          ..write('isPassed: $isPassed, ')
          ..write('attitude: $attitude, ')
          ..write('notes: $notes, ')
          ..write('pointsDelta: $pointsDelta, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DayReportsTable extends DayReports
    with TableInfo<$DayReportsTable, DayReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<int> schoolId = GeneratedColumn<int>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES schools (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lessonIndexMeta = const VerificationMeta(
    'lessonIndex',
  );
  @override
  late final GeneratedColumn<int> lessonIndex = GeneratedColumn<int>(
    'lesson_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    schoolId,
    date,
    lessonIndex,
    content,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayReport> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('lesson_index')) {
      context.handle(
        _lessonIndexMeta,
        lessonIndex.isAcceptableOrUnknown(
          data['lesson_index']!,
          _lessonIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lessonIndexMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {schoolId, date, lessonIndex},
  ];
  @override
  DayReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayReport(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}school_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      lessonIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lesson_index'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DayReportsTable createAlias(String alias) {
    return $DayReportsTable(attachedDatabase, alias);
  }
}

class DayReport extends DataClass implements Insertable<DayReport> {
  final int id;
  final int schoolId;
  final String date;
  final int lessonIndex;
  final String content;
  final DateTime createdAt;
  const DayReport({
    required this.id,
    required this.schoolId,
    required this.date,
    required this.lessonIndex,
    required this.content,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['school_id'] = Variable<int>(schoolId);
    map['date'] = Variable<String>(date);
    map['lesson_index'] = Variable<int>(lessonIndex);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DayReportsCompanion toCompanion(bool nullToAbsent) {
    return DayReportsCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      date: Value(date),
      lessonIndex: Value(lessonIndex),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory DayReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayReport(
      id: serializer.fromJson<int>(json['id']),
      schoolId: serializer.fromJson<int>(json['schoolId']),
      date: serializer.fromJson<String>(json['date']),
      lessonIndex: serializer.fromJson<int>(json['lessonIndex']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'schoolId': serializer.toJson<int>(schoolId),
      'date': serializer.toJson<String>(date),
      'lessonIndex': serializer.toJson<int>(lessonIndex),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DayReport copyWith({
    int? id,
    int? schoolId,
    String? date,
    int? lessonIndex,
    String? content,
    DateTime? createdAt,
  }) => DayReport(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    date: date ?? this.date,
    lessonIndex: lessonIndex ?? this.lessonIndex,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
  );
  DayReport copyWithCompanion(DayReportsCompanion data) {
    return DayReport(
      id: data.id.present ? data.id.value : this.id,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      date: data.date.present ? data.date.value : this.date,
      lessonIndex: data.lessonIndex.present
          ? data.lessonIndex.value
          : this.lessonIndex,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayReport(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('date: $date, ')
          ..write('lessonIndex: $lessonIndex, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, schoolId, date, lessonIndex, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayReport &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.date == this.date &&
          other.lessonIndex == this.lessonIndex &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class DayReportsCompanion extends UpdateCompanion<DayReport> {
  final Value<int> id;
  final Value<int> schoolId;
  final Value<String> date;
  final Value<int> lessonIndex;
  final Value<String> content;
  final Value<DateTime> createdAt;
  const DayReportsCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.date = const Value.absent(),
    this.lessonIndex = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DayReportsCompanion.insert({
    this.id = const Value.absent(),
    required int schoolId,
    required String date,
    required int lessonIndex,
    required String content,
    required DateTime createdAt,
  }) : schoolId = Value(schoolId),
       date = Value(date),
       lessonIndex = Value(lessonIndex),
       content = Value(content),
       createdAt = Value(createdAt);
  static Insertable<DayReport> custom({
    Expression<int>? id,
    Expression<int>? schoolId,
    Expression<String>? date,
    Expression<int>? lessonIndex,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schoolId != null) 'school_id': schoolId,
      if (date != null) 'date': date,
      if (lessonIndex != null) 'lesson_index': lessonIndex,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DayReportsCompanion copyWith({
    Value<int>? id,
    Value<int>? schoolId,
    Value<String>? date,
    Value<int>? lessonIndex,
    Value<String>? content,
    Value<DateTime>? createdAt,
  }) {
    return DayReportsCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      date: date ?? this.date,
      lessonIndex: lessonIndex ?? this.lessonIndex,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<int>(schoolId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (lessonIndex.present) {
      map['lesson_index'] = Variable<int>(lessonIndex.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayReportsCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('date: $date, ')
          ..write('lessonIndex: $lessonIndex, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MeetingsTable extends Meetings with TableInfo<$MeetingsTable, Meeting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeetingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<int> schoolId = GeneratedColumn<int>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES schools (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _top1StudentIdMeta = const VerificationMeta(
    'top1StudentId',
  );
  @override
  late final GeneratedColumn<int> top1StudentId = GeneratedColumn<int>(
    'top1_student_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _top2StudentIdMeta = const VerificationMeta(
    'top2StudentId',
  );
  @override
  late final GeneratedColumn<int> top2StudentId = GeneratedColumn<int>(
    'top2_student_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _top3StudentIdMeta = const VerificationMeta(
    'top3StudentId',
  );
  @override
  late final GeneratedColumn<int> top3StudentId = GeneratedColumn<int>(
    'top3_student_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    schoolId,
    date,
    content,
    top1StudentId,
    top2StudentId,
    top3StudentId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meetings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Meeting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('top1_student_id')) {
      context.handle(
        _top1StudentIdMeta,
        top1StudentId.isAcceptableOrUnknown(
          data['top1_student_id']!,
          _top1StudentIdMeta,
        ),
      );
    }
    if (data.containsKey('top2_student_id')) {
      context.handle(
        _top2StudentIdMeta,
        top2StudentId.isAcceptableOrUnknown(
          data['top2_student_id']!,
          _top2StudentIdMeta,
        ),
      );
    }
    if (data.containsKey('top3_student_id')) {
      context.handle(
        _top3StudentIdMeta,
        top3StudentId.isAcceptableOrUnknown(
          data['top3_student_id']!,
          _top3StudentIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {schoolId, date},
  ];
  @override
  Meeting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meeting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}school_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      top1StudentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}top1_student_id'],
      ),
      top2StudentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}top2_student_id'],
      ),
      top3StudentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}top3_student_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $MeetingsTable createAlias(String alias) {
    return $MeetingsTable(attachedDatabase, alias);
  }
}

class Meeting extends DataClass implements Insertable<Meeting> {
  final int id;
  final int schoolId;
  final String date;
  final String content;
  final int? top1StudentId;
  final int? top2StudentId;
  final int? top3StudentId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const Meeting({
    required this.id,
    required this.schoolId,
    required this.date,
    required this.content,
    this.top1StudentId,
    this.top2StudentId,
    this.top3StudentId,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['school_id'] = Variable<int>(schoolId);
    map['date'] = Variable<String>(date);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || top1StudentId != null) {
      map['top1_student_id'] = Variable<int>(top1StudentId);
    }
    if (!nullToAbsent || top2StudentId != null) {
      map['top2_student_id'] = Variable<int>(top2StudentId);
    }
    if (!nullToAbsent || top3StudentId != null) {
      map['top3_student_id'] = Variable<int>(top3StudentId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  MeetingsCompanion toCompanion(bool nullToAbsent) {
    return MeetingsCompanion(
      id: Value(id),
      schoolId: Value(schoolId),
      date: Value(date),
      content: Value(content),
      top1StudentId: top1StudentId == null && nullToAbsent
          ? const Value.absent()
          : Value(top1StudentId),
      top2StudentId: top2StudentId == null && nullToAbsent
          ? const Value.absent()
          : Value(top2StudentId),
      top3StudentId: top3StudentId == null && nullToAbsent
          ? const Value.absent()
          : Value(top3StudentId),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Meeting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meeting(
      id: serializer.fromJson<int>(json['id']),
      schoolId: serializer.fromJson<int>(json['schoolId']),
      date: serializer.fromJson<String>(json['date']),
      content: serializer.fromJson<String>(json['content']),
      top1StudentId: serializer.fromJson<int?>(json['top1StudentId']),
      top2StudentId: serializer.fromJson<int?>(json['top2StudentId']),
      top3StudentId: serializer.fromJson<int?>(json['top3StudentId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'schoolId': serializer.toJson<int>(schoolId),
      'date': serializer.toJson<String>(date),
      'content': serializer.toJson<String>(content),
      'top1StudentId': serializer.toJson<int?>(top1StudentId),
      'top2StudentId': serializer.toJson<int?>(top2StudentId),
      'top3StudentId': serializer.toJson<int?>(top3StudentId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Meeting copyWith({
    int? id,
    int? schoolId,
    String? date,
    String? content,
    Value<int?> top1StudentId = const Value.absent(),
    Value<int?> top2StudentId = const Value.absent(),
    Value<int?> top3StudentId = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Meeting(
    id: id ?? this.id,
    schoolId: schoolId ?? this.schoolId,
    date: date ?? this.date,
    content: content ?? this.content,
    top1StudentId: top1StudentId.present
        ? top1StudentId.value
        : this.top1StudentId,
    top2StudentId: top2StudentId.present
        ? top2StudentId.value
        : this.top2StudentId,
    top3StudentId: top3StudentId.present
        ? top3StudentId.value
        : this.top3StudentId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Meeting copyWithCompanion(MeetingsCompanion data) {
    return Meeting(
      id: data.id.present ? data.id.value : this.id,
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      date: data.date.present ? data.date.value : this.date,
      content: data.content.present ? data.content.value : this.content,
      top1StudentId: data.top1StudentId.present
          ? data.top1StudentId.value
          : this.top1StudentId,
      top2StudentId: data.top2StudentId.present
          ? data.top2StudentId.value
          : this.top2StudentId,
      top3StudentId: data.top3StudentId.present
          ? data.top3StudentId.value
          : this.top3StudentId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Meeting(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('date: $date, ')
          ..write('content: $content, ')
          ..write('top1StudentId: $top1StudentId, ')
          ..write('top2StudentId: $top2StudentId, ')
          ..write('top3StudentId: $top3StudentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    schoolId,
    date,
    content,
    top1StudentId,
    top2StudentId,
    top3StudentId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meeting &&
          other.id == this.id &&
          other.schoolId == this.schoolId &&
          other.date == this.date &&
          other.content == this.content &&
          other.top1StudentId == this.top1StudentId &&
          other.top2StudentId == this.top2StudentId &&
          other.top3StudentId == this.top3StudentId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MeetingsCompanion extends UpdateCompanion<Meeting> {
  final Value<int> id;
  final Value<int> schoolId;
  final Value<String> date;
  final Value<String> content;
  final Value<int?> top1StudentId;
  final Value<int?> top2StudentId;
  final Value<int?> top3StudentId;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const MeetingsCompanion({
    this.id = const Value.absent(),
    this.schoolId = const Value.absent(),
    this.date = const Value.absent(),
    this.content = const Value.absent(),
    this.top1StudentId = const Value.absent(),
    this.top2StudentId = const Value.absent(),
    this.top3StudentId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MeetingsCompanion.insert({
    this.id = const Value.absent(),
    required int schoolId,
    required String date,
    this.content = const Value.absent(),
    this.top1StudentId = const Value.absent(),
    this.top2StudentId = const Value.absent(),
    this.top3StudentId = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
  }) : schoolId = Value(schoolId),
       date = Value(date),
       createdAt = Value(createdAt);
  static Insertable<Meeting> custom({
    Expression<int>? id,
    Expression<int>? schoolId,
    Expression<String>? date,
    Expression<String>? content,
    Expression<int>? top1StudentId,
    Expression<int>? top2StudentId,
    Expression<int>? top3StudentId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (schoolId != null) 'school_id': schoolId,
      if (date != null) 'date': date,
      if (content != null) 'content': content,
      if (top1StudentId != null) 'top1_student_id': top1StudentId,
      if (top2StudentId != null) 'top2_student_id': top2StudentId,
      if (top3StudentId != null) 'top3_student_id': top3StudentId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MeetingsCompanion copyWith({
    Value<int>? id,
    Value<int>? schoolId,
    Value<String>? date,
    Value<String>? content,
    Value<int?>? top1StudentId,
    Value<int?>? top2StudentId,
    Value<int?>? top3StudentId,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return MeetingsCompanion(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      date: date ?? this.date,
      content: content ?? this.content,
      top1StudentId: top1StudentId ?? this.top1StudentId,
      top2StudentId: top2StudentId ?? this.top2StudentId,
      top3StudentId: top3StudentId ?? this.top3StudentId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (schoolId.present) {
      map['school_id'] = Variable<int>(schoolId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (top1StudentId.present) {
      map['top1_student_id'] = Variable<int>(top1StudentId.value);
    }
    if (top2StudentId.present) {
      map['top2_student_id'] = Variable<int>(top2StudentId.value);
    }
    if (top3StudentId.present) {
      map['top3_student_id'] = Variable<int>(top3StudentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeetingsCompanion(')
          ..write('id: $id, ')
          ..write('schoolId: $schoolId, ')
          ..write('date: $date, ')
          ..write('content: $content, ')
          ..write('top1StudentId: $top1StudentId, ')
          ..write('top2StudentId: $top2StudentId, ')
          ..write('top3StudentId: $top3StudentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TeacherProfilesTable teacherProfiles = $TeacherProfilesTable(
    this,
  );
  late final $SchoolsTable schools = $SchoolsTable(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $AttendancesTable attendances = $AttendancesTable(this);
  late final $LessonEntriesTable lessonEntries = $LessonEntriesTable(this);
  late final $DayReportsTable dayReports = $DayReportsTable(this);
  late final $MeetingsTable meetings = $MeetingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    teacherProfiles,
    schools,
    students,
    attendances,
    lessonEntries,
    dayReports,
    meetings,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'schools',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('students', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'students',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('attendances', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'students',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('lesson_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'schools',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('day_reports', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'schools',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('meetings', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$TeacherProfilesTableCreateCompanionBuilder =
    TeacherProfilesCompanion Function({
      Value<int> id,
      required String firstName,
      required String lastName,
      required String className,
      required int lessonLoggingMode,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$TeacherProfilesTableUpdateCompanionBuilder =
    TeacherProfilesCompanion Function({
      Value<int> id,
      Value<String> firstName,
      Value<String> lastName,
      Value<String> className,
      Value<int> lessonLoggingMode,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$TeacherProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $TeacherProfilesTable> {
  $$TeacherProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get className => $composableBuilder(
    column: $table.className,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lessonLoggingMode => $composableBuilder(
    column: $table.lessonLoggingMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TeacherProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $TeacherProfilesTable> {
  $$TeacherProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get className => $composableBuilder(
    column: $table.className,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lessonLoggingMode => $composableBuilder(
    column: $table.lessonLoggingMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TeacherProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TeacherProfilesTable> {
  $$TeacherProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get className =>
      $composableBuilder(column: $table.className, builder: (column) => column);

  GeneratedColumn<int> get lessonLoggingMode => $composableBuilder(
    column: $table.lessonLoggingMode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TeacherProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TeacherProfilesTable,
          TeacherProfile,
          $$TeacherProfilesTableFilterComposer,
          $$TeacherProfilesTableOrderingComposer,
          $$TeacherProfilesTableAnnotationComposer,
          $$TeacherProfilesTableCreateCompanionBuilder,
          $$TeacherProfilesTableUpdateCompanionBuilder,
          (
            TeacherProfile,
            BaseReferences<
              _$AppDatabase,
              $TeacherProfilesTable,
              TeacherProfile
            >,
          ),
          TeacherProfile,
          PrefetchHooks Function()
        > {
  $$TeacherProfilesTableTableManager(
    _$AppDatabase db,
    $TeacherProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeacherProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeacherProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeacherProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String> className = const Value.absent(),
                Value<int> lessonLoggingMode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => TeacherProfilesCompanion(
                id: id,
                firstName: firstName,
                lastName: lastName,
                className: className,
                lessonLoggingMode: lessonLoggingMode,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String firstName,
                required String lastName,
                required String className,
                required int lessonLoggingMode,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => TeacherProfilesCompanion.insert(
                id: id,
                firstName: firstName,
                lastName: lastName,
                className: className,
                lessonLoggingMode: lessonLoggingMode,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TeacherProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TeacherProfilesTable,
      TeacherProfile,
      $$TeacherProfilesTableFilterComposer,
      $$TeacherProfilesTableOrderingComposer,
      $$TeacherProfilesTableAnnotationComposer,
      $$TeacherProfilesTableCreateCompanionBuilder,
      $$TeacherProfilesTableUpdateCompanionBuilder,
      (
        TeacherProfile,
        BaseReferences<_$AppDatabase, $TeacherProfilesTable, TeacherProfile>,
      ),
      TeacherProfile,
      PrefetchHooks Function()
    >;
typedef $$SchoolsTableCreateCompanionBuilder =
    SchoolsCompanion Function({
      Value<int> id,
      required String name,
      required int lessonsCount,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$SchoolsTableUpdateCompanionBuilder =
    SchoolsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> lessonsCount,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$SchoolsTableReferences
    extends BaseReferences<_$AppDatabase, $SchoolsTable, School> {
  $$SchoolsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StudentsTable, List<Student>> _studentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.students,
    aliasName: $_aliasNameGenerator(db.schools.id, db.students.schoolId),
  );

  $$StudentsTableProcessedTableManager get studentsRefs {
    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.schoolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DayReportsTable, List<DayReport>>
  _dayReportsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dayReports,
    aliasName: $_aliasNameGenerator(db.schools.id, db.dayReports.schoolId),
  );

  $$DayReportsTableProcessedTableManager get dayReportsRefs {
    final manager = $$DayReportsTableTableManager(
      $_db,
      $_db.dayReports,
    ).filter((f) => f.schoolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dayReportsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MeetingsTable, List<Meeting>> _meetingsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.meetings,
    aliasName: $_aliasNameGenerator(db.schools.id, db.meetings.schoolId),
  );

  $$MeetingsTableProcessedTableManager get meetingsRefs {
    final manager = $$MeetingsTableTableManager(
      $_db,
      $_db.meetings,
    ).filter((f) => f.schoolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_meetingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SchoolsTableFilterComposer
    extends Composer<_$AppDatabase, $SchoolsTable> {
  $$SchoolsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lessonsCount => $composableBuilder(
    column: $table.lessonsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> studentsRefs(
    Expression<bool> Function($$StudentsTableFilterComposer f) f,
  ) {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.schoolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dayReportsRefs(
    Expression<bool> Function($$DayReportsTableFilterComposer f) f,
  ) {
    final $$DayReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayReports,
      getReferencedColumn: (t) => t.schoolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayReportsTableFilterComposer(
            $db: $db,
            $table: $db.dayReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> meetingsRefs(
    Expression<bool> Function($$MeetingsTableFilterComposer f) f,
  ) {
    final $$MeetingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meetings,
      getReferencedColumn: (t) => t.schoolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeetingsTableFilterComposer(
            $db: $db,
            $table: $db.meetings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SchoolsTableOrderingComposer
    extends Composer<_$AppDatabase, $SchoolsTable> {
  $$SchoolsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lessonsCount => $composableBuilder(
    column: $table.lessonsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SchoolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchoolsTable> {
  $$SchoolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get lessonsCount => $composableBuilder(
    column: $table.lessonsCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> studentsRefs<T extends Object>(
    Expression<T> Function($$StudentsTableAnnotationComposer a) f,
  ) {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.schoolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dayReportsRefs<T extends Object>(
    Expression<T> Function($$DayReportsTableAnnotationComposer a) f,
  ) {
    final $$DayReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayReports,
      getReferencedColumn: (t) => t.schoolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.dayReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> meetingsRefs<T extends Object>(
    Expression<T> Function($$MeetingsTableAnnotationComposer a) f,
  ) {
    final $$MeetingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meetings,
      getReferencedColumn: (t) => t.schoolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeetingsTableAnnotationComposer(
            $db: $db,
            $table: $db.meetings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SchoolsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SchoolsTable,
          School,
          $$SchoolsTableFilterComposer,
          $$SchoolsTableOrderingComposer,
          $$SchoolsTableAnnotationComposer,
          $$SchoolsTableCreateCompanionBuilder,
          $$SchoolsTableUpdateCompanionBuilder,
          (School, $$SchoolsTableReferences),
          School,
          PrefetchHooks Function({
            bool studentsRefs,
            bool dayReportsRefs,
            bool meetingsRefs,
          })
        > {
  $$SchoolsTableTableManager(_$AppDatabase db, $SchoolsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchoolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchoolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchoolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> lessonsCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SchoolsCompanion(
                id: id,
                name: name,
                lessonsCount: lessonsCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int lessonsCount,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => SchoolsCompanion.insert(
                id: id,
                name: name,
                lessonsCount: lessonsCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SchoolsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                studentsRefs = false,
                dayReportsRefs = false,
                meetingsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (studentsRefs) db.students,
                    if (dayReportsRefs) db.dayReports,
                    if (meetingsRefs) db.meetings,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (studentsRefs)
                        await $_getPrefetchedData<
                          School,
                          $SchoolsTable,
                          Student
                        >(
                          currentTable: table,
                          referencedTable: $$SchoolsTableReferences
                              ._studentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SchoolsTableReferences(
                                db,
                                table,
                                p0,
                              ).studentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.schoolId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dayReportsRefs)
                        await $_getPrefetchedData<
                          School,
                          $SchoolsTable,
                          DayReport
                        >(
                          currentTable: table,
                          referencedTable: $$SchoolsTableReferences
                              ._dayReportsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SchoolsTableReferences(
                                db,
                                table,
                                p0,
                              ).dayReportsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.schoolId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (meetingsRefs)
                        await $_getPrefetchedData<
                          School,
                          $SchoolsTable,
                          Meeting
                        >(
                          currentTable: table,
                          referencedTable: $$SchoolsTableReferences
                              ._meetingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SchoolsTableReferences(
                                db,
                                table,
                                p0,
                              ).meetingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.schoolId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SchoolsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SchoolsTable,
      School,
      $$SchoolsTableFilterComposer,
      $$SchoolsTableOrderingComposer,
      $$SchoolsTableAnnotationComposer,
      $$SchoolsTableCreateCompanionBuilder,
      $$SchoolsTableUpdateCompanionBuilder,
      (School, $$SchoolsTableReferences),
      School,
      PrefetchHooks Function({
        bool studentsRefs,
        bool dayReportsRefs,
        bool meetingsRefs,
      })
    >;
typedef $$StudentsTableCreateCompanionBuilder =
    StudentsCompanion Function({
      Value<int> id,
      required int schoolId,
      required String firstName,
      required String lastName,
      Value<String?> parentPhone,
      Value<String?> level,
      Value<int> currentPoints,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$StudentsTableUpdateCompanionBuilder =
    StudentsCompanion Function({
      Value<int> id,
      Value<int> schoolId,
      Value<String> firstName,
      Value<String> lastName,
      Value<String?> parentPhone,
      Value<String?> level,
      Value<int> currentPoints,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$StudentsTableReferences
    extends BaseReferences<_$AppDatabase, $StudentsTable, Student> {
  $$StudentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SchoolsTable _schoolIdTable(_$AppDatabase db) => db.schools
      .createAlias($_aliasNameGenerator(db.students.schoolId, db.schools.id));

  $$SchoolsTableProcessedTableManager get schoolId {
    final $_column = $_itemColumn<int>('school_id')!;

    final manager = $$SchoolsTableTableManager(
      $_db,
      $_db.schools,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_schoolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AttendancesTable, List<Attendance>>
  _attendancesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.attendances,
    aliasName: $_aliasNameGenerator(db.students.id, db.attendances.studentId),
  );

  $$AttendancesTableProcessedTableManager get attendancesRefs {
    final manager = $$AttendancesTableTableManager(
      $_db,
      $_db.attendances,
    ).filter((f) => f.studentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_attendancesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LessonEntriesTable, List<LessonEntry>>
  _lessonEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.lessonEntries,
    aliasName: $_aliasNameGenerator(db.students.id, db.lessonEntries.studentId),
  );

  $$LessonEntriesTableProcessedTableManager get lessonEntriesRefs {
    final manager = $$LessonEntriesTableTableManager(
      $_db,
      $_db.lessonEntries,
    ).filter((f) => f.studentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_lessonEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StudentsTableFilterComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentPhone => $composableBuilder(
    column: $table.parentPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentPoints => $composableBuilder(
    column: $table.currentPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SchoolsTableFilterComposer get schoolId {
    final $$SchoolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.schoolId,
      referencedTable: $db.schools,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchoolsTableFilterComposer(
            $db: $db,
            $table: $db.schools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> attendancesRefs(
    Expression<bool> Function($$AttendancesTableFilterComposer f) f,
  ) {
    final $$AttendancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendances,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendancesTableFilterComposer(
            $db: $db,
            $table: $db.attendances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> lessonEntriesRefs(
    Expression<bool> Function($$LessonEntriesTableFilterComposer f) f,
  ) {
    final $$LessonEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessonEntries,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonEntriesTableFilterComposer(
            $db: $db,
            $table: $db.lessonEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentPhone => $composableBuilder(
    column: $table.parentPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentPoints => $composableBuilder(
    column: $table.currentPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SchoolsTableOrderingComposer get schoolId {
    final $$SchoolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.schoolId,
      referencedTable: $db.schools,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchoolsTableOrderingComposer(
            $db: $db,
            $table: $db.schools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get parentPhone => $composableBuilder(
    column: $table.parentPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get currentPoints => $composableBuilder(
    column: $table.currentPoints,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SchoolsTableAnnotationComposer get schoolId {
    final $$SchoolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.schoolId,
      referencedTable: $db.schools,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchoolsTableAnnotationComposer(
            $db: $db,
            $table: $db.schools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> attendancesRefs<T extends Object>(
    Expression<T> Function($$AttendancesTableAnnotationComposer a) f,
  ) {
    final $$AttendancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendances,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendancesTableAnnotationComposer(
            $db: $db,
            $table: $db.attendances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> lessonEntriesRefs<T extends Object>(
    Expression<T> Function($$LessonEntriesTableAnnotationComposer a) f,
  ) {
    final $$LessonEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessonEntries,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.lessonEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentsTable,
          Student,
          $$StudentsTableFilterComposer,
          $$StudentsTableOrderingComposer,
          $$StudentsTableAnnotationComposer,
          $$StudentsTableCreateCompanionBuilder,
          $$StudentsTableUpdateCompanionBuilder,
          (Student, $$StudentsTableReferences),
          Student,
          PrefetchHooks Function({
            bool schoolId,
            bool attendancesRefs,
            bool lessonEntriesRefs,
          })
        > {
  $$StudentsTableTableManager(_$AppDatabase db, $StudentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> schoolId = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String?> parentPhone = const Value.absent(),
                Value<String?> level = const Value.absent(),
                Value<int> currentPoints = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StudentsCompanion(
                id: id,
                schoolId: schoolId,
                firstName: firstName,
                lastName: lastName,
                parentPhone: parentPhone,
                level: level,
                currentPoints: currentPoints,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int schoolId,
                required String firstName,
                required String lastName,
                Value<String?> parentPhone = const Value.absent(),
                Value<String?> level = const Value.absent(),
                Value<int> currentPoints = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => StudentsCompanion.insert(
                id: id,
                schoolId: schoolId,
                firstName: firstName,
                lastName: lastName,
                parentPhone: parentPhone,
                level: level,
                currentPoints: currentPoints,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StudentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                schoolId = false,
                attendancesRefs = false,
                lessonEntriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (attendancesRefs) db.attendances,
                    if (lessonEntriesRefs) db.lessonEntries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (schoolId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.schoolId,
                                    referencedTable: $$StudentsTableReferences
                                        ._schoolIdTable(db),
                                    referencedColumn: $$StudentsTableReferences
                                        ._schoolIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (attendancesRefs)
                        await $_getPrefetchedData<
                          Student,
                          $StudentsTable,
                          Attendance
                        >(
                          currentTable: table,
                          referencedTable: $$StudentsTableReferences
                              ._attendancesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentsTableReferences(
                                db,
                                table,
                                p0,
                              ).attendancesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (lessonEntriesRefs)
                        await $_getPrefetchedData<
                          Student,
                          $StudentsTable,
                          LessonEntry
                        >(
                          currentTable: table,
                          referencedTable: $$StudentsTableReferences
                              ._lessonEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentsTableReferences(
                                db,
                                table,
                                p0,
                              ).lessonEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StudentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentsTable,
      Student,
      $$StudentsTableFilterComposer,
      $$StudentsTableOrderingComposer,
      $$StudentsTableAnnotationComposer,
      $$StudentsTableCreateCompanionBuilder,
      $$StudentsTableUpdateCompanionBuilder,
      (Student, $$StudentsTableReferences),
      Student,
      PrefetchHooks Function({
        bool schoolId,
        bool attendancesRefs,
        bool lessonEntriesRefs,
      })
    >;
typedef $$AttendancesTableCreateCompanionBuilder =
    AttendancesCompanion Function({
      Value<int> id,
      required int studentId,
      required int schoolId,
      required String date,
      required bool isAbsent,
      required DateTime createdAt,
    });
typedef $$AttendancesTableUpdateCompanionBuilder =
    AttendancesCompanion Function({
      Value<int> id,
      Value<int> studentId,
      Value<int> schoolId,
      Value<String> date,
      Value<bool> isAbsent,
      Value<DateTime> createdAt,
    });

final class $$AttendancesTableReferences
    extends BaseReferences<_$AppDatabase, $AttendancesTable, Attendance> {
  $$AttendancesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StudentsTable _studentIdTable(_$AppDatabase db) =>
      db.students.createAlias(
        $_aliasNameGenerator(db.attendances.studentId, db.students.id),
      );

  $$StudentsTableProcessedTableManager get studentId {
    final $_column = $_itemColumn<int>('student_id')!;

    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AttendancesTableFilterComposer
    extends Composer<_$AppDatabase, $AttendancesTable> {
  $$AttendancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAbsent => $composableBuilder(
    column: $table.isAbsent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentsTableFilterComposer get studentId {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendancesTableOrderingComposer
    extends Composer<_$AppDatabase, $AttendancesTable> {
  $$AttendancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAbsent => $composableBuilder(
    column: $table.isAbsent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentsTableOrderingComposer get studentId {
    final $$StudentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableOrderingComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttendancesTable> {
  $$AttendancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get schoolId =>
      $composableBuilder(column: $table.schoolId, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get isAbsent =>
      $composableBuilder(column: $table.isAbsent, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$StudentsTableAnnotationComposer get studentId {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendancesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttendancesTable,
          Attendance,
          $$AttendancesTableFilterComposer,
          $$AttendancesTableOrderingComposer,
          $$AttendancesTableAnnotationComposer,
          $$AttendancesTableCreateCompanionBuilder,
          $$AttendancesTableUpdateCompanionBuilder,
          (Attendance, $$AttendancesTableReferences),
          Attendance,
          PrefetchHooks Function({bool studentId})
        > {
  $$AttendancesTableTableManager(_$AppDatabase db, $AttendancesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> studentId = const Value.absent(),
                Value<int> schoolId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<bool> isAbsent = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AttendancesCompanion(
                id: id,
                studentId: studentId,
                schoolId: schoolId,
                date: date,
                isAbsent: isAbsent,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int studentId,
                required int schoolId,
                required String date,
                required bool isAbsent,
                required DateTime createdAt,
              }) => AttendancesCompanion.insert(
                id: id,
                studentId: studentId,
                schoolId: schoolId,
                date: date,
                isAbsent: isAbsent,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AttendancesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({studentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (studentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.studentId,
                                referencedTable: $$AttendancesTableReferences
                                    ._studentIdTable(db),
                                referencedColumn: $$AttendancesTableReferences
                                    ._studentIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AttendancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttendancesTable,
      Attendance,
      $$AttendancesTableFilterComposer,
      $$AttendancesTableOrderingComposer,
      $$AttendancesTableAnnotationComposer,
      $$AttendancesTableCreateCompanionBuilder,
      $$AttendancesTableUpdateCompanionBuilder,
      (Attendance, $$AttendancesTableReferences),
      Attendance,
      PrefetchHooks Function({bool studentId})
    >;
typedef $$LessonEntriesTableCreateCompanionBuilder =
    LessonEntriesCompanion Function({
      Value<int> id,
      required int studentId,
      required int schoolId,
      required String date,
      Value<int?> entryIndex,
      required String pageStudied,
      required bool isPassed,
      required int attitude,
      Value<String?> notes,
      required int pointsDelta,
      required DateTime createdAt,
    });
typedef $$LessonEntriesTableUpdateCompanionBuilder =
    LessonEntriesCompanion Function({
      Value<int> id,
      Value<int> studentId,
      Value<int> schoolId,
      Value<String> date,
      Value<int?> entryIndex,
      Value<String> pageStudied,
      Value<bool> isPassed,
      Value<int> attitude,
      Value<String?> notes,
      Value<int> pointsDelta,
      Value<DateTime> createdAt,
    });

final class $$LessonEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $LessonEntriesTable, LessonEntry> {
  $$LessonEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StudentsTable _studentIdTable(_$AppDatabase db) =>
      db.students.createAlias(
        $_aliasNameGenerator(db.lessonEntries.studentId, db.students.id),
      );

  $$StudentsTableProcessedTableManager get studentId {
    final $_column = $_itemColumn<int>('student_id')!;

    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LessonEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LessonEntriesTable> {
  $$LessonEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entryIndex => $composableBuilder(
    column: $table.entryIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pageStudied => $composableBuilder(
    column: $table.pageStudied,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPassed => $composableBuilder(
    column: $table.isPassed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attitude => $composableBuilder(
    column: $table.attitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pointsDelta => $composableBuilder(
    column: $table.pointsDelta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentsTableFilterComposer get studentId {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LessonEntriesTable> {
  $$LessonEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entryIndex => $composableBuilder(
    column: $table.entryIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pageStudied => $composableBuilder(
    column: $table.pageStudied,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPassed => $composableBuilder(
    column: $table.isPassed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attitude => $composableBuilder(
    column: $table.attitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pointsDelta => $composableBuilder(
    column: $table.pointsDelta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentsTableOrderingComposer get studentId {
    final $$StudentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableOrderingComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LessonEntriesTable> {
  $$LessonEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get schoolId =>
      $composableBuilder(column: $table.schoolId, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get entryIndex => $composableBuilder(
    column: $table.entryIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pageStudied => $composableBuilder(
    column: $table.pageStudied,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPassed =>
      $composableBuilder(column: $table.isPassed, builder: (column) => column);

  GeneratedColumn<int> get attitude =>
      $composableBuilder(column: $table.attitude, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get pointsDelta => $composableBuilder(
    column: $table.pointsDelta,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$StudentsTableAnnotationComposer get studentId {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LessonEntriesTable,
          LessonEntry,
          $$LessonEntriesTableFilterComposer,
          $$LessonEntriesTableOrderingComposer,
          $$LessonEntriesTableAnnotationComposer,
          $$LessonEntriesTableCreateCompanionBuilder,
          $$LessonEntriesTableUpdateCompanionBuilder,
          (LessonEntry, $$LessonEntriesTableReferences),
          LessonEntry,
          PrefetchHooks Function({bool studentId})
        > {
  $$LessonEntriesTableTableManager(_$AppDatabase db, $LessonEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> studentId = const Value.absent(),
                Value<int> schoolId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<int?> entryIndex = const Value.absent(),
                Value<String> pageStudied = const Value.absent(),
                Value<bool> isPassed = const Value.absent(),
                Value<int> attitude = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> pointsDelta = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LessonEntriesCompanion(
                id: id,
                studentId: studentId,
                schoolId: schoolId,
                date: date,
                entryIndex: entryIndex,
                pageStudied: pageStudied,
                isPassed: isPassed,
                attitude: attitude,
                notes: notes,
                pointsDelta: pointsDelta,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int studentId,
                required int schoolId,
                required String date,
                Value<int?> entryIndex = const Value.absent(),
                required String pageStudied,
                required bool isPassed,
                required int attitude,
                Value<String?> notes = const Value.absent(),
                required int pointsDelta,
                required DateTime createdAt,
              }) => LessonEntriesCompanion.insert(
                id: id,
                studentId: studentId,
                schoolId: schoolId,
                date: date,
                entryIndex: entryIndex,
                pageStudied: pageStudied,
                isPassed: isPassed,
                attitude: attitude,
                notes: notes,
                pointsDelta: pointsDelta,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LessonEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({studentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (studentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.studentId,
                                referencedTable: $$LessonEntriesTableReferences
                                    ._studentIdTable(db),
                                referencedColumn: $$LessonEntriesTableReferences
                                    ._studentIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LessonEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LessonEntriesTable,
      LessonEntry,
      $$LessonEntriesTableFilterComposer,
      $$LessonEntriesTableOrderingComposer,
      $$LessonEntriesTableAnnotationComposer,
      $$LessonEntriesTableCreateCompanionBuilder,
      $$LessonEntriesTableUpdateCompanionBuilder,
      (LessonEntry, $$LessonEntriesTableReferences),
      LessonEntry,
      PrefetchHooks Function({bool studentId})
    >;
typedef $$DayReportsTableCreateCompanionBuilder =
    DayReportsCompanion Function({
      Value<int> id,
      required int schoolId,
      required String date,
      required int lessonIndex,
      required String content,
      required DateTime createdAt,
    });
typedef $$DayReportsTableUpdateCompanionBuilder =
    DayReportsCompanion Function({
      Value<int> id,
      Value<int> schoolId,
      Value<String> date,
      Value<int> lessonIndex,
      Value<String> content,
      Value<DateTime> createdAt,
    });

final class $$DayReportsTableReferences
    extends BaseReferences<_$AppDatabase, $DayReportsTable, DayReport> {
  $$DayReportsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SchoolsTable _schoolIdTable(_$AppDatabase db) => db.schools
      .createAlias($_aliasNameGenerator(db.dayReports.schoolId, db.schools.id));

  $$SchoolsTableProcessedTableManager get schoolId {
    final $_column = $_itemColumn<int>('school_id')!;

    final manager = $$SchoolsTableTableManager(
      $_db,
      $_db.schools,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_schoolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DayReportsTableFilterComposer
    extends Composer<_$AppDatabase, $DayReportsTable> {
  $$DayReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lessonIndex => $composableBuilder(
    column: $table.lessonIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SchoolsTableFilterComposer get schoolId {
    final $$SchoolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.schoolId,
      referencedTable: $db.schools,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchoolsTableFilterComposer(
            $db: $db,
            $table: $db.schools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $DayReportsTable> {
  $$DayReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lessonIndex => $composableBuilder(
    column: $table.lessonIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SchoolsTableOrderingComposer get schoolId {
    final $$SchoolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.schoolId,
      referencedTable: $db.schools,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchoolsTableOrderingComposer(
            $db: $db,
            $table: $db.schools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayReportsTable> {
  $$DayReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get lessonIndex => $composableBuilder(
    column: $table.lessonIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SchoolsTableAnnotationComposer get schoolId {
    final $$SchoolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.schoolId,
      referencedTable: $db.schools,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchoolsTableAnnotationComposer(
            $db: $db,
            $table: $db.schools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayReportsTable,
          DayReport,
          $$DayReportsTableFilterComposer,
          $$DayReportsTableOrderingComposer,
          $$DayReportsTableAnnotationComposer,
          $$DayReportsTableCreateCompanionBuilder,
          $$DayReportsTableUpdateCompanionBuilder,
          (DayReport, $$DayReportsTableReferences),
          DayReport,
          PrefetchHooks Function({bool schoolId})
        > {
  $$DayReportsTableTableManager(_$AppDatabase db, $DayReportsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> schoolId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<int> lessonIndex = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DayReportsCompanion(
                id: id,
                schoolId: schoolId,
                date: date,
                lessonIndex: lessonIndex,
                content: content,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int schoolId,
                required String date,
                required int lessonIndex,
                required String content,
                required DateTime createdAt,
              }) => DayReportsCompanion.insert(
                id: id,
                schoolId: schoolId,
                date: date,
                lessonIndex: lessonIndex,
                content: content,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DayReportsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({schoolId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (schoolId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.schoolId,
                                referencedTable: $$DayReportsTableReferences
                                    ._schoolIdTable(db),
                                referencedColumn: $$DayReportsTableReferences
                                    ._schoolIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DayReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayReportsTable,
      DayReport,
      $$DayReportsTableFilterComposer,
      $$DayReportsTableOrderingComposer,
      $$DayReportsTableAnnotationComposer,
      $$DayReportsTableCreateCompanionBuilder,
      $$DayReportsTableUpdateCompanionBuilder,
      (DayReport, $$DayReportsTableReferences),
      DayReport,
      PrefetchHooks Function({bool schoolId})
    >;
typedef $$MeetingsTableCreateCompanionBuilder =
    MeetingsCompanion Function({
      Value<int> id,
      required int schoolId,
      required String date,
      Value<String> content,
      Value<int?> top1StudentId,
      Value<int?> top2StudentId,
      Value<int?> top3StudentId,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$MeetingsTableUpdateCompanionBuilder =
    MeetingsCompanion Function({
      Value<int> id,
      Value<int> schoolId,
      Value<String> date,
      Value<String> content,
      Value<int?> top1StudentId,
      Value<int?> top2StudentId,
      Value<int?> top3StudentId,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$MeetingsTableReferences
    extends BaseReferences<_$AppDatabase, $MeetingsTable, Meeting> {
  $$MeetingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SchoolsTable _schoolIdTable(_$AppDatabase db) => db.schools
      .createAlias($_aliasNameGenerator(db.meetings.schoolId, db.schools.id));

  $$SchoolsTableProcessedTableManager get schoolId {
    final $_column = $_itemColumn<int>('school_id')!;

    final manager = $$SchoolsTableTableManager(
      $_db,
      $_db.schools,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_schoolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MeetingsTableFilterComposer
    extends Composer<_$AppDatabase, $MeetingsTable> {
  $$MeetingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get top1StudentId => $composableBuilder(
    column: $table.top1StudentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get top2StudentId => $composableBuilder(
    column: $table.top2StudentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get top3StudentId => $composableBuilder(
    column: $table.top3StudentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SchoolsTableFilterComposer get schoolId {
    final $$SchoolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.schoolId,
      referencedTable: $db.schools,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchoolsTableFilterComposer(
            $db: $db,
            $table: $db.schools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeetingsTableOrderingComposer
    extends Composer<_$AppDatabase, $MeetingsTable> {
  $$MeetingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get top1StudentId => $composableBuilder(
    column: $table.top1StudentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get top2StudentId => $composableBuilder(
    column: $table.top2StudentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get top3StudentId => $composableBuilder(
    column: $table.top3StudentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SchoolsTableOrderingComposer get schoolId {
    final $$SchoolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.schoolId,
      referencedTable: $db.schools,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchoolsTableOrderingComposer(
            $db: $db,
            $table: $db.schools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeetingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeetingsTable> {
  $$MeetingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get top1StudentId => $composableBuilder(
    column: $table.top1StudentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get top2StudentId => $composableBuilder(
    column: $table.top2StudentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get top3StudentId => $composableBuilder(
    column: $table.top3StudentId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SchoolsTableAnnotationComposer get schoolId {
    final $$SchoolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.schoolId,
      referencedTable: $db.schools,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchoolsTableAnnotationComposer(
            $db: $db,
            $table: $db.schools,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeetingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MeetingsTable,
          Meeting,
          $$MeetingsTableFilterComposer,
          $$MeetingsTableOrderingComposer,
          $$MeetingsTableAnnotationComposer,
          $$MeetingsTableCreateCompanionBuilder,
          $$MeetingsTableUpdateCompanionBuilder,
          (Meeting, $$MeetingsTableReferences),
          Meeting,
          PrefetchHooks Function({bool schoolId})
        > {
  $$MeetingsTableTableManager(_$AppDatabase db, $MeetingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeetingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeetingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeetingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> schoolId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<int?> top1StudentId = const Value.absent(),
                Value<int?> top2StudentId = const Value.absent(),
                Value<int?> top3StudentId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => MeetingsCompanion(
                id: id,
                schoolId: schoolId,
                date: date,
                content: content,
                top1StudentId: top1StudentId,
                top2StudentId: top2StudentId,
                top3StudentId: top3StudentId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int schoolId,
                required String date,
                Value<String> content = const Value.absent(),
                Value<int?> top1StudentId = const Value.absent(),
                Value<int?> top2StudentId = const Value.absent(),
                Value<int?> top3StudentId = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => MeetingsCompanion.insert(
                id: id,
                schoolId: schoolId,
                date: date,
                content: content,
                top1StudentId: top1StudentId,
                top2StudentId: top2StudentId,
                top3StudentId: top3StudentId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MeetingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({schoolId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (schoolId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.schoolId,
                                referencedTable: $$MeetingsTableReferences
                                    ._schoolIdTable(db),
                                referencedColumn: $$MeetingsTableReferences
                                    ._schoolIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MeetingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MeetingsTable,
      Meeting,
      $$MeetingsTableFilterComposer,
      $$MeetingsTableOrderingComposer,
      $$MeetingsTableAnnotationComposer,
      $$MeetingsTableCreateCompanionBuilder,
      $$MeetingsTableUpdateCompanionBuilder,
      (Meeting, $$MeetingsTableReferences),
      Meeting,
      PrefetchHooks Function({bool schoolId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TeacherProfilesTableTableManager get teacherProfiles =>
      $$TeacherProfilesTableTableManager(_db, _db.teacherProfiles);
  $$SchoolsTableTableManager get schools =>
      $$SchoolsTableTableManager(_db, _db.schools);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
  $$AttendancesTableTableManager get attendances =>
      $$AttendancesTableTableManager(_db, _db.attendances);
  $$LessonEntriesTableTableManager get lessonEntries =>
      $$LessonEntriesTableTableManager(_db, _db.lessonEntries);
  $$DayReportsTableTableManager get dayReports =>
      $$DayReportsTableTableManager(_db, _db.dayReports);
  $$MeetingsTableTableManager get meetings =>
      $$MeetingsTableTableManager(_db, _db.meetings);
}
