// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class RssTableData extends DataClass implements Insertable<RssTableData> {
  final int id;
  final String name;
  final String desc;
  final String logo;
  final String url;
  final int categoryId;
  final String type;
  final bool readOrigin;
  final bool openPush;
  final bool grabOrigin;
  RssTableData(
      {required this.id,
      required this.name,
      required this.desc,
      required this.logo,
      required this.url,
      required this.categoryId,
      required this.type,
      required this.readOrigin,
      required this.openPush,
      required this.grabOrigin});
  factory RssTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RssTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
      logo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}logo'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      categoryId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      readOrigin: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}read_origin'])!,
      openPush: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}open_push'])!,
      grabOrigin: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}grab_origin'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['desc'] = Variable<String>(desc);
    map['logo'] = Variable<String>(logo);
    map['url'] = Variable<String>(url);
    map['category_id'] = Variable<int>(categoryId);
    map['type'] = Variable<String>(type);
    map['read_origin'] = Variable<bool>(readOrigin);
    map['open_push'] = Variable<bool>(openPush);
    map['grab_origin'] = Variable<bool>(grabOrigin);
    return map;
  }

  RssTableCompanion toCompanion(bool nullToAbsent) {
    return RssTableCompanion(
      id: Value(id),
      name: Value(name),
      desc: Value(desc),
      logo: Value(logo),
      url: Value(url),
      categoryId: Value(categoryId),
      type: Value(type),
      readOrigin: Value(readOrigin),
      openPush: Value(openPush),
      grabOrigin: Value(grabOrigin),
    );
  }

  factory RssTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RssTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String>(json['desc']),
      logo: serializer.fromJson<String>(json['logo']),
      url: serializer.fromJson<String>(json['url']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      type: serializer.fromJson<String>(json['type']),
      readOrigin: serializer.fromJson<bool>(json['readOrigin']),
      openPush: serializer.fromJson<bool>(json['openPush']),
      grabOrigin: serializer.fromJson<bool>(json['grabOrigin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String>(desc),
      'logo': serializer.toJson<String>(logo),
      'url': serializer.toJson<String>(url),
      'categoryId': serializer.toJson<int>(categoryId),
      'type': serializer.toJson<String>(type),
      'readOrigin': serializer.toJson<bool>(readOrigin),
      'openPush': serializer.toJson<bool>(openPush),
      'grabOrigin': serializer.toJson<bool>(grabOrigin),
    };
  }

  RssTableData copyWith(
          {int? id,
          String? name,
          String? desc,
          String? logo,
          String? url,
          int? categoryId,
          String? type,
          bool? readOrigin,
          bool? openPush,
          bool? grabOrigin}) =>
      RssTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        logo: logo ?? this.logo,
        url: url ?? this.url,
        categoryId: categoryId ?? this.categoryId,
        type: type ?? this.type,
        readOrigin: readOrigin ?? this.readOrigin,
        openPush: openPush ?? this.openPush,
        grabOrigin: grabOrigin ?? this.grabOrigin,
      );
  @override
  String toString() {
    return (StringBuffer('RssTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('logo: $logo, ')
          ..write('url: $url, ')
          ..write('categoryId: $categoryId, ')
          ..write('type: $type, ')
          ..write('readOrigin: $readOrigin, ')
          ..write('openPush: $openPush, ')
          ..write('grabOrigin: $grabOrigin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, desc, logo, url, categoryId, type,
      readOrigin, openPush, grabOrigin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RssTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.logo == this.logo &&
          other.url == this.url &&
          other.categoryId == this.categoryId &&
          other.type == this.type &&
          other.readOrigin == this.readOrigin &&
          other.openPush == this.openPush &&
          other.grabOrigin == this.grabOrigin);
}

class RssTableCompanion extends UpdateCompanion<RssTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> desc;
  final Value<String> logo;
  final Value<String> url;
  final Value<int> categoryId;
  final Value<String> type;
  final Value<bool> readOrigin;
  final Value<bool> openPush;
  final Value<bool> grabOrigin;
  const RssTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
    this.logo = const Value.absent(),
    this.url = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.type = const Value.absent(),
    this.readOrigin = const Value.absent(),
    this.openPush = const Value.absent(),
    this.grabOrigin = const Value.absent(),
  });
  RssTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String desc,
    required String logo,
    required String url,
    required int categoryId,
    required String type,
    this.readOrigin = const Value.absent(),
    this.openPush = const Value.absent(),
    this.grabOrigin = const Value.absent(),
  })  : name = Value(name),
        desc = Value(desc),
        logo = Value(logo),
        url = Value(url),
        categoryId = Value(categoryId),
        type = Value(type);
  static Insertable<RssTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? logo,
    Expression<String>? url,
    Expression<int>? categoryId,
    Expression<String>? type,
    Expression<bool>? readOrigin,
    Expression<bool>? openPush,
    Expression<bool>? grabOrigin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
      if (logo != null) 'logo': logo,
      if (url != null) 'url': url,
      if (categoryId != null) 'category_id': categoryId,
      if (type != null) 'type': type,
      if (readOrigin != null) 'read_origin': readOrigin,
      if (openPush != null) 'open_push': openPush,
      if (grabOrigin != null) 'grab_origin': grabOrigin,
    });
  }

  RssTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? desc,
      Value<String>? logo,
      Value<String>? url,
      Value<int>? categoryId,
      Value<String>? type,
      Value<bool>? readOrigin,
      Value<bool>? openPush,
      Value<bool>? grabOrigin}) {
    return RssTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      logo: logo ?? this.logo,
      url: url ?? this.url,
      categoryId: categoryId ?? this.categoryId,
      type: type ?? this.type,
      readOrigin: readOrigin ?? this.readOrigin,
      openPush: openPush ?? this.openPush,
      grabOrigin: grabOrigin ?? this.grabOrigin,
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
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (readOrigin.present) {
      map['read_origin'] = Variable<bool>(readOrigin.value);
    }
    if (openPush.present) {
      map['open_push'] = Variable<bool>(openPush.value);
    }
    if (grabOrigin.present) {
      map['grab_origin'] = Variable<bool>(grabOrigin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RssTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc, ')
          ..write('logo: $logo, ')
          ..write('url: $url, ')
          ..write('categoryId: $categoryId, ')
          ..write('type: $type, ')
          ..write('readOrigin: $readOrigin, ')
          ..write('openPush: $openPush, ')
          ..write('grabOrigin: $grabOrigin')
          ..write(')'))
        .toString();
  }
}

