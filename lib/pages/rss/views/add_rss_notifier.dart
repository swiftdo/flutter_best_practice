import 'package:flutter_best_practice/data/db/dao/rss_dao.dart';
import 'package:flutter_best_practice/data/db/dao/rss_item_dao.dart';
import 'package:flutter_best_practice/data/repository/rss_repository.dart';
import 'package:flutter_best_practice/pages/rss/model/rss.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_item_model.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/atom_item.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

enum AddRssStatus { ideal, loading, finished, error }

class AddRssState {
  final String? url;
  final AddRssStatus status;
  final Rss? rss;

  AddRssState({this.url, required this.status, this.rss});

  AddRssState.initial()
      : url = null,
        rss = null,
        status = AddRssStatus.ideal;

  AddRssState copyWith({required String url, AddRssStatus? status, Rss? rss}) {
    return AddRssState(
        url: url, status: status ?? this.status, rss: rss ?? this.rss);
  }

  AddRssState copyWithStatus(AddRssStatus status) {
    return AddRssState(status: status, url: url, rss: rss);
  }
}

class AddRssNotifier extends StateNotifier<AddRssState> {
  final IRssRepository repository;
  final RssDao rssDao;
  final RssItemDao rssItemDao;

  AddRssNotifier(
      {required this.repository,
      required this.rssDao,
      required this.rssItemDao})
      : super(AddRssState.initial());

  set url(String url) {
    state = state.copyWith(url: url);
  }

  fetch() async {
    final String? url = state.url?.trim();
    if (url == null || url.isEmpty) {
      EasyLoading.showError("请填写 url");
      return;
    }
    state = state.copyWithStatus(AddRssStatus.loading);

    /// 获取到 rss 信息
    try {
      Rss? rss = await rssDao.getRss(url, rssItemDao);
      rss ??= await repository.getRss(url);
      state =
          state.copyWith(url: state.url!, status: AddRssStatus.error, rss: rss);
    } catch (e) {
      state = state.copyWithStatus(AddRssStatus.ideal);
      EasyLoading.showError("获取失败");
    }
  }

  /// 添加rss
  addRss(Rss rss) async {
    // 保存rss
    final fid = await rssDao.saveRss(rss);
    rss.id = fid;
    // 需要更新 子 items;
    await rss.refreshRssItems();
    await rssItemDao.saveItems(rss.rssItems);
  }
}

final rssDaoProvider = Provider((ref) {
  final db = ref.watch(gDb);
  return RssDao(db);
});

final rssItemDaoProvider = Provider((ref) {
  final db = ref.watch(gDb);
  return RssItemDao(db);
});

final repositoryProvider = Provider.autoDispose<IRssRepository>((ref) {
  return RssRepository();
});

final addRssProvider =
    StateNotifierProvider.autoDispose<AddRssNotifier, AddRssState>((ref) {
  final repository = ref.watch(repositoryProvider);
  final rssDao = ref.watch(rssDaoProvider);
  final rssItemDao = ref.watch(rssItemDaoProvider);
  return AddRssNotifier(
      repository: repository, rssDao: rssDao, rssItemDao: rssItemDao);
});
