import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/rss_read_notifier.dart';
import 'package:flutter_best_practice/pages/rss/views/add_rss_view.dart';
import 'package:flutter_best_practice/pages/rss/views/cache_image.dart';
import 'package:flutter_best_practice/pages/rss/views/page_common_views.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'model/view_state.dart';

/// 源头
class RssReadPage extends HookConsumerWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RssReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rssReadProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "订阅",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                addRss(context);
              },
              icon: const Icon(
                Icons.add_circle,
                color: Colors.black,
              ))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.black12,
                        offset: Offset.zero,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "全部类型",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        width: 1,
                        height: 10,
                        color: Colors.black,
                      ),
                      const Icon(
                        Icons.dashboard_outlined,
                        color: Colors.black,
                        size: 16,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    ref.read(rssReadProvider.notifier).toggleEditMode();
                  },
                  child: state.isEditMode
                      ? const Text("取消")
                      : Row(
                          children: const [
                            Icon(
                              Icons.check_circle_outline,
                              size: 16,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text("选择")
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _buildBody(state, ref),
    );
  }

  Widget _buildBody(RssReadState state, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
            child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: const WaterDropHeader(),
          controller: _refreshController,
          onRefresh: () {
            ref
                .read(rssReadProvider.notifier)
                .onRefresh(refreshController: _refreshController);
          },
          child: buildList(state, ref),
        )),
        if (state.isEditMode)
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: Colors.black12,
              width: 0.5,
            ))),
            padding: const EdgeInsets.only(right: 16),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(rssReadProvider.notifier).toggleSelectAll();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        state.items.length != state.selectItems.length
                            ? const Icon(Icons.radio_button_unchecked)
                            : const Icon(Icons.check_circle),
                        Container(
                          child: const Text("全选"),
                          margin: const EdgeInsets.only(left: 2),
                        )
                      ],
                    ),
                  ),
                ),
                Wrap(
                  spacing: 30,
                  children: [
                    _buildEditAction(
                        icon: LineIcons.folder,
                        title: "分组",
                        enable: state.selectItems.isNotEmpty,
                        onTap: () {
                          ref.read(rssReadProvider.notifier).folder();
                        }),
                    _buildEditAction(
                        icon: LineIcons.trash,
                        title: "删除",
                        enable: state.selectItems.isNotEmpty,
                        onTap: () {
                          ref.read(rssReadProvider.notifier).delete();
                        }),
                  ],
                )
              ],
            ),
          )
      ],
    );
  }

  Widget _buildEditAction({
    required IconData icon,
    required String title,
    bool enable = true,
    VoidCallback? onTap,
  }) {
    final color = enable ? Colors.black : Colors.grey;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (enable) {
          onTap?.call();
        }
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: 20,
            color: color,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: color),
          )
        ],
      ),
    );
  }

  Widget buildList(RssReadState state, WidgetRef ref) {
    if (state.viewState == ViewState.empty) {
      return const EmptyView();
    }
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemBuilder: (context, index) {
        return _buildItemCell(state, index, ref);
      },
      itemCount: state.items.length,
    );
  }

  Widget _buildItemCell(RssReadState state, int index, WidgetRef ref) {
    final item = state.items[index];
    final cell = GestureDetector(
      onTap: () {
        ref.read(gRouteProvider).push(RssArticlesRoute(rss: item));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              offset: Offset.zero,
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            CacheImage(
              width: 40,
              height: 40,
              imageUrl: item.logo,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                item.desc,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (state.isEditMode) {
      return Stack(
        children: [
          cell,
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ref.read(rssReadProvider.notifier).checkRss(item);
              },
              child: Container(
                padding: const EdgeInsets.only(top: 5, right: 5),
                child: Icon(state.selectItems.contains(item)
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked_outlined),
              ),
            ),
          )
        ],
      );
    } else {
      return cell;
    }
  }

  addRss(BuildContext context) {
    Alert(
      context: context,
      title: "添加订阅",
      content: const AddRssView(),
      buttons: [],
    ).show();
  }
}
