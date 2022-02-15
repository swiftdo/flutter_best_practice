// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../pages/jokes/jokes_page.dart' as _i7;
import '../pages/main/main_page.dart' as _i6;
import '../pages/rss/model/rss.dart' as _i15;
import '../pages/rss/model/rss_item_model.dart' as _i16;
import '../pages/rss/rss_article_page.dart' as _i4;
import '../pages/rss/rss_articles_page.dart' as _i3;
import '../pages/rss/rss_cates_page.dart' as _i2;
import '../pages/rss/rss_config_page.dart' as _i12;
import '../pages/rss/rss_find_page.dart' as _i11;
import '../pages/rss/rss_index_page.dart' as _i9;
import '../pages/rss/rss_page.dart' as _i1;
import '../pages/rss/rss_photo_view_page.dart' as _i5;
import '../pages/rss/rss_read_page.dart' as _i10;
import '../pages/scroll/scroll_page.dart' as _i8;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    RssRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RssPage());
    },
    RssCatesRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RssCatesPage());
    },
    RssArticlesRoute.name: (routeData) {
      final args = routeData.argsAs<RssArticlesRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.RssArticlesPage(key: args.key, rss: args.rss));
    },
    RssArticleRoute.name: (routeData) {
      final args = routeData.argsAs<RssArticleRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RssArticlePage(key: args.key, rssItem: args.rssItem));
    },
    RssPhotoViewRoute.name: (routeData) {
      final args = routeData.argsAs<RssPhotoViewRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.RssPhotoViewPage(key: args.key, url: args.url));
    },
    MainRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.MainPage());
    },
    JokeRoutes.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.JokePages());
    },
    ScrollRoute.name: (routeData) {
      final args = routeData.argsAs<ScrollRouteArgs>(
          orElse: () => const ScrollRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.ScrollPage(key: args.key));
    },
    RssIndexRoute.name: (routeData) {
      final args = routeData.argsAs<RssIndexRouteArgs>(
          orElse: () => const RssIndexRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.RssIndexPage(key: args.key));
    },
    RssReadRoute.name: (routeData) {
      final args = routeData.argsAs<RssReadRouteArgs>(
          orElse: () => const RssReadRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.RssReadPage(key: args.key));
    },
    RssFindRoute.name: (routeData) {
      final args = routeData.argsAs<RssFindRouteArgs>(
          orElse: () => const RssFindRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.RssFindPage(key: args.key));
    },
    RssConfigRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.RssConfigPage());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(RssRoute.name, path: '/', children: [
          _i13.RouteConfig(RssIndexRoute.name,
              path: 'index', parent: RssRoute.name),
          _i13.RouteConfig(RssReadRoute.name,
              path: 'read', parent: RssRoute.name),
          _i13.RouteConfig(RssFindRoute.name,
              path: 'find', parent: RssRoute.name),
          _i13.RouteConfig(RssConfigRoute.name,
              path: 'config', parent: RssRoute.name)
        ]),
        _i13.RouteConfig(RssCatesRoute.name, path: 'cates'),
        _i13.RouteConfig(RssArticlesRoute.name, path: 'articles'),
        _i13.RouteConfig(RssArticleRoute.name, path: 'article'),
        _i13.RouteConfig(RssPhotoViewRoute.name, path: 'photo-view'),
        _i13.RouteConfig(MainRoute.name, path: 'main'),
        _i13.RouteConfig(JokeRoutes.name, path: 'joke'),
        _i13.RouteConfig(ScrollRoute.name, path: 'demo-scroll')
      ];
}

/// generated route for
/// [_i1.RssPage]
class RssRoute extends _i13.PageRouteInfo<void> {
  const RssRoute({List<_i13.PageRouteInfo>? children})
      : super(RssRoute.name, path: '/', initialChildren: children);

  static const String name = 'RssRoute';
}

/// generated route for
/// [_i2.RssCatesPage]
class RssCatesRoute extends _i13.PageRouteInfo<void> {
  const RssCatesRoute() : super(RssCatesRoute.name, path: 'cates');

  static const String name = 'RssCatesRoute';
}

