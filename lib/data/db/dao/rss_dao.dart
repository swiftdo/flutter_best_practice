import 'package:drift/drift.dart';
import 'package:flutter_best_practice/data/db/rss_db.dart';
import 'package:flutter_best_practice/data/db/table/rss_table.dart';
import 'package:flutter_best_practice/pages/rss/model/rss.dart';

part 'rss_dao.g.dart';

@DriftAccessor(tables: [RssTable])
class RssDao extends DatabaseAccessor<RssDatabase> with _$RssDaoMixin {
  RssDao(RssDatabase db) : super(db);

  Future<Rss?> getRss(String url) async {
    final res = await (select(rssTable)..where((tbl) => tbl.url.equals(url)))
        .getSingleOrNull();

    if (res != null) {
      return Rss(
        id: res.id,
        url: res.url,
        name: res.name,
        desc: res.desc,
        categoryId: res.categoryId,
        type: res.type,
        readOrigin: res.readOrigin,
        openPush: res.openPush,
        logo: res.logo,
      );
    }
    return null;
  }

  Future saveRss(Rss rss) {
    return into(rssTable).insert(
      RssTableCompanion(
        url: Value(rss.url),
      ),
    );
  }
}
