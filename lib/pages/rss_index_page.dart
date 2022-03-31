import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss_read_notifier.dart';
import 'views/appbar.dart';
import 'views/cache_image.dart';
import 'views/page_common_views.dart';
import 'views/rss_article_cell.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'model/view_state.dart';

// rss 首页
class RssIndexPage extends HookConsumerWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  RssIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rssReadProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarExt.leftTitle("阅读"),
      body: SmartRefresher(
        enablePullDown: true,
        header: const WaterDropHeader(),
        controller: _refreshController,
        onRefresh: () {
          ref
              .read(rssReadProvider.notifier)
              .onRefresh(refreshController: _refreshController);
        },
        child: buildList(state, ref, context),
      ),
    );
  }

  Widget buildList(RssReadState state, WidgetRef ref, BuildContext context) {
    final allItems = state.allRssItems;

    if (state.viewState == ViewState.empty) {
      return const EmptyView();
    }
    return ListView.builder(
      padding: EdgeInsets.only(
          bottom: max(MediaQuery.of(context).padding.bottom, 10)),
      itemBuilder: (context, index) {
        final rssItem = allItems[index];
        return RssArticleCell(
          rssItem: rssItem,
          onTap: () {
            ref.read(rssReadProvider.notifier).readRssItem(rssItem);
          },
        );
      },
      itemCount: allItems.length,
    );
  }
}
