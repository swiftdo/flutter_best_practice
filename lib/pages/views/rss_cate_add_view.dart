import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/model/rss_category.dart';
import 'package:flutter_best_practice/pages/rss_cates_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RssCateAddView extends HookConsumerWidget {
  final RssCategory? cate;
  final TextEditingController _controller;

  RssCateAddView({Key? key, this.cate})
      : _controller = TextEditingController(text: cate?.name),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintText: "分类名",
            ),
          ),
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
                  if (_controller.text.isEmpty) {
                    return;
                  }
                  if (cate != null) {
                    ref
                        .read(rssCatesProvider.notifier)
                        .updateCate(cate!.copy(name: _controller.text));
                  } else {
                    ref
                        .read(rssCatesProvider.notifier)
                        .addCate(_controller.text);
                  }
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
