import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_item_model.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

/// 文章详情
class RssArticlePage extends HookConsumerWidget {
  final RssItemModel rssItem;
  final controller = ScrollController();

  RssArticlePage({Key? key, required this.rssItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        controller: controller,
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: max(10, MediaQuery.of(context).padding.bottom),
        ),
        child: Html(
          data: rssItem.content,
          onImageTap: (String? url, RenderContext context,
              Map<String, String> attributes, element) {
            if (url != null) {
              ref.read(gRouteProvider).push(RssPhotoViewRoute(url: url));
            }
          },
          onLinkTap: (String? url, RenderContext context,
              Map<String, String> attributes, element) {
            if (url != null) {
              launch(url);
            }
          },
          style: {
            // tables will have the below background color
            "table": Style(
              backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            // some other granular customizations are also possible
            "tr": Style(
              border: const Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: const EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.topLeft,
            ),
            "li": Style(
                fontSize: FontSize.large,
                margin: const EdgeInsets.only(bottom: 10)),
            // text that renders h1 elements will be red
            "h1": Style(color: Colors.red),
            "p": Style(
              fontSize: FontSize.large,
              lineHeight: LineHeight.em(1.25),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
            ),
            "code": Style(
              backgroundColor: const Color(0xfff6f8fa),
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            "pre": Style(
              backgroundColor: const Color(0xfff6f8fa),
              padding: const EdgeInsets.all(10),
              lineHeight: LineHeight.em(1.25),
            ),
          },
        ),
      ),
    );
  }
}
