import 'package:flutter_best_practice/data/db/rss_db.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/db/dao/rss_dao.dart';
import 'data/db/dao/rss_item_dao.dart';
import 'data/repository/rss_repository.dart';

/// 全局的provider
final gRouteProvider = Provider((ref) {
  return AppRouter();
});

/// 数据库
final gDb = Provider((ref) {
  return RssDatabase();
});

final rssDaoProvider = Provider((ref) {
  final db = ref.watch(gDb);
  return RssDao(db);
});

final rssItemDaoProvider = Provider((ref) {
  final db = ref.watch(gDb);
  return RssItemDao(db);
});

final repositoryProvider = Provider.autoDispose<IRssRepository>((ref) {
  return RssRepository();
});
