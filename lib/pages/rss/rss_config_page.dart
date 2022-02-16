import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/rss_config_notifier.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RssConfigPage extends HookConsumerWidget {
  const RssConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          '设置',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
          ),
        ),
      ),
      body: _buildBody(ref),
    );
  }

  Widget _buildBody(WidgetRef ref) {
    final state = ref.watch(rssConfigProvider);
    return GroupListView(
      itemBuilder: (context, IndexPath index) {
        final item = state.sections[index.section].rows[index.index];
        return GestureDetector(
          onTap: () => item.onTap?.call(ref),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  size: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(item.title),
                ),
              ],
            ),
          ),
        );
      },
      sectionsCount: state.sections.length,
      separatorBuilder: (context, indexPath) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.black.withOpacity(0.05),
          height: 0.5,
        );
      },
      sectionSeparatorBuilder: (context, int sec) {
        return Container(
          margin: const EdgeInsets.only(top: 16),
        );
      },
      groupHeaderBuilder: (context, int sec) {
        return Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            children: [
              Text(
                state.sections[sec].name,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        );
      },
      countOfItemInSection: (int sec) {
        return state.sections[sec].rows.length;
      },
    );
  }
}
