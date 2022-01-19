// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../pages/jokes/jokes_page.dart' as _i2;
import '../pages/main/main_page.dart' as _i1;
import '../pages/rss/model/rss.dart' as _i13;
import '../pages/rss/model/rss_item_model.dart' as _i14;
import '../pages/rss/rss_article_page.dart' as _i10;
import '../pages/rss/rss_articles_page.dart' as _i9;
import '../pages/rss/rss_config_page.dart' as _i8;
import '../pages/rss/rss_find_page.dart' as _i7;
import '../pages/rss/rss_index_page.dart' as _i5;
import '../pages/rss/rss_page.dart' as _i4;
import '../pages/rss/rss_read_page.dart' as _i6;
import '../pages/scroll/scroll_page.dart' as _i3;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    JokeRoutes.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.JokePages());
    },
    ScrollRoute.name: (routeData) {
      final args = routeData.argsAs<ScrollRouteArgs>(
          orElse: () => const ScrollRouteArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ScrollPage(key: args.key));
    },
    RssRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RssPage());
    },
    RssIndexRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RssIndexPage());
    },
    RssReadRoute.name: (routeData) {
      final args = routeData.argsAs<RssReadRouteArgs>(
          orElse: () => const RssReadRouteArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.RssReadPage(key: args.key));
    },
    RssFindRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RssFindPage());
    },
    RssConfigRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.RssConfigPage());
    },
    RssArticlesRoute.name: (routeData) {
      final args = routeData.argsAs<RssArticlesRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.RssArticlesPage(key: args.key, rss: args.rss));
    },
    RssArticleRoute.name: (routeData) {
      final args = routeData.argsAs<RssArticleRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.RssArticlePage(key: args.key, rssItem: args.rssItem));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(MainRoute.name, path: '/'),
        _i11.RouteConfig(JokeRoutes.name, path: 'joke'),
        _i11.RouteConfig(ScrollRoute.name, path: 'demo-scroll'),
        _i11.RouteConfig(RssRoute.name, path: 'demo-rss', children: [
          _i11.RouteConfig(RssIndexRoute.name,
              path: 'index', parent: RssRoute.name),
          _i11.RouteConfig(RssReadRoute.name,
              path: 'read', parent: RssRoute.name),
          _i11.RouteConfig(RssFindRoute.name,
              path: 'find', parent: RssRoute.name),
          _i11.RouteConfig(RssConfigRoute.name,
              path: 'config', parent: RssRoute.name),
          _i11.RouteConfig(RssArticlesRoute.name,
              path: 'articles', parent: RssRoute.name),
          _i11.RouteConfig(RssArticleRoute.name,
              path: 'article', parent: RssRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.JokePages]
class JokeRoutes extends _i11.PageRouteInfo<void> {
  const JokeRoutes() : super(JokeRoutes.name, path: 'joke');

  static const String name = 'JokeRoutes';
}

/// generated route for
/// [_i3.ScrollPage]
class ScrollRoute extends _i11.PageRouteInfo<ScrollRouteArgs> {
  ScrollRoute({_i12.Key? key})
      : super(ScrollRoute.name,
            path: 'demo-scroll', args: ScrollRouteArgs(key: key));

  static const String name = 'ScrollRoute';
}

class ScrollRouteArgs {
  const ScrollRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'ScrollRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.RssPage]
class RssRoute extends _i11.PageRouteInfo<void> {
  const RssRoute({List<_i11.PageRouteInfo>? children})
      : super(RssRoute.name, path: 'demo-rss', initialChildren: children);

  static const String name = 'RssRoute';
}

/// generated route for
/// [_i5.RssIndexPage]
class RssIndexRoute extends _i11.PageRouteInfo<void> {
  const RssIndexRoute() : super(RssIndexRoute.name, path: 'index');

  static const String name = 'RssIndexRoute';
}

/// generated route for
/// [_i6.RssReadPage]
class RssReadRoute extends _i11.PageRouteInfo<RssReadRouteArgs> {
  RssReadRoute({_i12.Key? key})
      : super(RssReadRoute.name,
            path: 'read', args: RssReadRouteArgs(key: key));

  static const String name = 'RssReadRoute';
}

class RssReadRouteArgs {
  const RssReadRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'RssReadRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.RssFindPage]
class RssFindRoute extends _i11.PageRouteInfo<void> {
  const RssFindRoute() : super(RssFindRoute.name, path: 'find');

  static const String name = 'RssFindRoute';
}

/// generated route for
/// [_i8.RssConfigPage]
class RssConfigRoute extends _i11.PageRouteInfo<void> {
  const RssConfigRoute() : super(RssConfigRoute.name, path: 'config');

  static const String name = 'RssConfigRoute';
}

/// generated route for
/// [_i9.RssArticlesPage]
class RssArticlesRoute extends _i11.PageRouteInfo<RssArticlesRouteArgs> {
  RssArticlesRoute({_i12.Key? key, required _i13.Rss rss})
      : super(RssArticlesRoute.name,
            path: 'articles', args: RssArticlesRouteArgs(key: key, rss: rss));

  static const String name = 'RssArticlesRoute';
}

class RssArticlesRouteArgs {
  const RssArticlesRouteArgs({this.key, required this.rss});

  final _i12.Key? key;

  final _i13.Rss rss;

  @override
  String toString() {
    return 'RssArticlesRouteArgs{key: $key, rss: $rss}';
  }
}

/// generated route for
/// [_i10.RssArticlePage]
class RssArticleRoute extends _i11.PageRouteInfo<RssArticleRouteArgs> {
  RssArticleRoute({_i12.Key? key, required _i14.RssItemModel rssItem})
      : super(RssArticleRoute.name,
            path: 'article',
            args: RssArticleRouteArgs(key: key, rssItem: rssItem));

  static const String name = 'RssArticleRoute';
}

class RssArticleRouteArgs {
  const RssArticleRouteArgs({this.key, required this.rssItem});

  final _i12.Key? key;

  final _i14.RssItemModel rssItem;

  @override
  String toString() {
    return 'RssArticleRouteArgs{key: $key, rssItem: $rssItem}';
  }
}
