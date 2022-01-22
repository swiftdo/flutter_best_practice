import 'package:drift/drift.dart';

import 'package:flutter_best_practice/data/db/table/rss_item_table.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_item_model.dart';

import '../rss_db.dart';
part 'rss_item_dao.g.dart';

extension RssItemTableDataExt on RssItemTableData {
  RssItemModel toRssItemModel() {
    return RssItemModel(
      id: id,
      fid: fid,
      cateId: cateId,
      title: title,
      desc: desc,
      link: link,
      author: author,
      pubDate: pubDate,
      content: content,
      isCached: isCached,
      isRead: isRead,
      cover: cover,
      category: category,
    );
  }
}

@DriftAccessor(tables: [RssItemTable])
class RssItemDao extends DatabaseAccessor<RssDatabase> with _$RssItemDaoMixin {
  RssItemDao(RssDatabase attachedDatabase) : super(attachedDatabase);

  /// 保存多个
  Future<List<int>> saveItems(List<RssItemModel> items) async {
    final futures = items.map((element) async {
      var res = await (select(rssItemTable)
            ..where((tbl) =>
                tbl.fid.equals(element.fid) & tbl.title.equals(element.title)))
          .getSingleOrNull();
      if (res == null) {
        /// 不存在则，进行保存
        final res = await addItem(element);
        return res;
      } else {
        res = res.copyWith(
          title: element.title,
          category: element.category,
          link: element.link,
          author: element.author,
          cover: element.cover,
          desc: element.desc,
          content: element.content,
          pubDate: element.pubDate,
          cateId: element.cateId,
        );
        await update(rssItemTable).replace(res);
        return res.id;
      }
    });
    return await Future.wait(futures);
  }

  Future<int> addItem(RssItemModel item) async {
    return into(rssItemTable).insert(
      RssItemTableCompanion(
        fid: Value(item.fid),
        cateId: Value(item.cateId),
        title: Value(item.title),
        desc: Value(item.desc),
        content: Value(item.content),
        link: Value(item.link),
        author: Value(item.author),
        pubDate: Value(item.pubDate),
        category: Value(item.category),
        cover: Value(item.cover),
        isRead: Value(item.isRead),
        isCached: Value(item.isCached),
      ),
    );
  }

  /// 获取某个rss的items
  Future<List<RssItemModel>> getItems(int fid) async {
    final res = await (select(rssItemTable)
          ..where((tbl) => tbl.fid.equals(fid))
          ..orderBy([
            (t) => OrderingTerm(expression: t.pubDate, mode: OrderingMode.asc)
          ]))
        .get();

    return res.map((e) => e.toRssItemModel()).toList();
  }

  /// 删除某个rss的items
  Future<int> deleteItemsFromRss(int fid) {
    return (delete(rssItemTable)..where((tbl) => tbl.fid.equals(fid))).go();
  }
}
