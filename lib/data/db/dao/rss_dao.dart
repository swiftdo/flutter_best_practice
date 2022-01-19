import 'package:drift/drift.dart';
import 'package:flutter_best_practice/data/db/dao/rss_item_dao.dart';
import 'package:flutter_best_practice/data/db/rss_db.dart';
import 'package:flutter_best_practice/data/db/table/rss_table.dart';
import 'package:flutter_best_practice/pages/rss/model/rss.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_item_model.dart';

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

  Future<List<Rss>> getRssList(
      {required int page,
      required int pageSize,
      required RssItemDao rssItemDao}) async {
    final res = await (select(rssTable)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
          ..limit(pageSize, offset: (page - 1) * pageSize))
        .get();
    final futures = res.map((e) async {
      final items = await rssItemDao.getItems(e.id);
      return e.toRss(items: items);
    }).toList();
    return await Future.wait(futures);
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
  Future<int> saveRss(Rss rss) {
    return into(rssTable).insert(
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
