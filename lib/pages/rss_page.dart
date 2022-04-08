import 'package:auto_route/auto_route.dart';
import 'package:flutter_best_practice/generated/l10n.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class RssPage extends HookConsumerWidget {
  const RssPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: [
        RssIndexRoute(),
        RssReadRoute(),
        RssFindRoute(),
        const RssConfigRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                haptic: true,
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 28,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                onTabChange: tabsRouter.setActiveIndex,
                selectedIndex: tabsRouter.activeIndex,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: S.of(context).tab_home,
                  ),
                  GButton(
                    icon: LineIcons.egg,
                    text: S.of(context).tab_order,
                  ),
                  GButton(
                    icon: LineIcons.search,
                    text: S.of(context).tab_find,
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: S.of(context).tab_mine,
                  )
                ]),
          ),
        );
      },
    );
  }
}
