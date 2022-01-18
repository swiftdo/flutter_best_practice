import 'package:drift/drift.dart';

// rss 源表
class RssTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()(); // 名称
  TextColumn get desc => text()(); // 简介
  TextColumn get logo => text()(); // 网站logo
  TextColumn get url => text()(); // 网站地址
  TextColumn get feedUrl => text()(); // 博客feed的链接
  IntColumn get categoryId => integer()(); // 分类id
  TextColumn get type => text()(); // rss 类型 , atom | rss
  BoolColumn get readOrigin =>
      boolean().withDefault(const Constant(false))(); // 是否直接阅读原文
  BoolColumn get openPush =>
      boolean().withDefault(const Constant(false))(); // 是否通知提醒
  BoolColumn get grabOrigin =>
      boolean().withDefault(const Constant(false))(); // 是否抓取
}
