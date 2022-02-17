import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/model/rss_category.dart';
import 'package:flutter_best_practice/pages/rss/views/appbar.dart';
import 'package:flutter_best_practice/pages/rss/views/page_common_views.dart';
import 'package:flutter_best_practice/pages/rss/views/rss_cate_add_view.dart';
import 'package:flutter_best_practice/pages/rss/views/rss_cate_delete_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'rss_cates_notifier.dart';

class RssCatesPage extends HookConsumerWidget {
  const RssCatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rssCatesProvider);

    return Scaffold(
      appBar: AppBarExt.backTitle("分类管理", actions: [
        IconButton(
          onPressed: () {
            Alert(
              context: context,
              title: "添加分类",
              content: RssCateAddView(),
              buttons: [],
            ).show();
          },
          icon: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        )
      ]),
      body: _buildList(state, ref),
    );
  }

  Widget _buildList(RssCateState state, WidgetRef ref) {
    if (state.items.isEmpty) {
      return const EmptyView();
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 16, bottom: 20, left: 16, right: 16),
      itemBuilder: (context, index) {
        bool isLast = index == state.items.length - 1;
        final cate = state.items[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: isLast
                ? null
                : Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  cate.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    iconSize: 18,
                    splashRadius: 16,
                    onPressed: () {
                      Alert(
                        context: context,
                        title: "修改分类",
                        content: RssCateAddView(cate: cate),
                        buttons: [],
                      ).show();
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      Alert(
                        context: context,
                        title: "删除分类",
                        content: RssCateDeleteView(cate: cate),
                        buttons: [],
                      ).show();
                    },
                    icon: const Icon(Icons.delete),
                    iconSize: 18,
                    splashRadius: 16,
                  ),
                ],
              )
            ],
          ),
        );
      },
      itemCount: state.items.length,
    );
  }
}
