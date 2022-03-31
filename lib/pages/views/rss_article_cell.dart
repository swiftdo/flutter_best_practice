import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/model/rss_item_model.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import '../../../provider.dart';
import 'cache_image.dart';

class RssArticleCell extends HookConsumerWidget {
  final RssItemModel rssItem;
  final VoidCallback? onTap;

  const RssArticleCell({Key? key, required this.rssItem, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasCover = rssItem.cover != null && rssItem.cover!.isNotEmpty;

    return GestureDetector(
      onTap: () {
        onTap?.call();
        ref.read(gRouteProvider).push(
              RssArticleRoute(
                rssItem: rssItem,
              ),
            );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset.zero,
              ),
            ]),
        child: Column(
          children: [
            if (hasCover)
              CacheImage(
                width: double.infinity,
                height: 160,
                imageUrl: rssItem.cover!,
                fit: BoxFit.cover,
              ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: hasCover ? 10 : 16),
                    child: Text(
                      rssItem.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: rssItem.isRead ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      rssItem.showDesc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CacheImage(
                              margin: const EdgeInsets.only(right: 3),
                              borderRadius: BorderRadius.circular(20),
                              imageUrl: rssItem.rssLogo,
                              width: 16,
                              height: 16,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              rssItem.rssName,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  LineIcons.calendar,
                                  size: 16,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  rssItem.showDate,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
