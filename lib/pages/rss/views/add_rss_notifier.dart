import 'package:flutter_best_practice/core/toast_util.dart';
import 'package:flutter_best_practice/data/db/dao/rss_dao.dart';
import 'package:flutter_best_practice/data/db/dao/rss_item_dao.dart';
import 'package:flutter_best_practice/data/repository/rss_repository.dart';
import 'package:flutter_best_practice/pages/rss/model/rss.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_category.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AddRssStatus { ideal, loading, finished, error }

class AddRssState {
  final String? url;
  final AddRssStatus status;
  final Rss? rss;
  final RssCategory cate;

  AddRssState({this.url, required this.status, this.rss, required this.cate});

  AddRssState.initial({String? feedUrl})
      : url = feedUrl,
        rss = null,
        cate = RssCategory.none(),
        status = AddRssStatus.ideal;

  AddRssState copyWith(
      {required String url,
      AddRssStatus? status,
      Rss? rss,
      RssCategory? cate}) {
    return AddRssState(
        url: url,
        status: status ?? this.status,
        rss: rss ?? this.rss,
        cate: cate ?? this.cate);
  }

  AddRssState copyWithStatus(AddRssStatus status) {
    return AddRssState(status: status, url: url, rss: rss, cate: cate);
  }
}

class AddRssNotifier extends StateNotifier<AddRssState> {
  final IRssRepository repository;
  final RssDao rssDao;
  final RssItemDao rssItemDao;

  AddRssNotifier({
    required this.repository,
    required this.rssDao,
    required this.rssItemDao,
    String? feedUrl,
  }) : super(AddRssState.initial(feedUrl: feedUrl)) {
    if (feedUrl != null && feedUrl.isNotEmpty == true) {
      fetch();
    }
  }

  set url(String url) {
    state = state.copyWith(url: url);
  }

  fetch() async {
    final String? url = state.url?.trim();
    if (url == null || url.isEmpty) {
      MyToast.showError("请填写 url");
      return;
    }
    state = state.copyWithStatus(AddRssStatus.loading);

    /// 获取到 rss 信息
    try {
      Rss? rss = await rssDao.getRss(url, rssItemDao);
      rss ??= await repository.getRss(url);
      state =
          state.copyWith(url: state.url!, status: AddRssStatus.error, rss: rss);
    } catch (e, s) {
      state = state.copyWithStatus(AddRssStatus.ideal);
      logger.e(error: e, stackTrace: s);
      MyToast.showError("获取失败");
    }
  }

  selectCate(RssCategory cate) {
    final rss = state.rss?.copy(categoryId: cate.id);
    state = state.copyWith(url: state.url!, cate: cate, rss: rss);
  }

  /// 添加rss
  addRss(Rss rss) async {
    if (rss.id == null) {
      // 保存rss
      await rssDao.saveRss(rss, rssItemDao: rssItemDao);
    }
  }
}

final addRssProvider = StateNotifierProvider.autoDispose
    .family<AddRssNotifier, AddRssState, String?>((ref, feedUrl) {
  final repository = ref.watch(repositoryProvider);
  final rssDao = ref.watch(rssDaoProvider);
  final rssItemDao = ref.watch(rssItemDaoProvider);
  return AddRssNotifier(
      repository: repository,
      rssDao: rssDao,
      rssItemDao: rssItemDao,
      feedUrl: feedUrl);
});
