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
  final String feedUrl;

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
  });
}
