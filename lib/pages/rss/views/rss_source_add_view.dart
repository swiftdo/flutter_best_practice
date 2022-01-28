import 'package:flutter/material.dart';
import 'package:flutter_best_practice/data/model/rss_source_model.dart';
import 'package:flutter_best_practice/pages/rss/rss_read_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'add_rss_view.dart';

class RssSourceAddView extends HookConsumerWidget {
  final RssSourceModel item;

  const RssSourceAddView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdd = ref.watch(rssReadProvider.select(
        (value) => value.items.map((e) => e.feedUrl).contains(item.url)));

    if (isAdd) {
      return const Icon(
        LineIcons.check,
        color: Colors.grey,
        size: 20,
      );
    } else {
      return GestureDetector(
        onTap: () {
          /// 添加 rss
          Alert(
            context: context,
            title: "添加订阅",
            content: AddRssView(
              feedUrl: item.url,
            ),
            buttons: [],
          ).show();
        },
        child: const Icon(LineIcons.plus),
      );
    }
  }
}
