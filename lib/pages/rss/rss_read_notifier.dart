import 'package:flutter_best_practice/data/db/dao/rss_dao.dart';
import 'package:flutter_best_practice/pages/rss/views/add_rss_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'model/rss.dart';

enum ViewState {
  idea, //
  busy,
  empty,
  error,
}

class RssReadState {
  final List<Rss> items;
  final bool hasMore;

  final ViewState viewState;

  RssReadState(
      {required this.items, required this.viewState, required this.hasMore});

  RssReadState.initial()
      : items = [],
        hasMore = false,
        viewState = ViewState.idea;

  RssReadState copy({ViewState? viewState, List<Rss>? items, bool? hasMore}) {
    return RssReadState(
      viewState: viewState ?? this.viewState,
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class RssReadNotifier extends StateNotifier<RssReadState> {
  int _page = 1;
  final int _pageSize = 12;

  final RssDao rssDao;
  RssReadNotifier({required this.rssDao}) : super(RssReadState.initial());

  // 下拉刷新
  onRefresh(RefreshController refreshController) async {
    _page = 1;
    state.copy(viewState: ViewState.busy);
    final res = await rssDao.getRssList(
      page: _page,
      pageSize: _pageSize,
    );
    refreshController.refreshCompleted();
    if (res.isEmpty) {
      state.copy(
        viewState: ViewState.empty,
        items: [],
        hasMore: false,
      );
    } else {
      state.copy(
        viewState: ViewState.idea,
        items: res,
        hasMore: res.length >= _pageSize,
      );
    }
  }

  // 加载下一页
  onLoading(RefreshController refreshController) async {
    _page += 1;
    state.copy(viewState: ViewState.busy);
    final res = await rssDao.getRssList(
      page: _page,
      pageSize: _pageSize,
    );
    refreshController.loadComplete();
    state.copy(
      viewState: ViewState.idea,
      items: [...state.items, ...res],
      hasMore: res.length >= _pageSize,
    );
  }
}

final rssReadProvider =
    StateNotifierProvider.autoDispose<RssReadNotifier, RssReadState>((ref) {
  final rssDao = ref.watch(rssDaoProvider);
  return RssReadNotifier(rssDao: rssDao);
});
