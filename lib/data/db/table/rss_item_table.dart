import 'package:drift/drift.dart';

/// rss 文章表
class RssItemTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // 文章id
  IntColumn get fid => integer()(); // rss id
  TextColumn get title => text()(); // 文章标题
  TextColumn get desc => text()(); // 文章简介
  TextColumn get link => text()(); // 文章链接
  TextColumn get author => text()(); // 作者
  TextColumn get pubDate => text()(); // 发布日期
  TextColumn get category => text().nullable()(); // 文章分类
  BoolColumn get isRead =>
      boolean().withDefault(const Constant(false))(); // 是否已读
  BoolColumn get isCached =>
      boolean().withDefault(const Constant(false))(); // 是否已缓存
}
