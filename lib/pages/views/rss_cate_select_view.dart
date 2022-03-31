import 'package:flutter/material.dart';
import 'package:flutter_best_practice/data/model/rss_category.dart';
import 'package:flutter_best_practice/pages/rss_cates_notifier.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RssCateSelectView extends HookConsumerWidget {
  final Function(RssCategory cate) onSelect;

  const RssCateSelectView({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rssCatesProvider);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          ...state.pickerOptionItems.map(
            (e) => Container(
              margin: const EdgeInsets.only(top: 10),
              width: 200,
              height: 40,
              child: OutlinedButton(
                onPressed: () {
                  onSelect.call(e);
                  Navigator.of(context).pop();
                },
                child: Text(e.name),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: 200,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                myRouter.push(const RssCatesRoute());
              },
              child: const Text("分类管理"),
            ),
          ),
        ],
      ),
    );
  }
}
