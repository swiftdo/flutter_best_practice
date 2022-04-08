import 'package:flutter_best_practice/core/toast_util.dart';
import 'package:flutter_best_practice/data/model/rss_sources_model.dart';
import 'package:flutter_best_practice/data/model/view_state.dart';
import 'package:flutter_best_practice/data/repository/rss_repository.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RssFindState {
  final List<RssSourcesModel> items;
  final ViewState viewState;

  RssFindState({required this.items, required this.viewState});
  RssFindState.initial()
      : items = [],
        viewState = ViewState.idle;

  RssFindState copy({List<RssSourcesModel>? items, ViewState? viewState}) {
    return RssFindState(
        items: items ?? this.items, viewState: viewState ?? this.viewState);
  }
}

class RssFindNotifier extends StateNotifier<RssFindState> {
  final IRssRepository repository;

  RssFindNotifier({required this.repository}) : super(RssFindState.initial());

  onRefresh({RefreshController? refreshController}) async {
    state = state.copy(viewState: ViewState.busy);
    try {
      final response = await repository.getRssFindSources();
      List<RssSourcesModel> model = response
          .map((e) => RssSourcesModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      refreshController?.refreshCompleted();
      // 获取到图标
      // final s = [];
      // // 替换图标
      // final resFutures = model.map((element) async {
      //   final futures = element.links.map((e) async {
      //     try {
      //       final rss = await repository.getRss(e.url);
      //       e = e.copyWith(logo: rss!.logo);
      //       s.add(e.toJson());
      //       return e;
      //     } catch (_) {
      //       return e;
      //     }
      //   });
      //   final res = await Future.wait(futures);
      //   element = element.copyWith(links: res);
      //   return element;
      // });
      // final result = await Future.wait(resFutures);
      // logger.v(s);
      state = state.copy(
          items: model,
          viewState: model.isEmpty ? ViewState.empty : ViewState.idle);
    } catch (e, s) {
      refreshController?.refreshCompleted();
      state = state.copy(items: [], viewState: ViewState.error);
      myToast.showError("加载失败");
      myLogger.e(error: e, stackTrace: s);
    }
  }
}

final rssFindProvider =
    StateNotifierProvider.autoDispose<RssFindNotifier, RssFindState>((ref) {
  final repository = ref.watch(repositoryProvider);
  return RssFindNotifier(repository: repository);
});
