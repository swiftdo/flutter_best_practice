import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/model/rss_category.dart';
import 'package:flutter_best_practice/pages/rss_cates_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RssCateDeleteView extends HookConsumerWidget {
  final RssCategory cate;

  const RssCateDeleteView({Key? key, required this.cate}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Text("删除该分类，该分类下所有订阅源将回到无分类状态"),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                  foregroundColor: MaterialStateProperty.all(Colors.grey),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text("确定"),
                onPressed: () {
                  ref.read(rssCatesProvider.notifier).deleteCate(cate, ref);
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
