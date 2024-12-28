// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $PlansTable extends Plans with TableInfo<$PlansTable, Plan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
      'json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [localId, id, json];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plans';
  @override
  VerificationContext validateIntegrity(Insertable<Plan> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('json')) {
      context.handle(
          _jsonMeta, json.isAcceptableOrUnknown(data['json']!, _jsonMeta));
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Plan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plan(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json'])!,
    );
  }

  @override
  $PlansTable createAlias(String alias) {
    return $PlansTable(attachedDatabase, alias);
  }
}

class Plan extends DataClass implements Insertable<Plan> {
  final int localId;
  final int? id;
  final String json;
  const Plan({required this.localId, this.id, required this.json});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['json'] = Variable<String>(json);
    return map;
  }

  PlansCompanion toCompanion(bool nullToAbsent) {
    return PlansCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      json: Value(json),
    );
  }

  factory Plan.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plan(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      json: serializer.fromJson<String>(json['json']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'json': serializer.toJson<String>(json),
    };
  }

  Plan copyWith(
          {int? localId,
          Value<int?> id = const Value.absent(),
          String? json}) =>
      Plan(
        localId: localId ?? this.localId,
        id: id.present ? id.value : this.id,
        json: json ?? this.json,
      );
  Plan copyWithCompanion(PlansCompanion data) {
    return Plan(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      json: data.json.present ? data.json.value : this.json,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Plan(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, json);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plan &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.json == this.json);
}

class PlansCompanion extends UpdateCompanion<Plan> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> json;
  const PlansCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.json = const Value.absent(),
  });
  PlansCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String json,
  }) : json = Value(json);
  static Insertable<Plan> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? json,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (json != null) 'json': json,
    });
  }

  PlansCompanion copyWith(
      {Value<int>? localId, Value<int?>? id, Value<String>? json}) {
    return PlansCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      json: json ?? this.json,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlansCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }
}

class $SitesTable extends Sites with TableInfo<$SitesTable, Site> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SitesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
      'json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [localId, id, json];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sites';
  @override
  VerificationContext validateIntegrity(Insertable<Site> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('json')) {
      context.handle(
          _jsonMeta, json.isAcceptableOrUnknown(data['json']!, _jsonMeta));
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Site map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Site(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json'])!,
    );
  }

  @override
  $SitesTable createAlias(String alias) {
    return $SitesTable(attachedDatabase, alias);
  }
}

class Site extends DataClass implements Insertable<Site> {
  final int localId;
  final int? id;
  final String json;
  const Site({required this.localId, this.id, required this.json});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['json'] = Variable<String>(json);
    return map;
  }

  SitesCompanion toCompanion(bool nullToAbsent) {
    return SitesCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      json: Value(json),
    );
  }

  factory Site.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Site(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      json: serializer.fromJson<String>(json['json']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'json': serializer.toJson<String>(json),
    };
  }

  Site copyWith(
          {int? localId,
          Value<int?> id = const Value.absent(),
          String? json}) =>
      Site(
        localId: localId ?? this.localId,
        id: id.present ? id.value : this.id,
        json: json ?? this.json,
      );
  Site copyWithCompanion(SitesCompanion data) {
    return Site(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      json: data.json.present ? data.json.value : this.json,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Site(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, json);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Site &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.json == this.json);
}

class SitesCompanion extends UpdateCompanion<Site> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> json;
  const SitesCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.json = const Value.absent(),
  });
  SitesCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String json,
  }) : json = Value(json);
  static Insertable<Site> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? json,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (json != null) 'json': json,
    });
  }

  SitesCompanion copyWith(
      {Value<int>? localId, Value<int?>? id, Value<String>? json}) {
    return SitesCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      json: json ?? this.json,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SitesCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
      'json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [localId, id, json];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('json')) {
      context.handle(
          _jsonMeta, json.isAcceptableOrUnknown(data['json']!, _jsonMeta));
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int localId;
  final int? id;
  final String json;
  const User({required this.localId, this.id, required this.json});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['json'] = Variable<String>(json);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      json: Value(json),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      json: serializer.fromJson<String>(json['json']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'json': serializer.toJson<String>(json),
    };
  }

  User copyWith(
          {int? localId,
          Value<int?> id = const Value.absent(),
          String? json}) =>
      User(
        localId: localId ?? this.localId,
        id: id.present ? id.value : this.id,
        json: json ?? this.json,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      json: data.json.present ? data.json.value : this.json,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, json);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.json == this.json);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> json;
  const UsersCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.json = const Value.absent(),
  });
  UsersCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String json,
  }) : json = Value(json);
  static Insertable<User> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? json,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (json != null) 'json': json,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? localId, Value<int?>? id, Value<String>? json}) {
    return UsersCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      json: json ?? this.json,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }
}

