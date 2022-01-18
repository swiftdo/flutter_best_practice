import 'package:drift/drift.dart';

/// rss 分类表
class RssCategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // 分类id
  TextColumn get name => text()(); // 分类名称
}
