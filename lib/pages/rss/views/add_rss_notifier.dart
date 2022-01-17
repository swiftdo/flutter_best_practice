import 'package:flutter/foundation.dart';
import 'package:flutter_best_practice/data/repository/rss_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AddRssStatus { ideal, loading, finished, error }

class AddRssState {
  final String? url;
  final AddRssStatus status;
  final RssRes? res;

  AddRssState({this.url, required this.status, this.res});

  AddRssState.initial()
      : url = null,
        res = null,
        status = AddRssStatus.ideal;

  AddRssState copyWith(
      {required String url, AddRssStatus? status, RssRes? res}) {
    return AddRssState(
        url: url, status: status ?? this.status, res: res ?? this.res);
  }

  AddRssState copyWithStatus(AddRssStatus status) {
    return AddRssState(status: status, url: url, res: res);
  }
}

class AddRssNotifier extends StateNotifier<AddRssState> {
  final IRssRepository repository;

  AddRssNotifier({required this.repository}) : super(AddRssState.initial());

  set url(String url) {
    state = state.copyWith(url: url);
  }

  fetch() async {
    if (state.url == null) {
      EasyLoading.showError("请填写 url");
      return;
    }

    state = state.copyWithStatus(AddRssStatus.loading);

    /// 获取到 rss 信息
    try {
      /// 优先从数据库中取，如果数据库中没取到，则从网络中取，从网络中获取成功后，将数据保存到数据库中
      final res = await repository.getRss(state.url!);
      state =
          state.copyWith(url: state.url!, status: AddRssStatus.error, res: res);
    } catch (e) {
      state = state.copyWithStatus(AddRssStatus.ideal);
      EasyLoading.showError("获取失败");
    }
  }

  /// 添加rss
  add() {}
}

final repositoryProvider = Provider.autoDispose<IRssRepository>((ref) {
  return RssRepository();
});

final addRssProvider =
    StateNotifierProvider.autoDispose<AddRssNotifier, AddRssState>((ref) {
  final repository = ref.watch(repositoryProvider);
  return AddRssNotifier(repository: repository);
});