class $MediasTable extends Medias with TableInfo<$MediasTable, Media> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
      'json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [localId, id, json];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medias';
  @override
  VerificationContext validateIntegrity(Insertable<Media> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('json')) {
      context.handle(
          _jsonMeta, json.isAcceptableOrUnknown(data['json']!, _jsonMeta));
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Media map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Media(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json'])!,
    );
  }

  @override
  $MediasTable createAlias(String alias) {
    return $MediasTable(attachedDatabase, alias);
  }
}

class Media extends DataClass implements Insertable<Media> {
  final int localId;
  final int? id;
  final String json;
  const Media({required this.localId, this.id, required this.json});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['json'] = Variable<String>(json);
    return map;
  }

  MediasCompanion toCompanion(bool nullToAbsent) {
    return MediasCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      json: Value(json),
    );
  }

  factory Media.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Media(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      json: serializer.fromJson<String>(json['json']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'json': serializer.toJson<String>(json),
    };
  }

  Media copyWith(
          {int? localId,
          Value<int?> id = const Value.absent(),
          String? json}) =>
      Media(
        localId: localId ?? this.localId,
        id: id.present ? id.value : this.id,
        json: json ?? this.json,
      );
  Media copyWithCompanion(MediasCompanion data) {
    return Media(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      json: data.json.present ? data.json.value : this.json,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Media(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, json);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Media &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.json == this.json);
}

class MediasCompanion extends UpdateCompanion<Media> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> json;
  const MediasCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.json = const Value.absent(),
  });
  MediasCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String json,
  }) : json = Value(json);
  static Insertable<Media> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? json,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (json != null) 'json': json,
    });
  }

  MediasCompanion copyWith(
      {Value<int>? localId, Value<int?>? id, Value<String>? json}) {
    return MediasCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      json: json ?? this.json,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediasCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }
}

class $ReviewsTable extends Reviews with TableInfo<$ReviewsTable, Review> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
      'json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [localId, id, json];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reviews';
  @override
  VerificationContext validateIntegrity(Insertable<Review> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('json')) {
      context.handle(
          _jsonMeta, json.isAcceptableOrUnknown(data['json']!, _jsonMeta));
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  Review map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Review(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json'])!,
    );
  }

  @override
  $ReviewsTable createAlias(String alias) {
    return $ReviewsTable(attachedDatabase, alias);
  }
}

class Review extends DataClass implements Insertable<Review> {
  final int localId;
  final int? id;
  final String json;
  const Review({required this.localId, this.id, required this.json});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['json'] = Variable<String>(json);
    return map;
  }

  ReviewsCompanion toCompanion(bool nullToAbsent) {
    return ReviewsCompanion(
      localId: Value(localId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      json: Value(json),
    );
  }

  factory Review.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Review(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int?>(json['id']),
      json: serializer.fromJson<String>(json['json']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int?>(id),
      'json': serializer.toJson<String>(json),
    };
  }

  Review copyWith(
          {int? localId,
          Value<int?> id = const Value.absent(),
          String? json}) =>
      Review(
        localId: localId ?? this.localId,
        id: id.present ? id.value : this.id,
        json: json ?? this.json,
      );
  Review copyWithCompanion(ReviewsCompanion data) {
    return Review(
      localId: data.localId.present ? data.localId.value : this.localId,
      id: data.id.present ? data.id.value : this.id,
      json: data.json.present ? data.json.value : this.json,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Review(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, json);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Review &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.json == this.json);
}

class ReviewsCompanion extends UpdateCompanion<Review> {
  final Value<int> localId;
  final Value<int?> id;
  final Value<String> json;
  const ReviewsCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.json = const Value.absent(),
  });
  ReviewsCompanion.insert({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    required String json,
  }) : json = Value(json);
  static Insertable<Review> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? json,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (json != null) 'json': json,
    });
  }

  ReviewsCompanion copyWith(
      {Value<int>? localId, Value<int?>? id, Value<String>? json}) {
    return ReviewsCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      json: json ?? this.json,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewsCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('json: $json')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlansTable plans = $PlansTable(this);
  late final $SitesTable sites = $SitesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $MediasTable medias = $MediasTable(this);
  late final $ReviewsTable reviews = $ReviewsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [plans, sites, users, medias, reviews];
}

