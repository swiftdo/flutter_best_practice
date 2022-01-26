import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/rss_read_notifier.dart';
import 'package:flutter_best_practice/pages/rss/views/cache_image.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RssIndexPage extends HookConsumerWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  RssIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rssReadProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          '阅读',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        header: const WaterDropHeader(),
        controller: _refreshController,
        onRefresh: () {
          ref
              .read(rssReadProvider.notifier)
              .onRefresh(refreshController: _refreshController);
        },
        child: buildList(state, ref),
      ),
    );
  }

  Widget buildList(RssReadState state, WidgetRef ref) {
    final allItems = state.allRssItems;

    if (state.viewState == ViewState.empty) {
      return buildEmpty();
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final rssItem = allItems[index];
        return GestureDetector(
          onTap: () {
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
                        child: Text(rssItem.title),
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
                            Row(
                              children: [
                                CacheImage(
                                  margin: const EdgeInsets.only(right: 5),
                                  borderRadius: BorderRadius.circular(20),
                                  imageUrl: rssItem.rssLogo,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                                Text(rssItem.rssName),
                              ],
                            ),
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
      itemCount: allItems.length,
    );
  }

  Widget buildEmpty() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: const Text("暂无订阅数据"),
          ),
        ],
      ),
    );
  }
}
