import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/rss_read_notifier.dart';
import 'package:flutter_best_practice/pages/rss/views/add_rss_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RssReadPage extends HookConsumerWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);

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
                )
              ],
            ),
          ),
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: state.hasMore,
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
          ref.read(rssReadProvider.notifier).onRefresh(_refreshController);
        },
        onLoading: () {
          ref.read(rssReadProvider.notifier).onLoading(_refreshController);
        },
        child: buildList(state),
      ),
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

  Widget buildList(RssReadState state) {
    if (state.viewState == ViewState.empty) {
      return buildEmpty();
    }

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemBuilder: (context, index) {
        final item = state.items[index];
        return Container(
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
              CachedNetworkImage(
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
        );
      },
      itemCount: state.items.length,
    );

    // return GridView.builder(
    //   padding: const EdgeInsets.symmetric(horizontal: 16),
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     mainAxisSpacing: 10,
    //     crossAxisSpacing: 10,
    //     crossAxisCount: 3,
    //     childAspectRatio: 1.0,
    //   ),
    //   itemBuilder: (context, index) {
    //     final item = state.items[index];
    //     return Container(
    //       decoration: const BoxDecoration(color: Colors.green),
    //       padding: const EdgeInsets.all(5),
    //       alignment: Alignment.center,
    //       child: Column(
    //         children: [
    //           CachedNetworkImage(
    //             width: 40,
    //             height: 40,
    //             imageUrl: item.logo,
    //             fit: BoxFit.cover,
    //           ),
    //           Container(
    //             margin: const EdgeInsets.only(top: 5),
    //             child: Text(
    //               item.name,
    //               style: const TextStyle(
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //           Container(
    //             margin: const EdgeInsets.only(top: 5),
    //             child: Text(
    //               item.desc,
    //               maxLines: 2,
    //               overflow: TextOverflow.ellipsis,
    //               style: const TextStyle(
    //                 color: Colors.grey,
    //                 fontSize: 12,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    //   itemCount: state.items.length,
    // );
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