typedef $$PlansTableCreateCompanionBuilder = PlansCompanion Function({
  Value<int> localId,
  Value<int?> id,
  required String json,
});
typedef $$PlansTableUpdateCompanionBuilder = PlansCompanion Function({
  Value<int> localId,
  Value<int?> id,
  Value<String> json,
});

class $$PlansTableFilterComposer extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnFilters(column));
}

class $$PlansTableOrderingComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnOrderings(column));
}

class $$PlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);
}

class $$PlansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlansTable,
    Plan,
    $$PlansTableFilterComposer,
    $$PlansTableOrderingComposer,
    $$PlansTableAnnotationComposer,
    $$PlansTableCreateCompanionBuilder,
    $$PlansTableUpdateCompanionBuilder,
    (Plan, BaseReferences<_$AppDatabase, $PlansTable, Plan>),
    Plan,
    PrefetchHooks Function()> {
  $$PlansTableTableManager(_$AppDatabase db, $PlansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            Value<String> json = const Value.absent(),
          }) =>
              PlansCompanion(
            localId: localId,
            id: id,
            json: json,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            required String json,
          }) =>
              PlansCompanion.insert(
            localId: localId,
            id: id,
            json: json,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlansTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlansTable,
    Plan,
    $$PlansTableFilterComposer,
    $$PlansTableOrderingComposer,
    $$PlansTableAnnotationComposer,
    $$PlansTableCreateCompanionBuilder,
    $$PlansTableUpdateCompanionBuilder,
    (Plan, BaseReferences<_$AppDatabase, $PlansTable, Plan>),
    Plan,
    PrefetchHooks Function()>;
typedef $$SitesTableCreateCompanionBuilder = SitesCompanion Function({
  Value<int> localId,
  Value<int?> id,
  required String json,
});
typedef $$SitesTableUpdateCompanionBuilder = SitesCompanion Function({
  Value<int> localId,
  Value<int?> id,
  Value<String> json,
});

class $$SitesTableFilterComposer extends Composer<_$AppDatabase, $SitesTable> {
  $$SitesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnFilters(column));
}

class $$SitesTableOrderingComposer
    extends Composer<_$AppDatabase, $SitesTable> {
  $$SitesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnOrderings(column));
}

class $$SitesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SitesTable> {
  $$SitesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);
}

class $$SitesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SitesTable,
    Site,
    $$SitesTableFilterComposer,
    $$SitesTableOrderingComposer,
    $$SitesTableAnnotationComposer,
    $$SitesTableCreateCompanionBuilder,
    $$SitesTableUpdateCompanionBuilder,
    (Site, BaseReferences<_$AppDatabase, $SitesTable, Site>),
    Site,
    PrefetchHooks Function()> {
  $$SitesTableTableManager(_$AppDatabase db, $SitesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SitesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SitesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SitesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            Value<String> json = const Value.absent(),
          }) =>
              SitesCompanion(
            localId: localId,
            id: id,
            json: json,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            required String json,
          }) =>
              SitesCompanion.insert(
            localId: localId,
            id: id,
            json: json,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SitesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SitesTable,
    Site,
    $$SitesTableFilterComposer,
    $$SitesTableOrderingComposer,
    $$SitesTableAnnotationComposer,
    $$SitesTableCreateCompanionBuilder,
    $$SitesTableUpdateCompanionBuilder,
    (Site, BaseReferences<_$AppDatabase, $SitesTable, Site>),
    Site,
    PrefetchHooks Function()>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> localId,
  Value<int?> id,
  required String json,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> localId,
  Value<int?> id,
  Value<String> json,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            Value<String> json = const Value.absent(),
          }) =>
              UsersCompanion(
            localId: localId,
            id: id,
            json: json,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            required String json,
          }) =>
              UsersCompanion.insert(
            localId: localId,
            id: id,
            json: json,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$MediasTableCreateCompanionBuilder = MediasCompanion Function({
  Value<int> localId,
  Value<int?> id,
  required String json,
});
typedef $$MediasTableUpdateCompanionBuilder = MediasCompanion Function({
  Value<int> localId,
  Value<int?> id,
  Value<String> json,
});

class $$MediasTableFilterComposer
    extends Composer<_$AppDatabase, $MediasTable> {
  $$MediasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnFilters(column));
}

