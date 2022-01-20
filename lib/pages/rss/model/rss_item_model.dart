import 'package:flutter_best_practice/core/date_util.dart';
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
  final String pubDate; // 发布日期
  final String? category; // 文章分类
  final String? cover; // 文章封面
  final bool isRead; // 是否已读
  final bool isCached; // 是否已缓存

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
  });

  String get showDate {
    String res = pubDate;
    res = (res.contains("GMT")) ? DateUtil.formatGMTTime(res) : "";
    final DateTime? dateTime = DateUtil.getDateTime(res);

    if (dateTime != null) {
      res = (res != "") ? TimelineUtil.formatByDateTime(dateTime) : "";
    }
    return res;
  }

  static RssItemModel fromAtomItem(AtomItem item, int fid, int cateId) {
    return RssItemModel(
      fid: fid,
      cateId: cateId,
      title: item.title ?? '',
      desc: item.summary ?? '',
      link: item.links?.first.href ?? '',
      author: item.authors?.first.name ?? '',
      pubDate: item.published ?? '',
      content: item.content ?? '',
    );
  }

  static RssItemModel fromRssItem(RssItem item, int fid, int cateId) {
    return RssItemModel(
      fid: fid,
      cateId: cateId,
      title: item.title ?? '',
      desc: item.description ?? '',
      link: item.link ?? '',
      author: item.author ?? '',
      pubDate: item.pubDate?.toString() ?? '',
      content: item.content?.value ?? '',
      cover: item.content?.images.first,
    );
  }
}
