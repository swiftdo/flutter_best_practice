import 'package:flutter/material.dart';
import 'package:flutter_best_practice/core/toast_util.dart';
import 'package:flutter_best_practice/pages/rss_read_notifier.dart';
import 'package:flutter_best_practice/pages/views/rss_cate_select_view.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'add_rss_notifier.dart';
import 'cache_image.dart';

class AddRssView extends HookConsumerWidget {
  final String? feedUrl;

  const AddRssView({Key? key, this.feedUrl}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addRssProvider(feedUrl));
    final rss = state.rss;

    if (rss != null) {
      return Column(
        children: [
          CacheImage(
            margin: const EdgeInsets.only(top: 20),
            borderRadius: BorderRadius.circular(50),
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            imageUrl: rss.logo,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "URL",
                  style: TextStyle(fontSize: 14),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    rss.url,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.end,
                  ),
                )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "??????",
                  style: TextStyle(fontSize: 14),
                ),
                Expanded(
                  child: Text(
                    rss.name,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
          ),

          /// ???????????????rss ???
          if (rss.id == null)
            GestureDetector(
              onTap: () {
                /// ?????????????????????
                Alert(
                  context: context,
                  title: "???????????????",
                  content: RssCateSelectView(
                    onSelect: (cate) {
                      ref
                          .read(addRssProvider(feedUrl).notifier)
                          .selectCate(cate);
                    },
                  ),
                  buttons: [],
                ).show();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "??????",
                      style: TextStyle(fontSize: 14),
                    ),
                    Row(
                      children: [
                        Text(
                          state.cate.name,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        const Icon(Icons.arrow_right)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "??????",
                  style: TextStyle(fontSize: 14),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    rss.desc,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.end,
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (state.rss?.id == null) {
                // ?????????????????????
                await ref.read(addRssProvider(feedUrl).notifier).addRss(rss);
                await ref.read(rssReadProvider.notifier).addRss(rss);
                myToast.showSuccess("????????????");
              }
              // ?????????????????????
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              decoration: BoxDecoration(
                  color: rss.id == null ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                rss.id == null ? '??????' : '?????????',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      );
    } else {
      if (feedUrl != null) {
        return Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: const SpinKitDoubleBounce(
            color: Colors.grey,
          ),
        );
      }

      return Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: TextField(
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: '???????????????????????????',
                contentPadding: EdgeInsets.only(bottom: 10),
              ),
              keyboardType: TextInputType.url,
              onChanged: (val) {
                ref.read(addRssProvider(feedUrl).notifier).url = val;
              },
            ),
          ),
          const SizedBox(height: 30),
          ProgressButton(
            radius: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            stateWidgets: const {
              ButtonState.idle: Text(
                "??????",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonState.loading: Text(
                "?????????",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonState.fail: Text(
                "??????",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonState.success: Text(
                "??????",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              )
            },
            stateColors: {
              ButtonState.idle: state.url?.trim().isNotEmpty == true
                  ? Colors.black
                  : Colors.grey,
              ButtonState.loading: Colors.black,
              ButtonState.fail: Colors.black,
              ButtonState.success: Colors.black,
            },
            onPressed: () {
              ref.read(addRssProvider(feedUrl).notifier).fetch();
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
