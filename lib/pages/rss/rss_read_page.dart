import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/rss_read_notifier.dart';
import 'package:flutter_best_practice/pages/rss/views/add_rss_view.dart';
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
          const Text("暂无订阅"),
        ],
      ),
    );
  }

  Widget buildList(RssReadState state) {
    if (state.viewState == ViewState.empty) {
      return buildEmpty();
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //横轴三个子widget
          childAspectRatio: 1.0 //宽高比为1时，子widget
          ),
      itemBuilder: (context, index) {
        final item = state.items[index];
        return Container(
          child: Column(
            children: [
              CachedNetworkImage(
                width: 40,
                height: 40,
                imageUrl: item.logo,
              ),
              Text(item.name),
              Text(
                item.desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
      itemCount: state.items.length,
    );
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
