import 'dart:math';

import 'package:flutter/material.dart';
import 'model/rss_item_model.dart';
import 'views/appbar.dart';
import 'views/cache_image.dart';
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
      appBar: AppBarExt.backTitle("文章详情"),
      body: SingleChildScrollView(
        controller: controller,
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: max(10, MediaQuery.of(context).padding.bottom),
        ),
        child: Html(
          data: r"<arhead></arhead>" + rssItem.content,
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
          customRender: {
            "arhead": (RenderContext context, Widget child) {
              return _buildTitle();
            }
          },
          tagsList: Html.tags..addAll(["arhead"]),
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
                fontSize: FontSize.larger,
                margin: const EdgeInsets.only(bottom: 10)),
            // text that renders h1 elements will be red
            "h1": Style(color: Colors.red),
            "p": Style(
              fontSize: FontSize.larger,
              lineHeight: LineHeight.em(1.45),
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

  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              rssItem.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                children: [
                  CacheImage(
                    imageUrl: rssItem.rssLogo,
                    width: 16,
                    height: 16,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                      child: Text(
                    rssItem.author,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )),
                ],
              )),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        LineIcons.calendar,
                        size: 16,
                      ),
                      Text(
                        rssItem.showDate,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      launch(rssItem.link);
                    },
                    child: const Text(
                      "阅读原文",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
