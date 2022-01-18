import 'package:drift/drift.dart';
import 'package:flutter_best_practice/data/db/rss_db.dart';
import 'package:flutter_best_practice/data/db/table/rss_table.dart';
import 'package:flutter_best_practice/pages/rss/model/rss.dart';

part 'rss_dao.g.dart';

extension RssTableDataExt on RssTableData {
  Rss toRss({String? feedUrl}) {
    final res = this;
    return Rss(
      id: res.id,
      url: feedUrl ?? res.url,
      name: res.name,
      desc: res.desc,
      categoryId: res.categoryId,
      type: res.type,
      readOrigin: res.readOrigin,
      openPush: res.openPush,
      logo: res.logo,
    );
  }
}

@DriftAccessor(tables: [RssTable])
class RssDao extends DatabaseAccessor<RssDatabase> with _$RssDaoMixin {
  RssDao(RssDatabase db) : super(db);

  Future<List<Rss>> getRssList(
      {required int page, required int pageSize}) async {
    final res = await (select(rssTable)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
          ..limit(pageSize, offset: (page - 1) * pageSize))
        .get();
    return res.map((e) => e.toRss()).toList();
  }

  Future<Rss?> getRss(String url) async {
    final res = await (select(rssTable)..where((tbl) => tbl.url.equals(url)))
        .getSingleOrNull();
    return res?.toRss();
  }

  Future saveRss(Rss rss) {
    return into(rssTable).insert(
      RssTableCompanion(
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
}
