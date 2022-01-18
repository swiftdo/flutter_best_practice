import 'package:dio/dio.dart';
import 'package:flutter_best_practice/pages/rss/model/rss.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';

abstract class IRssRepository {
  Future<Rss?> getRss(String feedUrl, {String? type});
}

class RssRepository implements IRssRepository {
  final _dioClient = Dio(BaseOptions(
    receiveTimeout: 20000,
    connectTimeout: 20000,
  ));

  @override
  Future<Rss?> getRss(String feedUrl, {String? type}) async {
    Response response = await _dioClient.get(feedUrl);
    String? rssType = type;

    dynamic feed;
    if (type == null || type.isEmpty) {
      try {
        feed = RssFeed.parse(response.data);
        rssType = "rss";
      } on Error {
        feed = AtomFeed.parse(response.data);
        rssType = "atom";
      }
    } else if (type == 'atom') {
      feed = AtomFeed.parse(response.data);
    } else if (type == 'rss') {
      feed = RssFeed.parse(response.data);
    }
    return _rssFrom(feed, feedUrl, rssType);
  }

  // 从 link 中获取域名，拼接 https://coolshell.cn/favicon.ico
  _getIcoLink(String url) {
    Uri uri = Uri.parse(url);
    return "${uri.scheme}://${uri.host}/favicon.ico";
  }

  _rssFrom(dynamic feed, String url, String? type) {
    if (feed == null) {
      return null;
    }

    if (feed is RssFeed) {
      return Rss(
        url: feed.link ?? "",
        name: feed.title ?? "",
        desc: feed.description ?? "",
        logo: _getIcoLink(url),
        type: type ?? "",
        categoryId: 0,
        feedUrl: url,
      );
    } else if (feed is AtomFeed) {
      final link = feed.links?.first.href ?? "";
      return Rss(
        url: link,
        name: feed.title ?? "",
        desc: feed.subtitle ?? '',
        logo: _getIcoLink(url),
        type: type ?? "",
        categoryId: 0,
        feedUrl: url,
      );
    } else {
      return null;
    }
  }
}
