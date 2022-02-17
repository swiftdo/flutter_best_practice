import 'package:drift/drift.dart';
import 'package:flutter_best_practice/data/db/table/rss_category_table.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_category.dart';

import '../rss_db.dart';

part 'rss_category_dao.g.dart';

@DriftAccessor(tables: [RssCategoryTable])
class RssCategoryDao extends DatabaseAccessor<RssDatabase>
    with _$RssCategoryDaoMixin {
  RssCategoryDao(RssDatabase attachedDatabase) : super(attachedDatabase);

  /// 获取列表
  Future<List<RssCategory>> fetchItems() async {
    final res = await (select(rssCategoryTable)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();
    return res.map((e) => RssCategory(id: e.id, name: e.name)).toList();
  }

  /// 添加
  Future<int> addCate(RssCategory cate) async {
    return into(rssCategoryTable).insert(
      RssCategoryTableCompanion(
        name: Value(cate.name),
      ),
    );
  }

  /// 删除
  deleteCate(RssCategory cate) async {
    return (delete(rssCategoryTable)..where((tbl) => tbl.id.equals(cate.id)))
        .go();
  }

  /// 修改
  updateCate(RssCategory cate) async {
    await update(rssCategoryTable).replace(
      RssCategoryTableCompanion(
        id: Value(cate.id),
        name: Value(cate.name),
      ),
    );
  }
}
