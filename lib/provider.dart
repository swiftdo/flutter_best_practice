import 'package:flutter_best_practice/data/db/rss_db.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 全局的provider
final gRouteProvider = Provider((ref) {
  return AppRouter();
});

/// 数据库
final gDb = Provider((ref) {
  return RssDatabase();
});
