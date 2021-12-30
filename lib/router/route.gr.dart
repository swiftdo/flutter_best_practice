// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../pages/main/main_page.dart' as _i1;
import '../pages/jokes/jokes_page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    JokeRoutes.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.JokePages());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(MainRoute.name, path: '/'),
        _i3.RouteConfig(JokeRoutes.name, path: 'joke')
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.JokePages]
class JokeRoutes extends _i3.PageRouteInfo<void> {
  const JokeRoutes() : super(JokeRoutes.name, path: 'joke');

  static const String name = 'JokeRoutes';
}
