import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AddRssStatus {
  ideal,
  loading,
  finished,
}

class AddRssState {
  final String? url;
  final AddRssStatus status;
  AddRssState({this.url, required this.status});

  AddRssState.initial()
      : url = null,
        status = AddRssStatus.finished;

  AddRssState copyWith({required String url, AddRssStatus? status}) {
    return AddRssState(url: url, status: status ?? this.status);
  }

  AddRssState copyWithStatus(AddRssStatus status) {
    return AddRssState(status: status, url: url);
  }
}

class AddRssNotifier extends StateNotifier<AddRssState> {
  AddRssNotifier() : super(AddRssState.initial());

  set url(String url) {
    state = state.copyWith(url: url);
  }

  fetch() async {
    state = state.copyWithStatus(AddRssStatus.loading);

    /// 获取到 rss 信息

    /// finished
  }

  /// 添加rss
  add() {}
}
