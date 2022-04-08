import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss_articles_notifier.dart';
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

import '../data/model/rss.dart';

/// 文章列表
class RssArticlesPage extends HookConsumerWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final Rss rss;

  RssArticlesPage({Key? key, required this.rss}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rssArticlesProvider(rss));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarExt.backTitle(rss.name),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: const WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("release to load more");
            } else {
              body = const Text("No more Data");
            }
            return Container(
              height: 55.0,
              alignment: Alignment.center,
              child: body,
            );
          },
        ),
        controller: _refreshController,
        onRefresh: () {
          ref
              .read(rssArticlesProvider(rss).notifier)
              .onRefresh(_refreshController);
        },
        child: buildList(context, state, ref),
      ),
    );
  }

  Widget buildList(
    BuildContext context,
    RssArticlesState state,
    WidgetRef ref,
  ) {
    if (state.rss.rssItems.isEmpty) {
      return const EmptyView();
    }

    return ListView.builder(
      padding: EdgeInsets.only(
          bottom: max(MediaQuery.of(context).padding.bottom, 10)),
      itemBuilder: (context, index) {
        final rssItem = state.rss.rssItems[index];
        return RssArticleCell(
          rssItem: rssItem,
          onTap: () {
            ref.read(rssArticlesProvider(rss).notifier).readRssItem(rssItem);
            ref.read(rssReadProvider.notifier).readRssItem(rssItem);
          },
        );
      },
      itemCount: state.rss.rssItems.length,
    );
  }
}
