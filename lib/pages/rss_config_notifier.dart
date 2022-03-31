import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigSection {
  final String name;
  final List<ConfigRow> rows;

  ConfigSection({required this.rows, required this.name});
}

class ConfigRow {
  final IconData icon;
  final String title;
  final Function(WidgetRef ref)? onTap;

  ConfigRow({required this.icon, required this.title, this.onTap});
}

class RssConfigState {
  final List<ConfigSection> sections;

  RssConfigState.initial(this.sections);
}

class RssConfigNotifier extends StateNotifier<RssConfigState> {
  RssConfigNotifier()
      : super(RssConfigState.initial([
          ConfigSection(name: "应用管理", rows: [
            ConfigRow(
              icon: Icons.folder,
              title: "分类管理",
              onTap: (ref) {
                myRouter.push(const RssCatesRoute());
              },
            ),
            ConfigRow(icon: Icons.favorite, title: "我的收藏"),
            ConfigRow(icon: Icons.history, title: "浏览历史"),
          ]),
          ConfigSection(name: "支持我们", rows: [
            ConfigRow(icon: Icons.comment, title: "评价我们"),
            ConfigRow(icon: Icons.share, title: "分享给朋友"),
          ]),
        ]));
}

final rssConfigProvider =
    StateNotifierProvider<RssConfigNotifier, RssConfigState>((ref) {
  return RssConfigNotifier();
});
