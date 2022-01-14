import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
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
      routes: const [
        RssIndexRoute(),
        RssReadRoute(),
        RssConfigRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavyBar(
          selectedIndex: tabsRouter.activeIndex,
          onItemSelected: tabsRouter.setActiveIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(title: Text('Item One'), icon: Icon(Icons.home)),
            BottomNavyBarItem(title: Text('Item Two'), icon: Icon(Icons.apps)),
            BottomNavyBarItem(
                title: Text('Item Three'), icon: Icon(Icons.chat_bubble)),
          ],
        );
      },
    );
  }
}
