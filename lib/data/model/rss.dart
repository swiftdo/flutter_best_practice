import 'rss_item_model.dart';
import 'package:webfeed/domain/atom_item.dart';
import 'package:webfeed/domain/rss_item.dart';

class Rss {
  int? id;
  final String url;
  final String name;
  final String desc;
  final String logo;
  final int categoryId; // 分类id
  final String type; // rss 类型 , atom | rss
  final bool readOrigin; // 是否直接阅读原文
  final bool openPush; // 是否通知提醒
  final bool grabOrigin; // 是否抓取原文
  final String feedUrl;
  final dynamic items; // 临时存放

  bool get isAtom => type == "atom";
  bool get isRss => type == "rss";

  List<RssItemModel> rssItems;

  Rss({
    this.id,
    required this.url,
    required this.name,
    required this.desc,
    required this.categoryId,
    required this.logo,
    required this.type,
    this.readOrigin = false,
    this.openPush = false,
    this.grabOrigin = false,
    required this.feedUrl,
    this.rssItems = const [],
    this.items,
  });

  Rss copy({
    int? id,
    String? url,
    String? name,
    String? desc,
    int? categoryId,
    String? logo,
    String? type,
    bool? readOrigin,
    bool? openPush,
    bool? grabOrigin,
    String? feedUrl,
    dynamic items,
    List<RssItemModel>? rssItems,
  }) {
    return Rss(
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      categoryId: categoryId ?? this.categoryId,
      logo: logo ?? this.logo,
      type: type ?? this.type,
      readOrigin: readOrigin ?? this.readOrigin,
      openPush: openPush ?? this.openPush,
      grabOrigin: grabOrigin ?? this.grabOrigin,
      feedUrl: feedUrl ?? this.feedUrl,
      items: items ?? this.items,
      rssItems: rssItems ?? this.rssItems,
    );
  }

  refreshRssItems() async {
    if (items != null) {
      if (isAtom) {
        List<AtomItem> feeds = items as List<AtomItem>;
        rssItems =
            feeds.map((e) => RssItemModel.fromAtomItem(e, this)).toList();
      } else if (isRss) {
        List<RssItem> feeds = items as List<RssItem>;
        rssItems = feeds.map((e) => RssItemModel.fromRssItem(e, this)).toList();
      }
    }
  }
}
