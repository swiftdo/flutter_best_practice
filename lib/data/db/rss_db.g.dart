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
  final String feedUrl;
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
      required this.feedUrl,
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
      feedUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}feed_url'])!,
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
    map['feed_url'] = Variable<String>(feedUrl);
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
      feedUrl: Value(feedUrl),
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
      feedUrl: serializer.fromJson<String>(json['feedUrl']),
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
      'feedUrl': serializer.toJson<String>(feedUrl),
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
          String? feedUrl,
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
        feedUrl: feedUrl ?? this.feedUrl,
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
          ..write('feedUrl: $feedUrl, ')
          ..write('categoryId: $categoryId, ')
          ..write('type: $type, ')
          ..write('readOrigin: $readOrigin, ')
          ..write('openPush: $openPush, ')
          ..write('grabOrigin: $grabOrigin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, desc, logo, url, feedUrl,
      categoryId, type, readOrigin, openPush, grabOrigin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RssTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.desc == this.desc &&
          other.logo == this.logo &&
          other.url == this.url &&
          other.feedUrl == this.feedUrl &&
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
  final Value<String> feedUrl;
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
    this.feedUrl = const Value.absent(),
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
    required String feedUrl,
    required int categoryId,
    required String type,
    this.readOrigin = const Value.absent(),
    this.openPush = const Value.absent(),
    this.grabOrigin = const Value.absent(),
  })  : name = Value(name),
        desc = Value(desc),
        logo = Value(logo),
        url = Value(url),
        feedUrl = Value(feedUrl),
        categoryId = Value(categoryId),
        type = Value(type);
  static Insertable<RssTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? desc,
    Expression<String>? logo,
    Expression<String>? url,
    Expression<String>? feedUrl,
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
      if (feedUrl != null) 'feed_url': feedUrl,
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
      Value<String>? feedUrl,
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
      feedUrl: feedUrl ?? this.feedUrl,
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
    if (feedUrl.present) {
      map['feed_url'] = Variable<String>(feedUrl.value);
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
          ..write('feedUrl: $feedUrl, ')
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
  final VerificationMeta _feedUrlMeta = const VerificationMeta('feedUrl');
  @override
  late final GeneratedColumn<String?> feedUrl = GeneratedColumn<String?>(
      'feed_url', aliasedName, false,
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
        feedUrl,
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
    if (data.containsKey('feed_url')) {
      context.handle(_feedUrlMeta,
          feedUrl.isAcceptableOrUnknown(data['feed_url']!, _feedUrlMeta));
    } else if (isInserting) {
      context.missing(_feedUrlMeta);
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

class RssItemTableData extends DataClass
    implements Insertable<RssItemTableData> {
  final int id;
  final int fid;
  final int cateId;
  final String title;
  final String desc;
  final String content;
  final String link;
  final String author;
  final int pubDate;
  final String? category;
  final String? cover;
  final bool isRead;
  final bool isCached;
  RssItemTableData(
      {required this.id,
      required this.fid,
      required this.cateId,
      required this.title,
      required this.desc,
      required this.content,
      required this.link,
      required this.author,
      required this.pubDate,
      this.category,
      this.cover,
      required this.isRead,
      required this.isCached});
  factory RssItemTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RssItemTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      fid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fid'])!,
      cateId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cate_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      link: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      pubDate: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pub_date'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      cover: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cover']),
      isRead: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_read'])!,
      isCached: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_cached'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['fid'] = Variable<int>(fid);
    map['cate_id'] = Variable<int>(cateId);
    map['title'] = Variable<String>(title);
    map['desc'] = Variable<String>(desc);
    map['content'] = Variable<String>(content);
    map['link'] = Variable<String>(link);
    map['author'] = Variable<String>(author);
    map['pub_date'] = Variable<int>(pubDate);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String?>(category);
    }
    if (!nullToAbsent || cover != null) {
      map['cover'] = Variable<String?>(cover);
    }
    map['is_read'] = Variable<bool>(isRead);
    map['is_cached'] = Variable<bool>(isCached);
    return map;
  }

  RssItemTableCompanion toCompanion(bool nullToAbsent) {
    return RssItemTableCompanion(
      id: Value(id),
      fid: Value(fid),
      cateId: Value(cateId),
      title: Value(title),
      desc: Value(desc),
      content: Value(content),
      link: Value(link),
      author: Value(author),
      pubDate: Value(pubDate),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      cover:
          cover == null && nullToAbsent ? const Value.absent() : Value(cover),
      isRead: Value(isRead),
      isCached: Value(isCached),
    );
  }

  factory RssItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RssItemTableData(
      id: serializer.fromJson<int>(json['id']),
      fid: serializer.fromJson<int>(json['fid']),
      cateId: serializer.fromJson<int>(json['cateId']),
      title: serializer.fromJson<String>(json['title']),
      desc: serializer.fromJson<String>(json['desc']),
      content: serializer.fromJson<String>(json['content']),
      link: serializer.fromJson<String>(json['link']),
      author: serializer.fromJson<String>(json['author']),
      pubDate: serializer.fromJson<int>(json['pubDate']),
      category: serializer.fromJson<String?>(json['category']),
      cover: serializer.fromJson<String?>(json['cover']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      isCached: serializer.fromJson<bool>(json['isCached']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fid': serializer.toJson<int>(fid),
      'cateId': serializer.toJson<int>(cateId),
      'title': serializer.toJson<String>(title),
      'desc': serializer.toJson<String>(desc),
      'content': serializer.toJson<String>(content),
      'link': serializer.toJson<String>(link),
      'author': serializer.toJson<String>(author),
      'pubDate': serializer.toJson<int>(pubDate),
      'category': serializer.toJson<String?>(category),
      'cover': serializer.toJson<String?>(cover),
      'isRead': serializer.toJson<bool>(isRead),
      'isCached': serializer.toJson<bool>(isCached),
    };
  }

  RssItemTableData copyWith(
          {int? id,
          int? fid,
          int? cateId,
          String? title,
          String? desc,
          String? content,
          String? link,
          String? author,
          int? pubDate,
          String? category,
          String? cover,
          bool? isRead,
          bool? isCached}) =>
      RssItemTableData(
        id: id ?? this.id,
        fid: fid ?? this.fid,
        cateId: cateId ?? this.cateId,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        content: content ?? this.content,
        link: link ?? this.link,
        author: author ?? this.author,
        pubDate: pubDate ?? this.pubDate,
        category: category ?? this.category,
        cover: cover ?? this.cover,
        isRead: isRead ?? this.isRead,
        isCached: isCached ?? this.isCached,
      );
  @override
  String toString() {
    return (StringBuffer('RssItemTableData(')
          ..write('id: $id, ')
          ..write('fid: $fid, ')
          ..write('cateId: $cateId, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('content: $content, ')
          ..write('link: $link, ')
          ..write('author: $author, ')
          ..write('pubDate: $pubDate, ')
          ..write('category: $category, ')
          ..write('cover: $cover, ')
          ..write('isRead: $isRead, ')
          ..write('isCached: $isCached')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fid, cateId, title, desc, content, link,
      author, pubDate, category, cover, isRead, isCached);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RssItemTableData &&
          other.id == this.id &&
          other.fid == this.fid &&
          other.cateId == this.cateId &&
          other.title == this.title &&
          other.desc == this.desc &&
          other.content == this.content &&
          other.link == this.link &&
          other.author == this.author &&
          other.pubDate == this.pubDate &&
          other.category == this.category &&
          other.cover == this.cover &&
          other.isRead == this.isRead &&
          other.isCached == this.isCached);
}

class RssItemTableCompanion extends UpdateCompanion<RssItemTableData> {
  final Value<int> id;
  final Value<int> fid;
  final Value<int> cateId;
  final Value<String> title;
  final Value<String> desc;
  final Value<String> content;
  final Value<String> link;
  final Value<String> author;
  final Value<int> pubDate;
  final Value<String?> category;
  final Value<String?> cover;
  final Value<bool> isRead;
  final Value<bool> isCached;
  const RssItemTableCompanion({
    this.id = const Value.absent(),
    this.fid = const Value.absent(),
    this.cateId = const Value.absent(),
    this.title = const Value.absent(),
    this.desc = const Value.absent(),
    this.content = const Value.absent(),
    this.link = const Value.absent(),
    this.author = const Value.absent(),
    this.pubDate = const Value.absent(),
    this.category = const Value.absent(),
    this.cover = const Value.absent(),
    this.isRead = const Value.absent(),
    this.isCached = const Value.absent(),
  });
  RssItemTableCompanion.insert({
    this.id = const Value.absent(),
    required int fid,
    required int cateId,
    required String title,
    required String desc,
    required String content,
    required String link,
    required String author,
    required int pubDate,
    this.category = const Value.absent(),
    this.cover = const Value.absent(),
    this.isRead = const Value.absent(),
    this.isCached = const Value.absent(),
  })  : fid = Value(fid),
        cateId = Value(cateId),
        title = Value(title),
        desc = Value(desc),
        content = Value(content),
        link = Value(link),
        author = Value(author),
        pubDate = Value(pubDate);
  static Insertable<RssItemTableData> custom({
    Expression<int>? id,
    Expression<int>? fid,
    Expression<int>? cateId,
    Expression<String>? title,
    Expression<String>? desc,
    Expression<String>? content,
    Expression<String>? link,
    Expression<String>? author,
    Expression<int>? pubDate,
    Expression<String?>? category,
    Expression<String?>? cover,
    Expression<bool>? isRead,
    Expression<bool>? isCached,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fid != null) 'fid': fid,
      if (cateId != null) 'cate_id': cateId,
      if (title != null) 'title': title,
      if (desc != null) 'desc': desc,
      if (content != null) 'content': content,
      if (link != null) 'link': link,
      if (author != null) 'author': author,
      if (pubDate != null) 'pub_date': pubDate,
      if (category != null) 'category': category,
      if (cover != null) 'cover': cover,
      if (isRead != null) 'is_read': isRead,
      if (isCached != null) 'is_cached': isCached,
    });
  }

  RssItemTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? fid,
      Value<int>? cateId,
      Value<String>? title,
      Value<String>? desc,
      Value<String>? content,
      Value<String>? link,
      Value<String>? author,
      Value<int>? pubDate,
      Value<String?>? category,
      Value<String?>? cover,
      Value<bool>? isRead,
      Value<bool>? isCached}) {
    return RssItemTableCompanion(
      id: id ?? this.id,
      fid: fid ?? this.fid,
      cateId: cateId ?? this.cateId,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      content: content ?? this.content,
      link: link ?? this.link,
      author: author ?? this.author,
      pubDate: pubDate ?? this.pubDate,
      category: category ?? this.category,
      cover: cover ?? this.cover,
      isRead: isRead ?? this.isRead,
      isCached: isCached ?? this.isCached,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fid.present) {
      map['fid'] = Variable<int>(fid.value);
    }
    if (cateId.present) {
      map['cate_id'] = Variable<int>(cateId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (pubDate.present) {
      map['pub_date'] = Variable<int>(pubDate.value);
    }
    if (category.present) {
      map['category'] = Variable<String?>(category.value);
    }
    if (cover.present) {
      map['cover'] = Variable<String?>(cover.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (isCached.present) {
      map['is_cached'] = Variable<bool>(isCached.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RssItemTableCompanion(')
          ..write('id: $id, ')
          ..write('fid: $fid, ')
          ..write('cateId: $cateId, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('content: $content, ')
          ..write('link: $link, ')
          ..write('author: $author, ')
          ..write('pubDate: $pubDate, ')
          ..write('category: $category, ')
          ..write('cover: $cover, ')
          ..write('isRead: $isRead, ')
          ..write('isCached: $isCached')
          ..write(')'))
        .toString();
  }
}

class $RssItemTableTable extends RssItemTable
    with TableInfo<$RssItemTableTable, RssItemTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RssItemTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _fidMeta = const VerificationMeta('fid');
  @override
  late final GeneratedColumn<int?> fid = GeneratedColumn<int?>(
      'fid', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _cateIdMeta = const VerificationMeta('cateId');
  @override
  late final GeneratedColumn<int?> cateId = GeneratedColumn<int?>(
      'cate_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'desc', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String?> link = GeneratedColumn<String?>(
      'link', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _pubDateMeta = const VerificationMeta('pubDate');
  @override
  late final GeneratedColumn<int?> pubDate = GeneratedColumn<int?>(
      'pub_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _coverMeta = const VerificationMeta('cover');
  @override
  late final GeneratedColumn<String?> cover = GeneratedColumn<String?>(
      'cover', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool?> isRead = GeneratedColumn<bool?>(
      'is_read', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_read IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isCachedMeta = const VerificationMeta('isCached');
  @override
  late final GeneratedColumn<bool?> isCached = GeneratedColumn<bool?>(
      'is_cached', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_cached IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        fid,
        cateId,
        title,
        desc,
        content,
        link,
        author,
        pubDate,
        category,
        cover,
        isRead,
        isCached
      ];
  @override
  String get aliasedName => _alias ?? 'rss_item_table';
  @override
  String get actualTableName => 'rss_item_table';
  @override
  VerificationContext validateIntegrity(Insertable<RssItemTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('fid')) {
      context.handle(
          _fidMeta, fid.isAcceptableOrUnknown(data['fid']!, _fidMeta));
    } else if (isInserting) {
      context.missing(_fidMeta);
    }
    if (data.containsKey('cate_id')) {
      context.handle(_cateIdMeta,
          cateId.isAcceptableOrUnknown(data['cate_id']!, _cateIdMeta));
    } else if (isInserting) {
      context.missing(_cateIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('pub_date')) {
      context.handle(_pubDateMeta,
          pubDate.isAcceptableOrUnknown(data['pub_date']!, _pubDateMeta));
    } else if (isInserting) {
      context.missing(_pubDateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover']!, _coverMeta));
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('is_cached')) {
      context.handle(_isCachedMeta,
          isCached.isAcceptableOrUnknown(data['is_cached']!, _isCachedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RssItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RssItemTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RssItemTableTable createAlias(String alias) {
    return $RssItemTableTable(_db, alias);
  }
}

class RssCategoryTableData extends DataClass
    implements Insertable<RssCategoryTableData> {
  final int id;
  final String name;
  RssCategoryTableData({required this.id, required this.name});
  factory RssCategoryTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RssCategoryTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  RssCategoryTableCompanion toCompanion(bool nullToAbsent) {
    return RssCategoryTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory RssCategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RssCategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  RssCategoryTableData copyWith({int? id, String? name}) =>
      RssCategoryTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('RssCategoryTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RssCategoryTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class RssCategoryTableCompanion extends UpdateCompanion<RssCategoryTableData> {
  final Value<int> id;
  final Value<String> name;
  const RssCategoryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  RssCategoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<RssCategoryTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  RssCategoryTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return RssCategoryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RssCategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $RssCategoryTableTable extends RssCategoryTable
    with TableInfo<$RssCategoryTableTable, RssCategoryTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RssCategoryTableTable(this._db, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'rss_category_table';
  @override
  String get actualTableName => 'rss_category_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RssCategoryTableData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RssCategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RssCategoryTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RssCategoryTableTable createAlias(String alias) {
    return $RssCategoryTableTable(_db, alias);
  }
}

abstract class _$RssDatabase extends GeneratedDatabase {
  _$RssDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $RssTableTable rssTable = $RssTableTable(this);
  late final $RssItemTableTable rssItemTable = $RssItemTableTable(this);
  late final $RssCategoryTableTable rssCategoryTable =
      $RssCategoryTableTable(this);
  late final RssDao rssDao = RssDao(this as RssDatabase);
  late final RssCategoryDao rssCategoryDao =
      RssCategoryDao(this as RssDatabase);
  late final RssItemDao rssItemDao = RssItemDao(this as RssDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [rssTable, rssItemTable, rssCategoryTable];
}
