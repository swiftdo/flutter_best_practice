import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_item_model.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

/// 文章详情
class RssArticlePage extends HookConsumerWidget {
  final RssItemModel rssItem;
  const RssArticlePage({Key? key, required this.rssItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            ref.read(gRouteProvider).pop();
          },
          icon: const Icon(
            LineIcons.angleLeft,
            color: Colors.black,
          ),
        ),
        title: Text(
          rssItem.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Html(data: rssItem.content),
      ),
    );
  }
}
