import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/views/cache_image.dart';
import 'package:flutter_best_practice/pages/rss/views/rss_source_add_view.dart';
import 'rss_find_notifier.dart';
import 'views/page_common_views.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:group_list_view/group_list_view.dart';

import 'model/view_state.dart';

class RssFindPage extends HookConsumerWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  RssFindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rssFindProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "发现",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        header: const WaterDropHeader(),
        controller: _refreshController,
        onRefresh: () {
          ref
              .read(rssFindProvider.notifier)
              .onRefresh(refreshController: _refreshController);
        },
        child: buildList(state, ref),
      ),
    );
  }

  Widget buildList(RssFindState state, WidgetRef ref) {
    if (state.viewState == ViewState.empty) {
      return const EmptyView();
    }
    if (state.viewState == ViewState.busy &&
        state.items.isEmpty &&
        !_refreshController.isRefresh) {
      return const LoadingView();
    }
    if (state.viewState == ViewState.error && state.items.isEmpty) {
      return ErrorView(
        onReloadTap: () {
          ref
              .read(rssFindProvider.notifier)
              .onRefresh(refreshController: _refreshController);
        },
      );
    }

    return GroupListView(
      itemBuilder: (context, IndexPath index) {
        final item = state.items[index.section].links[index.index];
        return Container(
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset.zero, blurRadius: 10)
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  CacheImage(
                    imageUrl: item.logo,
                    width: 30,
                    height: 30,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              )),
              RssSourceAddView(
                item: item,
              ),
            ],
          ),
        );
      },
      sectionsCount: state.items.length,
      groupHeaderBuilder: (context, int sec) {
        return Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: Row(
            children: [
              Text(
                state.items[sec].name,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        );
      },
      countOfItemInSection: (int sec) {
        return state.items[sec].links.length;
      },
    );
  }
}
