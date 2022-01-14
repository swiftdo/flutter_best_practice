import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ScrollPage extends HookConsumerWidget {
  ScrollPage({
    Key? key,
  }) : super(key: key);

  final AutoScrollController controller = AutoScrollController(
      viewportBoundaryGetter: () => const Rect.fromLTRB(0, 0, 0, 0),
      axis: Axis.horizontal);
  final List<String> tags = [
    '测试1',
    '测试2',
    '测试3',
    '测试4',
    '测试5',
    '测试6',
    '测试7',
    '测试8',
    '测试9',
    '测试10',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scroll"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: tags
                  .map((e) => GestureDetector(
                        onTap: () async {
                          await controller.scrollToIndex(tags.indexOf(e),
                              preferPosition: AutoScrollPosition.middle);
                          controller.highlight(tags.indexOf(e));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: AutoScrollTag(
                            key: ValueKey(e),
                            controller: controller,
                            child: Text(
                              e,
                              style: const TextStyle(color: Colors.white),
                            ),
                            index: tags.indexOf(e),
                            highlightColor: Colors.blue,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          margin: const EdgeInsets.only(right: 10),
                        ),
                      ))
                  .toList(),
            ),
            height: 50,
          )
        ],
      ),
    );
  }
}
