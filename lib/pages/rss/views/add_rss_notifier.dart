import 'package:flutter_best_practice/data/db/dao/rss_dao.dart';
import 'package:flutter_best_practice/data/repository/rss_repository.dart';
import 'package:flutter_best_practice/pages/rss/model/rss.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  AddRssNotifier({required this.repository, required this.rssDao})
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
      Rss? rss = await rssDao.getRss(url);
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
    await rssDao.saveRss(rss);
  }
}

final rssDaoProvider = Provider((ref) {
  final db = ref.watch(gDb);
  return RssDao(db);
});

final repositoryProvider = Provider.autoDispose<IRssRepository>((ref) {
  return RssRepository();
});

final addRssProvider =
    StateNotifierProvider.autoDispose<AddRssNotifier, AddRssState>((ref) {
  final repository = ref.watch(repositoryProvider);
  final rssDao = ref.watch(rssDaoProvider);
  return AddRssNotifier(repository: repository, rssDao: rssDao);
});
