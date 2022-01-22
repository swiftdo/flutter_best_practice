import 'package:flutter_best_practice/core/date_util.dart';
import 'package:flutter_best_practice/core/string_util.dart';
import 'package:flutter_best_practice/core/timeline_util.dart';
import 'package:webfeed/domain/atom_item.dart';
import 'package:webfeed/domain/rss_item.dart';

class RssItemModel {
  final int? id; // 文章id
  final int fid; // rss id
  final int cateId; // rss 分类id
  final String title; // 文章标题
  final String desc; // 文章简介
  final String content; // 文章内容
  final String link; // 文章链接
  final String author; // 作者
  final int pubDate; // 发布日期
  final String? category; // 文章分类
  final String? cover; // 文章封面
  final bool isRead; // 是否已读
  final bool isCached; // 是否已缓存
  final String showDesc; // 去除标签的desc

  String? rssLogo; // 详情页要用

  RssItemModel({
    this.id,
    required this.fid,
    required this.cateId,
    required this.title,
    required this.desc,
    required this.link,
    required this.author,
    required this.pubDate,
    required this.content,
    this.category,
    this.cover,
    this.isRead = false,
    this.isCached = false,
  }) : showDesc = StringUtil.stripHtmlIfNeeded(desc);

  String get showDate {
    final DateTime? dateTime = DateUtil.getDateTimeByMs(pubDate);
    return TimelineUtil.formatByDateTime(dateTime!);
  }

  static int getPublishDateFrom(String? dateStr) {
    if (dateStr == null) {
      return 0;
    }
    final DateTime? dateTime = DateUtil.getDateTime(dateStr);
    return dateTime?.millisecondsSinceEpoch ?? 0;
  }

  static RssItemModel fromAtomItem(AtomItem item, int fid, int cateId) {
    final title = item.title ?? '';
    final desc = item.summary ?? title;
    final content = item.content ?? desc;
    return RssItemModel(
      fid: fid,
      cateId: cateId,
      title: title,
      desc: desc,
      link: item.links?.first.href ?? '',
      author: item.authors?.first.name ?? '',
      pubDate: getPublishDateFrom(item.published),
      content: content,
    );
  }

  static RssItemModel fromRssItem(RssItem item, int fid, int cateId) {
    String? author = item.author;
    author ??= item.dc?.creator;

    String title = item.title ?? '';
    String desc = item.description ?? title;
    String content = item.content?.value ?? desc;

    String? pubDate;
    if (item.pubDate != null) {
      pubDate = DateUtil.formatDate(item.pubDate!);
    }

    return RssItemModel(
      fid: fid,
      cateId: cateId,
      title: title,
      desc: desc,
      link: item.link ?? '',
      author: author ?? '',
      pubDate: getPublishDateFrom(pubDate),
      content: content,
      cover: item.content?.images.first,
    );
  }
}
