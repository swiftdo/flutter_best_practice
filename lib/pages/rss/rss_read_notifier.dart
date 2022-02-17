import 'package:flutter_best_practice/core/toast_util.dart';
import 'package:flutter_best_practice/data/db/dao/rss_dao.dart';
import 'package:flutter_best_practice/data/db/dao/rss_item_dao.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_category.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_item_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../provider.dart';
import 'model/rss.dart';
import 'model/view_state.dart';

class RssReadState {
  final List<Rss> items;

  final List<Rss> selectItems; // 选中的items;
  final bool isEditMode; // 编辑状态
  final ViewState viewState;

  List<RssItemModel> get allRssItems {
    List<RssItemModel> res = [];
    for (var rss in items) {
      res.addAll(rss.rssItems.map((e) => e));
    }
    res.sort((a, b) => b.pubDate.compareTo(a.pubDate));
    return res;
  }

  RssReadState({
    required this.items,
    required this.viewState,
    required this.selectItems,
    required this.isEditMode,
  });

  RssReadState.initial(this.items)
      : selectItems = [],
        isEditMode = false,
        viewState = ViewState.idle;

  RssReadState copy(
      {ViewState? viewState,
      List<Rss>? items,
      List<Rss>? selectItems,
      bool? isEditMode}) {
    return RssReadState(
      viewState: viewState ?? this.viewState,
      items: items ?? this.items,
      selectItems: selectItems ?? this.selectItems,
      isEditMode: isEditMode ?? this.isEditMode,
    );
  }
}

class RssReadNotifier extends StateNotifier<RssReadState> {
  final RssDao rssDao;
  final RssItemDao rssItemDao;

  RssReadNotifier({
    required this.rssDao,
    required this.rssItemDao,
  }) : super(
          RssReadState.initial([]),
        );

  deleteCate(RssCategory cate) async {
    // 找到这些 cate
    rssDao.resetCateId(cate.id);
    rssItemDao.resetCateId(cate.id);

    /// 刷新
    onRefresh();
  }

  /// 文章已读
  readRssItem(RssItemModel item) async {
    final newItem = item.copy(isRead: true);
    final res = await rssItemDao.updateRssItem(newItem);
    List<Rss> items = List.from(state.items);
    int rssIndex = items.indexWhere((element) => element.id == item.fid);
    final rss = items[rssIndex];
    int itemIndex = rss.rssItems.indexWhere((element) => element.id == item.id);
    if (itemIndex >= 0) {
      rss.rssItems[itemIndex] = newItem;
    }
    state = state.copy(items: items);
  }

  addRss(Rss rss) {
    state = state.copy(items: [rss, ...state.items]);
  }

  /// 切换状态
  toggleEditMode() {
    state = state.copy(isEditMode: !state.isEditMode, selectItems: []);
  }

  /// 切换全选，全不选
  toggleSelectAll() {
    if (state.items.length != state.selectItems.length) {
      state = state.copy(selectItems: state.items);
    } else {
      state = state.copy(selectItems: []);
    }
  }

  /// 选中rss
  checkRss(Rss item) {
    List<Rss> items = List.from(state.selectItems);
    if (items.contains(item)) {
      items.remove(item);
    } else {
      items.add(item);
    }
    state = state.copy(selectItems: items);
  }

  // 删除选中的rss
  delete() async {
    List<Rss> items = List.from(state.items);
    List<int?> ids = state.selectItems.map((e) => e.id).toList();
    items.removeWhere((element) => ids.contains(element.id));
    await rssDao.deleteRssList(state.selectItems, rssItemDao);
    state = state.copy(items: items, selectItems: [], isEditMode: false);
    MyToast.showSuccess("删除成功");
  }

  // 移动选中的分类
  folderTo(RssCategory cate) async {
    /// 需要选择分类，分类选择成功后，才可以
    final rssIds = state.selectItems.map((e) => e.id!).toList();
    await rssDao.updateRssListToCate(rssIds, cate);
    await rssItemDao.updateRssItemToCate(rssIds, cate);
    onRefresh();
  }

  // 下拉刷新
  onRefresh({RefreshController? refreshController}) async {
    state = state.copy(
      viewState: ViewState.busy,
      isEditMode: false,
      selectItems: [],
    );
    try {
      /// 从缓存中获取
      final res = await rssDao.getAllRssList(rssItemDao: rssItemDao);
      refreshController?.refreshCompleted();
      if (res.isEmpty) {
        state = state.copy(
          viewState: ViewState.empty,
          items: [],
        );
      } else {
        state = state.copy(
          viewState: ViewState.idle,
          items: res,
        );
      }
    } catch (e, s) {
      refreshController?.refreshCompleted();
      logger.e(error: e, stackTrace: s);
      state = state.copy(viewState: ViewState.error);
    }
  }
}

final rssReadProvider =
    StateNotifierProvider<RssReadNotifier, RssReadState>((ref) {
  final rssDao = ref.watch(rssDaoProvider);
  final rssItemDao = ref.watch(rssItemDaoProvider);
  return RssReadNotifier(rssDao: rssDao, rssItemDao: rssItemDao);
});
