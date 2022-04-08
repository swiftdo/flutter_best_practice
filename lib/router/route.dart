import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss_article_page.dart';
import 'package:flutter_best_practice/pages/rss_articles_page.dart';
import 'package:flutter_best_practice/pages/rss_cates_page.dart';
import 'package:flutter_best_practice/pages/rss_config_page.dart';
import 'package:flutter_best_practice/pages/rss_find_page.dart';
import 'package:flutter_best_practice/pages/rss_index_page.dart';
import 'package:flutter_best_practice/pages/rss_page.dart';
import 'package:flutter_best_practice/pages/rss_photo_view_page.dart';
import 'package:flutter_best_practice/pages/rss_read_page.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(initial: true, page: RssPage, children: [
      AutoRoute(path: "index", page: RssIndexPage),
      AutoRoute(path: "read", page: RssReadPage),
      AutoRoute(path: "find", page: RssFindPage),
      AutoRoute(path: "config", page: RssConfigPage),
    ]),
    AutoRoute(path: "cates", page: RssCatesPage),
    AutoRoute(path: "articles", page: RssArticlesPage),
    AutoRoute(path: "article", page: RssArticlePage),
    AutoRoute(path: "photo-view", page: RssPhotoViewPage),
  ],
)
class $AppRouter {}
