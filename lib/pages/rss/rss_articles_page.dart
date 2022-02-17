import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/rss_articles_notifier.dart';
import 'package:flutter_best_practice/pages/rss/rss_read_notifier.dart';
import 'package:flutter_best_practice/pages/rss/views/appbar.dart';
import 'package:flutter_best_practice/pages/rss/views/cache_image.dart';
import 'package:flutter_best_practice/pages/rss/views/page_common_views.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'model/rss.dart';

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
        return GestureDetector(
          onTap: () {
            ref.read(rssArticlesProvider(rss).notifier).readRssItem(rssItem);
            ref.read(rssReadProvider.notifier).readRssItem(rssItem);
            ref.read(gRouteProvider).push(
                  RssArticleRoute(
                    rssItem: rssItem,
                  ),
                );
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset.zero,
                  ),
                ]),
            child: Column(
              children: [
                if (rssItem.cover != null && rssItem.cover!.isNotEmpty)
                  CacheImage(
                    width: double.infinity,
                    height: 160,
                    imageUrl: rssItem.cover!,
                    fit: BoxFit.cover,
                  ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          rssItem.title,
                          style: TextStyle(
                            color: rssItem.isRead ? Colors.grey : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          rssItem.showDesc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                CacheImage(
                                  margin: const EdgeInsets.only(right: 5),
                                  borderRadius: BorderRadius.circular(20),
                                  imageUrl: rss.logo,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                    child: Text(
                                  rssItem.author,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12),
                                )),
                              ],
                            )),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      LineIcons.calendar,
                                      size: 16,
                                    ),
                                    Text(
                                      rssItem.showDate,
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: state.rss.rssItems.length,
    );
  }
}
