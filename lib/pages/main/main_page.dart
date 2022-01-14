import 'package:flutter/material.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _cell("Jokes", onTap: () {
              ref.read(gRouteProvider).push(const JokeRoutes());
            }),
            _cell("Scroll", onTap: () {
              ref.read(gRouteProvider).push(ScrollRoute());
            }),
            _cell("Rss", onTap: () {
              ref.read(gRouteProvider).push(const RssRoute());
            })
          ],
        ),
      ),
    );
  }

  _cell(String title, {VoidCallback? onTap}) {
    return GestureDetector(
      child: Container(
          width: 200,
          color: Colors.blueAccent,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          )),
      onTap: onTap,
    );
  }
}