class $RssTableTable extends RssTable
    with TableInfo<$RssTableTable, RssTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RssTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'desc', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String?> logo = GeneratedColumn<String?>(
      'logo', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int?> categoryId = GeneratedColumn<int?>(
      'category_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _readOriginMeta = const VerificationMeta('readOrigin');
  @override
  late final GeneratedColumn<bool?> readOrigin = GeneratedColumn<bool?>(
      'read_origin', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (read_origin IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _openPushMeta = const VerificationMeta('openPush');
  @override
  late final GeneratedColumn<bool?> openPush = GeneratedColumn<bool?>(
      'open_push', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (open_push IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _grabOriginMeta = const VerificationMeta('grabOrigin');
  @override
  late final GeneratedColumn<bool?> grabOrigin = GeneratedColumn<bool?>(
      'grab_origin', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (grab_origin IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        desc,
        logo,
        url,
        categoryId,
        type,
        readOrigin,
        openPush,
        grabOrigin
      ];
  @override
  String get aliasedName => _alias ?? 'rss_table';
  @override
  String get actualTableName => 'rss_table';
  @override
  VerificationContext validateIntegrity(Insertable<RssTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    } else if (isInserting) {
      context.missing(_logoMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('read_origin')) {
      context.handle(
          _readOriginMeta,
          readOrigin.isAcceptableOrUnknown(
              data['read_origin']!, _readOriginMeta));
    }
    if (data.containsKey('open_push')) {
      context.handle(_openPushMeta,
          openPush.isAcceptableOrUnknown(data['open_push']!, _openPushMeta));
    }
    if (data.containsKey('grab_origin')) {
      context.handle(
          _grabOriginMeta,
          grabOrigin.isAcceptableOrUnknown(
              data['grab_origin']!, _grabOriginMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RssTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RssTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RssTableTable createAlias(String alias) {
    return $RssTableTable(_db, alias);
  }
}

abstract class _$RssDatabase extends GeneratedDatabase {
  _$RssDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $RssTableTable rssTable = $RssTableTable(this);
  late final RssDao rssDao = RssDao(this as RssDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [rssTable];
}
