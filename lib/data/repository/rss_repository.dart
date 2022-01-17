import 'package:dio/dio.dart';
import 'package:flutter_best_practice/pages/rss/model/rss.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';

class RssRes {
  final String type;
  final dynamic feed;
  RssRes({required this.type, this.feed});

  bool get isAtom => type == "atom";
  bool get isRss => type == "rss";

  RssRes.atom(this.feed) : type = "atom";
  RssRes.rss(this.feed) : type = "rss";
}

abstract class IRssRepository {
  Future<Rss?> getRss(String url);
}

class RssRepository implements IRssRepository {
  final _dioClient = Dio(BaseOptions(
    receiveTimeout: 20000,
    connectTimeout: 20000,
  ));

  @override
  Future<Rss?> getRss(String url, {String? type}) async {
    Response response = await _dioClient.get(url);
    RssRes? feed;
    if (type == null || type.isEmpty) {
      try {
        feed = RssRes.rss(RssFeed.parse(response.data));
      } on Error {
        feed = RssRes.atom(AtomFeed.parse(response.data));
      }
    } else if (type == 'atom') {
      feed = RssRes.atom(AtomFeed.parse(response.data));
    } else if (type == 'rss') {
      feed = RssRes.rss(RssFeed.parse(response.data));
    }
    return Rss.from(feed);
  }
}
