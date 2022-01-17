import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RssPage extends HookConsumerWidget {
  const RssPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: [
        const RssIndexRoute(),
        RssReadRoute(),
        const RssFindRoute(),
        const RssConfigRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavyBar(
          showElevation: false,
          selectedIndex: tabsRouter.activeIndex,
          onItemSelected: tabsRouter.setActiveIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                activeColor: Colors.black,
                title: Text('首页'),
                icon: Icon(Icons.home),
                textAlign: TextAlign.center),
            BottomNavyBarItem(
                activeColor: Colors.black,
                title: Text('订阅'),
                icon: Icon(Icons.apps),
                textAlign: TextAlign.center),
            BottomNavyBarItem(
                activeColor: Colors.black,
                title: Text('发现'),
                icon: Icon(Icons.find_in_page_outlined),
                textAlign: TextAlign.center),
            BottomNavyBarItem(
                activeColor: Colors.black,
                title: Text('我的'),
                icon: Icon(Icons.person),
                textAlign: TextAlign.center),
          ],
        );
      },
    );
  }
}
