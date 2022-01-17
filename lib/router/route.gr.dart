// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../pages/jokes/jokes_page.dart' as _i2;
import '../pages/main/main_page.dart' as _i1;
import '../pages/rss/rss_config_page.dart' as _i8;
import '../pages/rss/rss_find_page.dart' as _i7;
import '../pages/rss/rss_index_page.dart' as _i5;
import '../pages/rss/rss_page.dart' as _i4;
import '../pages/rss/rss_read_page.dart' as _i6;
import '../pages/scroll/scroll_page.dart' as _i3;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    JokeRoutes.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.JokePages());
    },
    ScrollRoute.name: (routeData) {
      final args = routeData.argsAs<ScrollRouteArgs>(
          orElse: () => const ScrollRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ScrollPage(key: args.key));
    },
    RssRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RssPage());
    },
    RssIndexRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RssIndexPage());
    },
    RssReadRoute.name: (routeData) {
      final args = routeData.argsAs<RssReadRouteArgs>(
          orElse: () => const RssReadRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.RssReadPage(key: args.key));
    },
    RssFindRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RssFindPage());
    },
    RssConfigRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.RssConfigPage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(MainRoute.name, path: '/'),
        _i9.RouteConfig(JokeRoutes.name, path: 'joke'),
        _i9.RouteConfig(ScrollRoute.name, path: 'demo-scroll'),
        _i9.RouteConfig(RssRoute.name, path: 'demo-rss', children: [
          _i9.RouteConfig(RssIndexRoute.name,
              path: 'index', parent: RssRoute.name),
          _i9.RouteConfig(RssReadRoute.name,
              path: 'read', parent: RssRoute.name),
          _i9.RouteConfig(RssFindRoute.name,
              path: 'find', parent: RssRoute.name),
          _i9.RouteConfig(RssConfigRoute.name,
              path: 'config', parent: RssRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.JokePages]
class JokeRoutes extends _i9.PageRouteInfo<void> {
  const JokeRoutes() : super(JokeRoutes.name, path: 'joke');

  static const String name = 'JokeRoutes';
}

/// generated route for
/// [_i3.ScrollPage]
class ScrollRoute extends _i9.PageRouteInfo<ScrollRouteArgs> {
  ScrollRoute({_i10.Key? key})
      : super(ScrollRoute.name,
            path: 'demo-scroll', args: ScrollRouteArgs(key: key));

  static const String name = 'ScrollRoute';
}

class ScrollRouteArgs {
  const ScrollRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'ScrollRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.RssPage]
class RssRoute extends _i9.PageRouteInfo<void> {
  const RssRoute({List<_i9.PageRouteInfo>? children})
      : super(RssRoute.name, path: 'demo-rss', initialChildren: children);

  static const String name = 'RssRoute';
}

/// generated route for
/// [_i5.RssIndexPage]
class RssIndexRoute extends _i9.PageRouteInfo<void> {
  const RssIndexRoute() : super(RssIndexRoute.name, path: 'index');

  static const String name = 'RssIndexRoute';
}

/// generated route for
/// [_i6.RssReadPage]
class RssReadRoute extends _i9.PageRouteInfo<RssReadRouteArgs> {
  RssReadRoute({_i10.Key? key})
      : super(RssReadRoute.name,
            path: 'read', args: RssReadRouteArgs(key: key));

  static const String name = 'RssReadRoute';
}

class RssReadRouteArgs {
  const RssReadRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'RssReadRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.RssFindPage]
class RssFindRoute extends _i9.PageRouteInfo<void> {
  const RssFindRoute() : super(RssFindRoute.name, path: 'find');

  static const String name = 'RssFindRoute';
}

/// generated route for
/// [_i8.RssConfigPage]
class RssConfigRoute extends _i9.PageRouteInfo<void> {
  const RssConfigRoute() : super(RssConfigRoute.name, path: 'config');

  static const String name = 'RssConfigRoute';
}
