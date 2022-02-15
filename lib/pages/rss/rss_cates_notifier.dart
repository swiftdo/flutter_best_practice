import 'package:flutter_best_practice/data/db/dao/rss_category_dao.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/rss_category.dart';

class RssCateState {
  final List<RssCategory> items;

  /// 分类选项
  List<RssCategory> get optionItems => [
        RssCategory.all(),
        RssCategory.none(),
        ...items,
      ];

  RssCategory get selectCate =>
      optionItems.firstWhere((element) => element.id == selectCateId);

  final int selectCateId; // null: 全部， 0：未分类

  RssCateState({required this.items, this.selectCateId = k_rssCateAllId});

  RssCateState.initial()
      : items = [],
        selectCateId = k_rssCateAllId;

  RssCateState copy({
    List<RssCategory>? items,
    int? selectCateId,
  }) {
    return RssCateState(
      items: items ?? this.items,
      selectCateId: selectCateId ?? this.selectCateId,
    );
  }
}

class RssCatesNotifier extends StateNotifier<RssCateState> {
  final RssCategoryDao rssCateDao;
  RssCatesNotifier({required this.rssCateDao}) : super(RssCateState.initial()) {
    fetchCates();
  }

  selectCate(RssCategory cate) {
    state = state.copy(selectCateId: cate.id);
  }

  // 删除
  deleteCate(RssCategory cate) {
    /// 将该分类的全部改为未分类
    rssCateDao.deleteCate(cate);

    /// 如果现在选中了该分类，则将该分类变为全部
  }

  // 添加
  addCate(String name) {}

  /// 修改
  updateCate(RssCategory cate) {}

  /// 获取cate
  fetchCates() async {
    final items = await rssCateDao.fetchItems();
    state = state.copy(items: items);
  }
}

final rssCatesProvider =
    StateNotifierProvider<RssCatesNotifier, RssCateState>((ref) {
  final rssCateDao = ref.watch(rssCateDaoProvider);
  return RssCatesNotifier(rssCateDao: rssCateDao);
});
