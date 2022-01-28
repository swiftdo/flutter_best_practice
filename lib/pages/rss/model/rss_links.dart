import 'package:flutter_best_practice/data/model/rss_sources_model.dart';
import 'package:flutter_best_practice/data/repository/rss_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rssLinks = [
  {
    "name": "科技",
    "links": [
      {
        "name": "少数派",
        "url": "http://sspai.me/feed",
        "logo": "",
      },
      {
        "name": "极客公园",
        "url": "http://feeds.geekpark.net",
        "logo": "",
      },
      {
        "name": "TechCrunch中文版",
        "url": "http://techcrunch.cn/feed",
        "logo": "",
      },
      {
        "name": "数字尾巴",
        "url": "https://www.dgtle.com/rss/dgtle.xml",
        "logo": "",
      },
      {
        "name": "36氪",
        "url": "http://wwww.36kr.com/feed",
        "logo": "",
      },
      {
        "name": "IT之家",
        "url": "http://www.ithome.com/rss",
        "logo": "",
      },
      {
        "name": "Engadget中文版 RSS Feed",
        "url": "https://chinese.engadget.com/rss.html",
        "logo": "",
      },
      {
        "name": "电脑玩物",
        "url": "http://feeds.feedburner.com/playpc",
        "logo": "",
      },
      {
        "name": "T客帮",
        "url": "http://feeds.feedburner.com/techbang",
        "logo": "",
      }
    ]
  },
  {
    "name": "博客",
    "links": [
      {
        "name": "阮一峰的网络日志",
        "url": "http://www.ruanyifeng.com/blog/atom.xml",
        "logo": "",
      },
      {
        "name": "当我在扯淡",
        "url": "https://yinwang1.wordpress.com/feed/",
        "logo": "",
      },
      {
        "name": "V2 方圆",
        "url": "https://www.v2fy.com/feed/",
        "logo": "",
      },
      {
        "name": "极客公园",
        "url": "https://www.geekpark.net/rss",
        "logo": "",
      },
      {
        "name": "MOOC 中国",
        "url": "https://www.mooc.cn/feed",
        "logo": "",
      },
      {
        "name": "美团技术",
        "url": "https://tech.meituan.com/feed/",
        "logo": "",
      },
      {
        "name": "世说新语",
        "url": "https://www.wangyurui.top/feed.xml",
        "logo": "",
      },
      {
        "name": "小球飞鱼",
        "url": "https://mantyke.icu/index.xml",
        "logo": "",
      },
      {
        "name": "小球飞鱼",
        "url": "https://mantyke.icu/index.xml",
        "logo": "",
      },
      {
        "name": "苹果fans博客",
        "url": "http://www.mac52ipod.cn/feed.php",
        "logo": "",
      },
      {
        "name": "Michael Tsai",
        "url": "https://mjtsai.com/blog/feed/",
        "logo": "",
      },
      {
        "name": "千古壹号",
        "url": "https://qianguyihao.com/atom.xml",
        "logo": "",
      },
      {
        "name": "小碎银",
        "url": "https://www.xiaosuiyin.com/feed/",
        "logo": "",
      },
      {
        "name": "四公子的剑",
        "url": "https://www.965.one/atom.xml",
        "logo": "",
      },
      {
        "name": "乔治小站",
        "url": "https://licaoz.com/feed/",
        "logo": "",
      },
      {
        "name": "橘子味的心",
        "url": "https://52xml.cn/atom.xml",
        "logo": "",
      },
      {
        "name": "素履独行",
        "url": "https://blog.yuanpei.me/atom.xml",
        "logo": "",
      },
      {
        "name": "",
        "url": "",
        "logo": "",
      },
    ]
  },
  {
    "name": "内容平台",
    "links": [
      {
        "name": "知乎每日精选",
        "url": "https://www.zhihu.com/rss",
        "logo": "",
      },
      {
        "name": "小众软件",
        "url": "https://www.appinn.com/feed/",
        "logo": "",
      },
      {
        "name": "酷壳",
        "url": "https://coolshell.cn/feed",
        "logo": "",
      },
      {
        "name": "豆瓣影评",
        "url": "https://www.douban.com/feed/review/movie",
        "logo": "",
      },
      {
        "name": "豆瓣书评",
        "url": "https://www.douban.com/feed/review/book",
        "logo": "",
      },
      {
        "name": "抽屉新热榜",
        "url": "http://dig.chouti.com/feed.xml",
        "logo": "",
      },
      {
        "name": "泛见志",
        "url": "http://www.fanjian.net/rss",
        "logo": "",
      },
      {
        "name": "独立开发者社区",
        "url": "https://indiehackers.net/topics/feed",
        "logo": "",
      },
      {
        "name": "利器",
        "url": "https://liqi.io/feed/",
        "logo": "",
      },
      {
        "name": "互联网早读课",
        "url": "http://zaodula.com/feed",
        "logo": "",
      },
      {
        "name": "站长之家",
        "url": "http://app.chinaz.com/?app=rss",
        "logo": "",
      },
      {
        "name": "互联网的一些事",
        "url": "http://feed.yixieshi.com/",
        "logo": "",
      },
      {
        "name": "精品MAC应用分享",
        "url": "http://xclient.info/feed/",
        "logo": "",
      },
      {
        "name": "最美应用",
        "url": "http://zuimeia.com/feed/",
        "logo": "",
      },
      {
        "name": "科学松鼠会",
        "url": "http://songshuhui.net/feed",
        "logo": "",
      },
      {
        "name": "理想生活实验室",
        "url": "http://www.toodaylab.com/feed",
        "logo": "",
      },
      {
        "name": "优设网",
        "url": "http://www.uisdc.com/feed",
        "logo": "",
      },
      {
        "name": "胶片的味道",
        "url": "http://letsfilm.org/feed",
        "logo": "",
      },
      {
        "name": "音范丝",
        "url": "http://www.yinfans.me/feed",
        "logo": "",
      },
      {
        "name": "书格",
        "url": "https://new.shuge.org/feed/",
        "logo": "",
      },
      {
        "name": "四季书评",
        "url": "http://www.4sbooks.com/feed",
        "logo": "",
      },
      {
        "name": "左岸读书",
        "url": "http://www.zreading.cn/feed",
        "logo": "",
      },
      {
        "name": "技术小黑屋",
        "url": "https://droidyue.com/atom.xml",
        "logo": "",
      },
      {
        "name": "界面新闻",
        "url": "https://a.jiemian.com/index.php?m=article&a=rss",
        "logo": "",
      },
      {
        "name": "数字尾巴",
        "url": "http://www.dgtle.com/rss/dgtle.xml",
        "logo": "",
      },
      {
        "name": "经济学人",
        "url": "https://www.economist.com/sections/china/rss.xml",
        "logo": "",
      },
      {
        "name": "爱应用",
        "url": "http://www.iapps.im/feed/inde",
        "logo": "",
      },
      {
        "name": "有格调",
        "url": "https://www.ugediao.com/feed",
        "logo": "",
      },
      {
        "name": "触乐",
        "url": "http://www.chuapp.com/feed",
        "logo": "",
      },
      {
        "name": "钛媒体",
        "url": "http://www.tmtpost.com/feed",
        "logo": "",
      },
      {
        "name": "厘米天空",
        "url": "http://www.cmsky.com/feed/",
        "logo": "",
      },
    ]
  },
];

class RssLinksFetch extends StateNotifier<List<RssSourcesModel>> {
  final IRssRepository repository;

  RssLinksFetch({required this.repository}) : super([]);

  getLinksFavIcons() async {
    List<RssSourcesModel> model =
        rssLinks.map((e) => RssSourcesModel.fromJson(e)).toList();
    final resFutures = model.map((element) async {
      final futures = element.links.map((e) async {
        final rss = await repository.getRss(e.url);
        e = e.copyWith(logo: rss!.logo);
        return e;
      });
      final res = await Future.wait(futures);
      element = element.copyWith(links: res);
      return element;
    });
    final result = await Future.wait(resFutures);
    state = result;
  }
}
