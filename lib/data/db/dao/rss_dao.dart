import 'package:drift/drift.dart';
import 'package:flutter_best_practice/data/db/dao/rss_item_dao.dart';
import 'package:flutter_best_practice/data/db/rss_db.dart';
import 'package:flutter_best_practice/data/db/table/rss_table.dart';
import 'package:flutter_best_practice/data/model/rss.dart';
import 'package:flutter_best_practice/data/model/rss_category.dart';
import 'package:flutter_best_practice/data/model/rss_item_model.dart';

part 'rss_dao.g.dart';

extension RssTableDataExt on RssTableData {
  Rss toRss({List<RssItemModel>? items}) {
    return Rss(
      id: id,
      url: url,
      name: name,
      desc: desc,
      categoryId: categoryId,
      type: type,
      readOrigin: readOrigin,
      openPush: openPush,
      logo: logo,
      feedUrl: feedUrl,
      rssItems: items ?? [],
    );
  }
}

@DriftAccessor(tables: [RssTable])
class RssDao extends DatabaseAccessor<RssDatabase> with _$RssDaoMixin {
  RssDao(RssDatabase db) : super(db);

  /// 获取rss 不用同步items
  Future<List<Rss>> getAllRssWithoutSyncItems() async {
    final res = await (select(rssTable)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();
    return res.map((e) => e.toRss()).toList();
  }

  Future<List<Rss>> getAllRssList({
    required RssItemDao rssItemDao,
  }) async {
    final res = await (select(rssTable)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();

    if (res.isNotEmpty) {
      final futures = res.map((e) async {
        final items = await rssItemDao.getItems(e.id);
        return e.toRss(items: items);
      }).toList();
      return await Future.wait(futures);
    }
    return [];
  }

  Future<Rss?> getRss(String feedUrl, RssItemDao itemDao) async {
    final res = await (select(rssTable)
          ..where((tbl) => tbl.feedUrl.equals(feedUrl)))
        .getSingleOrNull();
    if (res != null) {
      final items = await itemDao.getItems(res.id);
      return res.toRss(items: items);
    }
    return null;
  }

  // 保存rss
  Future<int> saveRss(Rss rss, {required RssItemDao rssItemDao}) async {
    int? fid = rss.id;
    if (fid == null) {
      fid = await into(rssTable).insert(
        RssTableCompanion(
          feedUrl: Value(rss.feedUrl),
          url: Value(rss.url),
          name: Value(rss.name),
          desc: Value(rss.desc),
          logo: Value(rss.logo),
          categoryId: Value(rss.categoryId),
          type: Value(rss.type),
          readOrigin: Value(rss.readOrigin),
          openPush: Value(rss.openPush),
          grabOrigin: Value(rss.grabOrigin),
        ),
      );
    } else {
      await update(rssTable).replace(
        RssTableData(
          id: rss.id!,
          name: rss.name,
          desc: rss.desc,
          logo: rss.logo,
          url: rss.url,
          feedUrl: rss.feedUrl,
          categoryId: rss.categoryId,
          type: rss.type,
          readOrigin: rss.readOrigin,
          openPush: rss.openPush,
          grabOrigin: rss.grabOrigin,
        ),
      );
    }
    rss.id = fid;
    // 需要更新 子 items;
    await rss.refreshRssItems();
    await rssItemDao.saveItems(rss.rssItems);
    return fid;
  }

  // 将老的cateid 变为 0
  resetCateId(int oldCateId) async {
    return (update(rssTable)..where((tbl) => tbl.categoryId.equals(oldCateId)))
        .write(const RssTableCompanion(categoryId: Value(0)));
  }

  updateRssListToCate(List<int> rssIds, RssCategory cate) {
    return (update(rssTable)..where((tbl) => tbl.id.isIn(rssIds)))
        .write(RssTableCompanion(categoryId: Value(cate.id)));
  }

  // 删除 rss,
  Future<List<int>> deleteRssList(List<Rss> items, RssItemDao itemDao) async {
    final futures = items.map((rss) async {
      final delRss =
          await (delete(rssTable)..where((tbl) => tbl.id.equals(rss.id))).go();
      final delItems = await itemDao.deleteItemsFromRss(rss.id!);
      return delRss + delItems;
    });
    return Future.wait(futures);
  }
}
