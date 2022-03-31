import 'package:dio/dio.dart';
import 'package:favicon/favicon.dart';
import 'package:flutter_best_practice/pages/model/rss.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';

abstract class IRssRepository {
  Future<Rss?> getRss(String feedUrl, {String? type});
  Future<List<Map>> getRssFindSources();
}

class RssRepository implements IRssRepository {
  final _dioClient = Dio(BaseOptions(
    receiveTimeout: 60000,
    connectTimeout: 60000,
  ))
    ..interceptors.add(LogInterceptor(responseBody: false, requestBody: true));

  @override
  Future<List<Map>> getRssFindSources() async {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return _rssLinks;
    });
  }

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
  Future<String> _getIcoLink(String url) async {
    // Uri uri = Uri.parse(url);
    // return "${uri.scheme}://${uri.host}/favicon.ico";
    final icon = await Favicon.getBest(url);
    return icon?.url ?? '';
  }

  Future<Rss?> _rssFrom(dynamic feed, String url, String? type) async {
    if (feed == null) {
      return null;
    }
    if (feed is RssFeed) {
      final link = feed.link ?? url;
      final logo = await _getIcoLink(link);
      return Rss(
        url: link,
        name: feed.title ?? "",
        desc: feed.description ?? "",
        logo: logo,
        type: type ?? "",
        categoryId: 0,
        feedUrl: url,
        items: feed.items,
      );
    } else if (feed is AtomFeed) {
      final link = feed.links?.first.href ?? url;
      final logo = await _getIcoLink(link);
      return Rss(
        url: link,
        name: feed.title ?? "",
        desc: feed.subtitle ?? '',
        logo: logo,
        type: type ?? "",
        categoryId: 0,
        feedUrl: url,
        items: feed.items,
      );
    } else {
      return null;
    }
  }
}

get _rssLinks => [
      {
        "name": "科技",
        "links": [
          {
            "name": "最美应用",
            "logo": "http://zuimeia.com/favicon.ico",
            "url": "http://zuimeia.com/feed/"
          },
          {
            "name": "阮一峰的网络日志",
            "logo": "http://www.ruanyifeng.com/favicon.ico",
            "url": "http://www.ruanyifeng.com/blog/atom.xml"
          },
          {
            "name": "美团技术",
            "logo": "",
            "url": "https://tech.meituan.com/feed/",
          },
          {
            "name": "小碎银",
            "logo":
                "https://www.xiaosuiyin.com/wp-content/uploads/2019/12/xiaosuiyin-1.png",
            "url": "https://www.xiaosuiyin.com/feed/"
          },
          {
            "name": "厘米天空",
            "logo":
                "https://www.cmsky.com/wp-content/uploads/2016/12/favicon1.ico",
            "url": "http://www.cmsky.com/feed/"
          },
        ]
      },
      {
        "name": "博客",
        "links": [
          {
            "name": "界面新闻",
            "logo": "http://www.jiemian.com/favicon.ico",
            "url": "https://a.jiemian.com/index.php?m=article&a=rss"
          },
          {
            "name": "抽屉新热榜",
            "logo": "http://www.chouti.com/favicon.ico",
            "url": "http://dig.chouti.com/feed.xml"
          },
          {
            "name": "精品MAC应用分享",
            "logo": "https://img.xclient.info/icon/favicon.ico",
            "url": "http://xclient.info/feed/"
          },
          {
            "name": "钛媒体",
            "logo": "http://www.tmtpost.com/favicon.ico",
            "url": "http://www.tmtpost.com/feed"
          },
        ]
      },
      {
        "name": "内容平台",
        "links": [
          {
            "name": "V2 方圆",
            "logo":
                "https://www.v2fy.com/wp-content/uploads/2021/03/cropped-v2fy-ico-192x192.png",
            "url": "https://www.v2fy.com/feed/"
          },
          {
            "name": "音范丝",
            "logo": "https://www.yinfans.me/favicon.ico",
            "url": "http://www.yinfans.me/feed"
          },
          {
            "name": "书格",
            "logo":
                "https://new.shuge.org/wp-content/uploads/2018/06/shugeorg-icon.png",
            "url": "https://new.shuge.org/feed/"
          },
          {
            "name": "当我在扯淡",
            "logo": "https://s1.wp.com/i/favicon.ico",
            "url": "https://yinwang1.wordpress.com/feed/"
          }
        ]
      },
    ];
