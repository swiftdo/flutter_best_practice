import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/jokes/jokes_page.dart';
import 'package:flutter_best_practice/pages/main/main_page.dart';
import 'package:flutter_best_practice/pages/scroll/scroll_page.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    //RedirectRoute(path: '*', redirectTo: '/'),
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(path: "joke", page: JokePages),
    AutoRoute(path: "demo-scroll", page: ScrollPage),
  ],
)
class $AppRouter {}
