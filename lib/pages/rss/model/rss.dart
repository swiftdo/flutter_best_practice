import 'package:flutter_best_practice/data/repository/rss_repository.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';

class Rss {
  final int? id;
  final String url;
  final String name;
  final String desc;
  final String logo;
  final int categoryId; // 分类id
  final String type; // rss 类型 , atom | rss
  final bool readOrigin; // 是否直接阅读原文
  final bool openPush; // 是否通知提醒
  final bool grabOrigin; // 是否抓取原文

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
  });

  // 从 link 中获取域名，拼接https://coolshell.cn/favicon.ico
  static getIcoLink(String url) {
    Uri uri = Uri.parse(url);
    return "${uri.scheme}://${uri.host}/favicon.ico";
  }

  static Rss? from(RssRes? res, String url) {
    if (res == null) {
      return null;
    }
    if (res.isRss) {
      final feed = res.feed as RssFeed;
      return Rss(
        url: url,
        name: feed.title ?? "",
        desc: feed.description ?? "",
        logo: feed.image?.url ?? getIcoLink(url),
        type: res.type,
        categoryId: 0,
      );
    } else if (res.isAtom) {
      final feed = res.feed as AtomFeed;
      return Rss(
        url: url,
        name: feed.title ?? "",
        desc: feed.subtitle ?? '',
        logo: feed.logo ?? getIcoLink(url),
        type: res.type,
        categoryId: 0,
      );
    }
  }
}
