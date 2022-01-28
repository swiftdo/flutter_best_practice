import 'package:drift/drift.dart';
import 'package:flutter_best_practice/data/db/table/rss_category_table.dart';

import '../rss_db.dart';

part 'rss_category_dao.g.dart';

@DriftAccessor(tables: [RssCategoryTable])
class RssCategoryDao extends DatabaseAccessor<RssDatabase>
    with _$RssCategoryDaoMixin {
  RssCategoryDao(RssDatabase attachedDatabase) : super(attachedDatabase);
}
