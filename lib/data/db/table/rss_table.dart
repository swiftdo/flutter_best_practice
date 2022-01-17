import 'package:drift/drift.dart';

class RssTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get desc => text()();
  TextColumn get logo => text()();
  TextColumn get url => text()();
  IntColumn get categoryId => integer()(); // 分类id
  TextColumn get type => text()(); // rss 类型 , atom | rss
  BoolColumn get readOrigin =>
      boolean().withDefault(const Constant(false))(); // 是否直接阅读原文
  BoolColumn get openPush =>
      boolean().withDefault(const Constant(false))(); // 是否通知提醒
  BoolColumn get grabOrigin => boolean().withDefault(const Constant(false))();
}
