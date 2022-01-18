import 'package:drift/drift.dart';
import 'package:flutter_best_practice/data/db/table/rss_category_table.dart';

import '../rss_db.dart';
part 'rss_item_dao.g.dart';

@DriftAccessor(tables: [RssCategoryTable])
class RssItemDao extends DatabaseAccessor<RssDatabase> with _$RssItemDaoMixin {
  RssItemDao(RssDatabase attachedDatabase) : super(attachedDatabase);
}
