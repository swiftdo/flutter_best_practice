import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/model/rss.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:progress_state_button/progress_button.dart';

import 'add_rss_notifier.dart';

class AddRssView extends HookConsumerWidget {
  const AddRssView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addRssProvider);
    final rss = Rss.from(state.res);

    if (rss != null) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.grey),
            margin: const EdgeInsets.only(top: 20),
            child: CachedNetworkImage(
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              imageUrl: rss.logo,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("URL"),
                Text(
                  rss.url,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("名称"),
                Text(
                  rss.name,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("分类"),
                Row(
                  children: const [
                    Text(
                      "无分类",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("简介"),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    rss.desc,
                    style: const TextStyle(color: Colors.black54),
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // 添加到数据库中
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                '订阅',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: 0,
          ),
          TextField(
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: '将订阅源粘贴到这里',
              contentPadding: EdgeInsets.only(bottom: 10),
            ),
            keyboardType: TextInputType.url,
            onChanged: (val) {
              ref.read(addRssProvider.notifier).url = val;
            },
          ),
          const SizedBox(height: 30),
          ProgressButton(
            radius: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            stateWidgets: const {
              ButtonState.idle: Text(
                "获取",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonState.loading: Text(
                "加载中",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonState.fail: Text(
                "失败",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonState.success: Text(
                "成功",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              )
            },
            stateColors: const {
              ButtonState.idle: Colors.black,
              ButtonState.loading: Colors.black,
              ButtonState.fail: Colors.black,
              ButtonState.success: Colors.black,
            },
            onPressed: () {
              ref.read(addRssProvider.notifier).fetch();
            },
            state: state.status.toButtonState(),
          ),
        ],
      );
    }
  }
}

extension AddRssStatusExt on AddRssStatus {
  ButtonState toButtonState() {
    switch (this) {
      case AddRssStatus.ideal:
        return ButtonState.idle;
      case AddRssStatus.loading:
        return ButtonState.loading;
      case AddRssStatus.error:
        return ButtonState.fail;
      case AddRssStatus.finished:
        return ButtonState.success;
    }
  }
}
