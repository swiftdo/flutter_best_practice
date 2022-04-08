import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss_cates_notifier.dart';
import 'package:flutter_best_practice/pages/rss_read_notifier.dart';
import 'views/add_rss_view.dart';
import 'views/appbar.dart';
import 'views/cache_image.dart';
import 'views/page_common_views.dart';
import 'views/rss_cate_select_view.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../data/model/rss.dart';
import 'package:flutter_best_practice/data/model/view_state.dart';

/// 源头
class RssReadPage extends HookConsumerWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RssReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rssReadProvider);
    final cateState = ref.watch(rssCatesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarExt.leftTitle(
        "订阅",
        actions: [
          IconButton(
            onPressed: () {
              addRss(context);
            },
            icon: const Icon(
              Icons.add_circle,
              color: Colors.black,
            ),
          )
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
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _pickCate(context);
                  },
                  child: Container(
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
                        Text(
                          cateState.selectCate.name,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
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
      body: _buildBody(state, cateState, ref, context),
    );
  }

  _pickCate(BuildContext context) {
    showModalBottomSheet(
      context: context,
      //自定义底部弹窗布局
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return HookConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(rssCatesProvider);
            const double plr = 16;
            const double itemS = 20;
            final itemW =
                (MediaQuery.of(context).size.width - 2 * plr - itemS) / 2;

            return Container(
              padding: const EdgeInsets.only(top: 10, left: plr, right: plr),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const Text(
                          "分类",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          iconSize: 20,
                          padding: const EdgeInsets.all(2),
                          splashRadius: 16,
                          onPressed: () {
                            Navigator.of(context).pop();

                            /// 跳转到
                            myRouter.push(const RssCatesRoute());
                          },
                          icon: const Icon(
                            Icons.settings,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Wrap(
                        runSpacing: itemS,
                        spacing: itemS,
                        children: state.optionItems
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  if (state.selectCateId == e.id) {
                                    return;
                                  }
                                  ref
                                      .read(rssCatesProvider.notifier)
                                      .selectCate(e);
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: 1),
                                    color: state.selectCateId == e.id
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  width: itemW,
                                  height: 36,
                                  alignment: Alignment.center,
                                  child: Text(
                                    e.name,
                                    style: TextStyle(
                                      color: state.selectCateId == e.id
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBody(RssReadState state, RssCateState cateState, WidgetRef ref,
      BuildContext context) {
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
            child: buildList(state, cateState, ref),
          ),
        ),
        if (state.isEditMode)
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black12,
                  width: 0.5,
                ),
              ),
            ),
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
                          /// 弹窗，分类选择
                          Alert(
                            context: context,
                            title: "选择新分类",
                            content: RssCateSelectView(
                              onSelect: (cate) {
                                ref
                                    .read(rssReadProvider.notifier)
                                    .folderTo(cate);
                              },
                            ),
                            buttons: [],
                          ).show();
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

  Widget buildList(RssReadState state, RssCateState cateState, WidgetRef ref) {
    if (state.viewState == ViewState.empty) {
      return const EmptyView();
    }

    List<Rss> showRssList = [];
    if (cateState.selectCate.isAll) {
      showRssList = state.items;
    } else {
      showRssList = state.items
          .where((element) => element.categoryId == cateState.selectCate.id)
          .toList();
    }

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemBuilder: (context, index) {
        return _buildItemCell(state, showRssList[index], ref);
      },
      itemCount: showRssList.length,
    );
  }

  Widget _buildItemCell(RssReadState state, Rss rss, WidgetRef ref) {
    final cell = GestureDetector(
      onTap: () {
        myRouter.push(RssArticlesRoute(rss: rss));
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
              imageUrl: rss.logo,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                rss.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                rss.desc,
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
                ref.read(rssReadProvider.notifier).checkRss(rss);
              },
              child: Container(
                padding: const EdgeInsets.only(top: 5, right: 5),
                child: Icon(state.selectItems.contains(rss)
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