class $$MediasTableOrderingComposer
    extends Composer<_$AppDatabase, $MediasTable> {
  $$MediasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnOrderings(column));
}

class $$MediasTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediasTable> {
  $$MediasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);
}

class $$MediasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MediasTable,
    Media,
    $$MediasTableFilterComposer,
    $$MediasTableOrderingComposer,
    $$MediasTableAnnotationComposer,
    $$MediasTableCreateCompanionBuilder,
    $$MediasTableUpdateCompanionBuilder,
    (Media, BaseReferences<_$AppDatabase, $MediasTable, Media>),
    Media,
    PrefetchHooks Function()> {
  $$MediasTableTableManager(_$AppDatabase db, $MediasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            Value<String> json = const Value.absent(),
          }) =>
              MediasCompanion(
            localId: localId,
            id: id,
            json: json,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            required String json,
          }) =>
              MediasCompanion.insert(
            localId: localId,
            id: id,
            json: json,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MediasTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MediasTable,
    Media,
    $$MediasTableFilterComposer,
    $$MediasTableOrderingComposer,
    $$MediasTableAnnotationComposer,
    $$MediasTableCreateCompanionBuilder,
    $$MediasTableUpdateCompanionBuilder,
    (Media, BaseReferences<_$AppDatabase, $MediasTable, Media>),
    Media,
    PrefetchHooks Function()>;
typedef $$ReviewsTableCreateCompanionBuilder = ReviewsCompanion Function({
  Value<int> localId,
  Value<int?> id,
  required String json,
});
typedef $$ReviewsTableUpdateCompanionBuilder = ReviewsCompanion Function({
  Value<int> localId,
  Value<int?> id,
  Value<String> json,
});

class $$ReviewsTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnFilters(column));
}

class $$ReviewsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnOrderings(column));
}

class $$ReviewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);
}

class $$ReviewsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReviewsTable,
    Review,
    $$ReviewsTableFilterComposer,
    $$ReviewsTableOrderingComposer,
    $$ReviewsTableAnnotationComposer,
    $$ReviewsTableCreateCompanionBuilder,
    $$ReviewsTableUpdateCompanionBuilder,
    (Review, BaseReferences<_$AppDatabase, $ReviewsTable, Review>),
    Review,
    PrefetchHooks Function()> {
  $$ReviewsTableTableManager(_$AppDatabase db, $ReviewsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            Value<String> json = const Value.absent(),
          }) =>
              ReviewsCompanion(
            localId: localId,
            id: id,
            json: json,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<int?> id = const Value.absent(),
            required String json,
          }) =>
              ReviewsCompanion.insert(
            localId: localId,
            id: id,
            json: json,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReviewsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReviewsTable,
    Review,
    $$ReviewsTableFilterComposer,
    $$ReviewsTableOrderingComposer,
    $$ReviewsTableAnnotationComposer,
    $$ReviewsTableCreateCompanionBuilder,
    $$ReviewsTableUpdateCompanionBuilder,
    (Review, BaseReferences<_$AppDatabase, $ReviewsTable, Review>),
    Review,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlansTableTableManager get plans =>
      $$PlansTableTableManager(_db, _db.plans);
  $$SitesTableTableManager get sites =>
      $$SitesTableTableManager(_db, _db.sites);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$MediasTableTableManager get medias =>
      $$MediasTableTableManager(_db, _db.medias);
  $$ReviewsTableTableManager get reviews =>
      $$ReviewsTableTableManager(_db, _db.reviews);
}
