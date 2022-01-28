// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../pages/jokes/jokes_page.dart' as _i6;
import '../pages/main/main_page.dart' as _i5;
import '../pages/rss/model/rss.dart' as _i14;
import '../pages/rss/model/rss_item_model.dart' as _i15;
import '../pages/rss/rss_article_page.dart' as _i3;
import '../pages/rss/rss_articles_page.dart' as _i2;
import '../pages/rss/rss_config_page.dart' as _i11;
import '../pages/rss/rss_find_page.dart' as _i10;
import '../pages/rss/rss_index_page.dart' as _i8;
import '../pages/rss/rss_page.dart' as _i1;
import '../pages/rss/rss_photo_view_page.dart' as _i4;
import '../pages/rss/rss_read_page.dart' as _i9;
import '../pages/scroll/scroll_page.dart' as _i7;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    RssRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RssPage());
    },
    RssArticlesRoute.name: (routeData) {
      final args = routeData.argsAs<RssArticlesRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.RssArticlesPage(key: args.key, rss: args.rss));
    },
    RssArticleRoute.name: (routeData) {
      final args = routeData.argsAs<RssArticleRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.RssArticlePage(key: args.key, rssItem: args.rssItem));
    },
    RssPhotoViewRoute.name: (routeData) {
      final args = routeData.argsAs<RssPhotoViewRouteArgs>();
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RssPhotoViewPage(key: args.key, url: args.url));
    },
    MainRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.MainPage());
    },
    JokeRoutes.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.JokePages());
    },
    ScrollRoute.name: (routeData) {
      final args = routeData.argsAs<ScrollRouteArgs>(
          orElse: () => const ScrollRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.ScrollPage(key: args.key));
    },
    RssIndexRoute.name: (routeData) {
      final args = routeData.argsAs<RssIndexRouteArgs>(
          orElse: () => const RssIndexRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.RssIndexPage(key: args.key));
    },
    RssReadRoute.name: (routeData) {
      final args = routeData.argsAs<RssReadRouteArgs>(
          orElse: () => const RssReadRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.RssReadPage(key: args.key));
    },
    RssFindRoute.name: (routeData) {
      final args = routeData.argsAs<RssFindRouteArgs>(
          orElse: () => const RssFindRouteArgs());
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.RssFindPage(key: args.key));
    },
    RssConfigRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.RssConfigPage());
    }
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(RssRoute.name, path: '/', children: [
          _i12.RouteConfig(RssIndexRoute.name,
              path: 'index', parent: RssRoute.name),
          _i12.RouteConfig(RssReadRoute.name,
              path: 'read', parent: RssRoute.name),
          _i12.RouteConfig(RssFindRoute.name,
              path: 'find', parent: RssRoute.name),
          _i12.RouteConfig(RssConfigRoute.name,
              path: 'config', parent: RssRoute.name)
        ]),
        _i12.RouteConfig(RssArticlesRoute.name, path: 'articles'),
        _i12.RouteConfig(RssArticleRoute.name, path: 'article'),
        _i12.RouteConfig(RssPhotoViewRoute.name, path: 'photo-view'),
        _i12.RouteConfig(MainRoute.name, path: 'main'),
        _i12.RouteConfig(JokeRoutes.name, path: 'joke'),
        _i12.RouteConfig(ScrollRoute.name, path: 'demo-scroll')
      ];
}

/// generated route for
/// [_i1.RssPage]
class RssRoute extends _i12.PageRouteInfo<void> {
  const RssRoute({List<_i12.PageRouteInfo>? children})
      : super(RssRoute.name, path: '/', initialChildren: children);

  static const String name = 'RssRoute';
}

/// generated route for
/// [_i2.RssArticlesPage]
class RssArticlesRoute extends _i12.PageRouteInfo<RssArticlesRouteArgs> {
  RssArticlesRoute({_i13.Key? key, required _i14.Rss rss})
      : super(RssArticlesRoute.name,
            path: 'articles', args: RssArticlesRouteArgs(key: key, rss: rss));

