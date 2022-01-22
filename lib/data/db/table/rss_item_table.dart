import 'package:drift/drift.dart';

/// rss 文章表
class RssItemTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // 文章id
  IntColumn get fid => integer()(); // rss id
  IntColumn get cateId => integer()(); // rss 分类id
  TextColumn get title => text()(); // 文章标题
  TextColumn get desc => text()(); // 文章简介
  TextColumn get content => text()(); // 文章内容
  TextColumn get link => text()(); // 文章链接
  TextColumn get author => text()(); // 作者
  IntColumn get pubDate => integer()(); // 发布日期
  TextColumn get category => text().nullable()(); // 文章分类
  TextColumn get cover => text().nullable()(); // 文章封面
  BoolColumn get isRead =>
      boolean().withDefault(const Constant(false))(); // 是否已读
  BoolColumn get isCached =>
      boolean().withDefault(const Constant(false))(); // 是否已缓存
}
