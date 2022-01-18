import 'dart:io';
import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_best_practice/data/db/dao/rss_category_dao.dart';
import 'package:flutter_best_practice/data/db/dao/rss_item_dao.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'table/rss_table.dart';
import 'table/rss_category_table.dart';
import 'table/rss_item_table.dart';
import 'dao/rss_dao.dart';

part 'rss_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(tables: [
  RssTable,
  RssItemTable,
  RssCategoryTable,
], daos: [
  RssDao,
  RssCategoryDao,
  RssItemDao,
])
class RssDatabase extends _$RssDatabase {
  RssDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