  static const String name = 'RssArticlesRoute';
}

class RssArticlesRouteArgs {
  const RssArticlesRouteArgs({this.key, required this.rss});

  final _i13.Key? key;

  final _i14.Rss rss;

  @override
  String toString() {
    return 'RssArticlesRouteArgs{key: $key, rss: $rss}';
  }
}

/// generated route for
/// [_i3.RssArticlePage]
class RssArticleRoute extends _i12.PageRouteInfo<RssArticleRouteArgs> {
  RssArticleRoute({_i13.Key? key, required _i15.RssItemModel rssItem})
      : super(RssArticleRoute.name,
            path: 'article',
            args: RssArticleRouteArgs(key: key, rssItem: rssItem));

  static const String name = 'RssArticleRoute';
}

class RssArticleRouteArgs {
  const RssArticleRouteArgs({this.key, required this.rssItem});

  final _i13.Key? key;

  final _i15.RssItemModel rssItem;

  @override
  String toString() {
    return 'RssArticleRouteArgs{key: $key, rssItem: $rssItem}';
  }
}

/// generated route for
/// [_i4.RssPhotoViewPage]
class RssPhotoViewRoute extends _i12.PageRouteInfo<RssPhotoViewRouteArgs> {
  RssPhotoViewRoute({_i13.Key? key, required String url})
      : super(RssPhotoViewRoute.name,
            path: 'photo-view',
            args: RssPhotoViewRouteArgs(key: key, url: url));

  static const String name = 'RssPhotoViewRoute';
}

class RssPhotoViewRouteArgs {
  const RssPhotoViewRouteArgs({this.key, required this.url});

  final _i13.Key? key;

  final String url;

  @override
  String toString() {
    return 'RssPhotoViewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i12.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: 'main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i6.JokePages]
class JokeRoutes extends _i12.PageRouteInfo<void> {
  const JokeRoutes() : super(JokeRoutes.name, path: 'joke');

  static const String name = 'JokeRoutes';
}

/// generated route for
/// [_i7.ScrollPage]
class ScrollRoute extends _i12.PageRouteInfo<ScrollRouteArgs> {
  ScrollRoute({_i13.Key? key})
      : super(ScrollRoute.name,
            path: 'demo-scroll', args: ScrollRouteArgs(key: key));

  static const String name = 'ScrollRoute';
}

class ScrollRouteArgs {
  const ScrollRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ScrollRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.RssIndexPage]
class RssIndexRoute extends _i12.PageRouteInfo<RssIndexRouteArgs> {
  RssIndexRoute({_i13.Key? key})
      : super(RssIndexRoute.name,
            path: 'index', args: RssIndexRouteArgs(key: key));

  static const String name = 'RssIndexRoute';
}

class RssIndexRouteArgs {
  const RssIndexRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RssIndexRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.RssReadPage]
class RssReadRoute extends _i12.PageRouteInfo<RssReadRouteArgs> {
  RssReadRoute({_i13.Key? key})
      : super(RssReadRoute.name,
            path: 'read', args: RssReadRouteArgs(key: key));

  static const String name = 'RssReadRoute';
}

class RssReadRouteArgs {
  const RssReadRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RssReadRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.RssFindPage]
class RssFindRoute extends _i12.PageRouteInfo<RssFindRouteArgs> {
  RssFindRoute({_i13.Key? key})
      : super(RssFindRoute.name,
            path: 'find', args: RssFindRouteArgs(key: key));

  static const String name = 'RssFindRoute';
}

class RssFindRouteArgs {
  const RssFindRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RssFindRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.RssConfigPage]
class RssConfigRoute extends _i12.PageRouteInfo<void> {
  const RssConfigRoute() : super(RssConfigRoute.name, path: 'config');

  static const String name = 'RssConfigRoute';
}
