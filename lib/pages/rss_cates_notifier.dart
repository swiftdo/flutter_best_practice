import 'package:flutter_best_practice/data/db/dao/rss_category_dao.dart';
import 'package:flutter_best_practice/pages/rss_read_notifier.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/model/rss_category.dart';

class RssCateState {
  final List<RssCategory> items;

  /// 分类选项
  List<RssCategory> get optionItems => [
        RssCategory.all(),
        RssCategory.none(),
        ...items,
      ];

  List<RssCategory> get pickerOptionItems => [
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
  deleteCate(RssCategory cate, WidgetRef ref) async {
    int cateIndex = state.items.indexWhere((element) => element.id == cate.id);

    /// 将该分类的全部改为未分类
    await rssCateDao.deleteCate(cate);
    await ref.read(rssReadProvider.notifier).deleteCate(cate);
    List<RssCategory> cates = List.from(state.items);
    cates.removeAt(cateIndex);
    state = state.copy(
        items: cates,
        selectCateId: cateIndex == state.selectCateId ? k_rssCateAllId : null);

    /// 如果现在选中了该分类，则将该分类变为全部
  }

  // 添加
  addCate(String name) async {
    /// 如果分类名相同，不允许
    if (state.items.map((e) => e.name).contains(name)) {
      return;
    }

    RssCategory cate = RssCategory(id: 0, name: name);
    final id = await rssCateDao.addCate(cate);
    state = state.copy(items: [...state.items, cate.copy(id: id)]);
  }

  /// 修改
  updateCate(RssCategory cate) async {
    final res = await rssCateDao.updateCate(cate);
    List<RssCategory> items = List.from(state.items);
    int index = items.indexWhere((element) => element.id == cate.id);
    items[index] = cate;
    state = state.copy(items: items);
  }

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