/// generated route for
/// [_i3.RssArticlesPage]
class RssArticlesRoute extends _i13.PageRouteInfo<RssArticlesRouteArgs> {
  RssArticlesRoute({_i14.Key? key, required _i15.Rss rss})
      : super(RssArticlesRoute.name,
            path: 'articles', args: RssArticlesRouteArgs(key: key, rss: rss));

  static const String name = 'RssArticlesRoute';
}

class RssArticlesRouteArgs {
  const RssArticlesRouteArgs({this.key, required this.rss});

  final _i14.Key? key;

  final _i15.Rss rss;

  @override
  String toString() {
    return 'RssArticlesRouteArgs{key: $key, rss: $rss}';
  }
}

/// generated route for
/// [_i4.RssArticlePage]
class RssArticleRoute extends _i13.PageRouteInfo<RssArticleRouteArgs> {
  RssArticleRoute({_i14.Key? key, required _i16.RssItemModel rssItem})
      : super(RssArticleRoute.name,
            path: 'article',
            args: RssArticleRouteArgs(key: key, rssItem: rssItem));

  static const String name = 'RssArticleRoute';
}

class RssArticleRouteArgs {
  const RssArticleRouteArgs({this.key, required this.rssItem});

  final _i14.Key? key;

  final _i16.RssItemModel rssItem;

  @override
  String toString() {
    return 'RssArticleRouteArgs{key: $key, rssItem: $rssItem}';
  }
}

/// generated route for
/// [_i5.RssPhotoViewPage]
class RssPhotoViewRoute extends _i13.PageRouteInfo<RssPhotoViewRouteArgs> {
  RssPhotoViewRoute({_i14.Key? key, required String url})
      : super(RssPhotoViewRoute.name,
            path: 'photo-view',
            args: RssPhotoViewRouteArgs(key: key, url: url));

  static const String name = 'RssPhotoViewRoute';
}

class RssPhotoViewRouteArgs {
  const RssPhotoViewRouteArgs({this.key, required this.url});

  final _i14.Key? key;

  final String url;

  @override
  String toString() {
    return 'RssPhotoViewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i6.MainPage]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: 'main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i7.JokePages]
class JokeRoutes extends _i13.PageRouteInfo<void> {
  const JokeRoutes() : super(JokeRoutes.name, path: 'joke');

  static const String name = 'JokeRoutes';
}

/// generated route for
/// [_i8.ScrollPage]
class ScrollRoute extends _i13.PageRouteInfo<ScrollRouteArgs> {
  ScrollRoute({_i14.Key? key})
      : super(ScrollRoute.name,
            path: 'demo-scroll', args: ScrollRouteArgs(key: key));

  static const String name = 'ScrollRoute';
}

class ScrollRouteArgs {
  const ScrollRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'ScrollRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.RssIndexPage]
class RssIndexRoute extends _i13.PageRouteInfo<RssIndexRouteArgs> {
  RssIndexRoute({_i14.Key? key})
      : super(RssIndexRoute.name,
            path: 'index', args: RssIndexRouteArgs(key: key));

  static const String name = 'RssIndexRoute';
}

class RssIndexRouteArgs {
  const RssIndexRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'RssIndexRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.RssReadPage]
class RssReadRoute extends _i13.PageRouteInfo<RssReadRouteArgs> {
  RssReadRoute({_i14.Key? key})
      : super(RssReadRoute.name,
            path: 'read', args: RssReadRouteArgs(key: key));

  static const String name = 'RssReadRoute';
}

class RssReadRouteArgs {
  const RssReadRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'RssReadRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.RssFindPage]
class RssFindRoute extends _i13.PageRouteInfo<RssFindRouteArgs> {
  RssFindRoute({_i14.Key? key})
      : super(RssFindRoute.name,
            path: 'find', args: RssFindRouteArgs(key: key));

  static const String name = 'RssFindRoute';
}

class RssFindRouteArgs {
  const RssFindRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'RssFindRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.RssConfigPage]
class RssConfigRoute extends _i13.PageRouteInfo<void> {
  const RssConfigRoute() : super(RssConfigRoute.name, path: 'config');

  static const String name = 'RssConfigRoute';
}
