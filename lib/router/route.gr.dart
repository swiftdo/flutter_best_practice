// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../pages/model/rss.dart' as _i12;
import '../pages/model/rss_item_model.dart' as _i13;
import '../pages/rss_article_page.dart' as _i4;
import '../pages/rss_articles_page.dart' as _i3;
import '../pages/rss_cates_page.dart' as _i2;
import '../pages/rss_config_page.dart' as _i9;
import '../pages/rss_find_page.dart' as _i8;
import '../pages/rss_index_page.dart' as _i6;
import '../pages/rss_page.dart' as _i1;
import '../pages/rss_photo_view_page.dart' as _i5;
import '../pages/rss_read_page.dart' as _i7;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    RssRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RssPage());
    },
    RssCatesRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RssCatesPage());
    },
    RssArticlesRoute.name: (routeData) {
      final args = routeData.argsAs<RssArticlesRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.RssArticlesPage(key: args.key, rss: args.rss));
    },
    RssArticleRoute.name: (routeData) {
      final args = routeData.argsAs<RssArticleRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RssArticlePage(key: args.key, rssItem: args.rssItem));
    },
    RssPhotoViewRoute.name: (routeData) {
      final args = routeData.argsAs<RssPhotoViewRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.RssPhotoViewPage(key: args.key, url: args.url));
    },
    RssIndexRoute.name: (routeData) {
      final args = routeData.argsAs<RssIndexRouteArgs>(
          orElse: () => const RssIndexRouteArgs());
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.RssIndexPage(key: args.key));
    },
    RssReadRoute.name: (routeData) {
      final args = routeData.argsAs<RssReadRouteArgs>(
          orElse: () => const RssReadRouteArgs());
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.RssReadPage(key: args.key));
    },
    RssFindRoute.name: (routeData) {
      final args = routeData.argsAs<RssFindRouteArgs>(
          orElse: () => const RssFindRouteArgs());
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.RssFindPage(key: args.key));
    },
    RssConfigRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.RssConfigPage());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(RssRoute.name, path: '/', children: [
          _i10.RouteConfig(RssIndexRoute.name,
              path: 'index', parent: RssRoute.name),
          _i10.RouteConfig(RssReadRoute.name,
              path: 'read', parent: RssRoute.name),
          _i10.RouteConfig(RssFindRoute.name,
              path: 'find', parent: RssRoute.name),
          _i10.RouteConfig(RssConfigRoute.name,
              path: 'config', parent: RssRoute.name)
        ]),
        _i10.RouteConfig(RssCatesRoute.name, path: 'cates'),
        _i10.RouteConfig(RssArticlesRoute.name, path: 'articles'),
        _i10.RouteConfig(RssArticleRoute.name, path: 'article'),
        _i10.RouteConfig(RssPhotoViewRoute.name, path: 'photo-view')
      ];
}

/// generated route for
/// [_i1.RssPage]
class RssRoute extends _i10.PageRouteInfo<void> {
  const RssRoute({List<_i10.PageRouteInfo>? children})
      : super(RssRoute.name, path: '/', initialChildren: children);

  static const String name = 'RssRoute';
}

/// generated route for
/// [_i2.RssCatesPage]
class RssCatesRoute extends _i10.PageRouteInfo<void> {
  const RssCatesRoute() : super(RssCatesRoute.name, path: 'cates');

  static const String name = 'RssCatesRoute';
}

/// generated route for
/// [_i3.RssArticlesPage]
class RssArticlesRoute extends _i10.PageRouteInfo<RssArticlesRouteArgs> {
  RssArticlesRoute({_i11.Key? key, required _i12.Rss rss})
      : super(RssArticlesRoute.name,
            path: 'articles', args: RssArticlesRouteArgs(key: key, rss: rss));

  static const String name = 'RssArticlesRoute';
}

class RssArticlesRouteArgs {
  const RssArticlesRouteArgs({this.key, required this.rss});

  final _i11.Key? key;

  final _i12.Rss rss;

  @override
  String toString() {
    return 'RssArticlesRouteArgs{key: $key, rss: $rss}';
  }
}

/// generated route for
/// [_i4.RssArticlePage]
class RssArticleRoute extends _i10.PageRouteInfo<RssArticleRouteArgs> {
  RssArticleRoute({_i11.Key? key, required _i13.RssItemModel rssItem})
      : super(RssArticleRoute.name,
            path: 'article',
            args: RssArticleRouteArgs(key: key, rssItem: rssItem));

  static const String name = 'RssArticleRoute';
}

class RssArticleRouteArgs {
  const RssArticleRouteArgs({this.key, required this.rssItem});

  final _i11.Key? key;

  final _i13.RssItemModel rssItem;

  @override
  String toString() {
    return 'RssArticleRouteArgs{key: $key, rssItem: $rssItem}';
  }
}

/// generated route for
/// [_i5.RssPhotoViewPage]
class RssPhotoViewRoute extends _i10.PageRouteInfo<RssPhotoViewRouteArgs> {
  RssPhotoViewRoute({_i11.Key? key, required String url})
      : super(RssPhotoViewRoute.name,
            path: 'photo-view',
            args: RssPhotoViewRouteArgs(key: key, url: url));

  static const String name = 'RssPhotoViewRoute';
}

class RssPhotoViewRouteArgs {
  const RssPhotoViewRouteArgs({this.key, required this.url});

  final _i11.Key? key;

  final String url;

  @override
  String toString() {
    return 'RssPhotoViewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i6.RssIndexPage]
class RssIndexRoute extends _i10.PageRouteInfo<RssIndexRouteArgs> {
  RssIndexRoute({_i11.Key? key})
      : super(RssIndexRoute.name,
            path: 'index', args: RssIndexRouteArgs(key: key));

  static const String name = 'RssIndexRoute';
}

class RssIndexRouteArgs {
  const RssIndexRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'RssIndexRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.RssReadPage]
class RssReadRoute extends _i10.PageRouteInfo<RssReadRouteArgs> {
  RssReadRoute({_i11.Key? key})
      : super(RssReadRoute.name,
            path: 'read', args: RssReadRouteArgs(key: key));

  static const String name = 'RssReadRoute';
}

class RssReadRouteArgs {
  const RssReadRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'RssReadRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.RssFindPage]
class RssFindRoute extends _i10.PageRouteInfo<RssFindRouteArgs> {
  RssFindRoute({_i11.Key? key})
      : super(RssFindRoute.name,
            path: 'find', args: RssFindRouteArgs(key: key));

  static const String name = 'RssFindRoute';
}

class RssFindRouteArgs {
  const RssFindRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'RssFindRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.RssConfigPage]
class RssConfigRoute extends _i10.PageRouteInfo<void> {
  const RssConfigRoute() : super(RssConfigRoute.name, path: 'config');

  static const String name = 'RssConfigRoute';
}
