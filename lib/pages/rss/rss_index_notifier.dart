import 'package:flutter_best_practice/data/db/dao/rss_item_dao.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_item_model.dart';
import 'package:flutter_best_practice/pages/rss/rss_read_notifier.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RssIndexState {
  List<RssItemModel> items;
  final bool hasMore;
  final ViewState viewState;

  RssIndexState(
      {required this.items, required this.viewState, required this.hasMore});

  RssIndexState.initial()
      : items = [],
        viewState = ViewState.idle,
        hasMore = false;

  RssIndexState copy(
      {List<RssItemModel>? items, bool? hasMore, ViewState? viewState}) {
    return RssIndexState(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      viewState: viewState ?? this.viewState,
    );
  }
}

class RssIndexNotifier extends StateNotifier<RssIndexState> {
  final RssItemDao rssItemDao;

  RssIndexNotifier({required this.rssItemDao}) : super(RssIndexState.initial());

  final int _pageSize = 30;
  int _page = 1;

  // 下拉刷新
  onRefresh(RefreshController refreshController) async {
    _page = 1;
    state = state.copy(viewState: ViewState.busy);
    final res = await rssItemDao.fetchItems(
      page: _page,
      pageSize: _pageSize,
    );
    refreshController.refreshCompleted();
    if (res.isEmpty) {
      state = state.copy(
        viewState: ViewState.empty,
        items: [],
        hasMore: false,
      );
    } else {
      state = state.copy(
        viewState: ViewState.idle,
        items: res,
        hasMore: res.length >= _pageSize,
      );
    }
  }

  // 加载下一页
  onLoading(RefreshController refreshController) async {
    _page += 1;
    state.copy(viewState: ViewState.busy);
    final res = await rssItemDao.fetchItems(
      page: _page,
      pageSize: _pageSize,
    );
    refreshController.loadComplete();
    state.copy(
      viewState: ViewState.idle,
      items: [...state.items, ...res],
      hasMore: res.length >= _pageSize,
    );
  }
}

final rssIndexProvider =
    StateNotifierProvider<RssIndexNotifier, RssIndexState>((ref) {
  final rssItemDao = ref.watch(rssItemDaoProvider);
  return RssIndexNotifier(rssItemDao: rssItemDao);
});
