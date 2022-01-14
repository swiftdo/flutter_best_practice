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
            GestureDetector(
              child: Container(
                  color: Colors.blueAccent,
                  width: 200,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: const Text(
                    "RiverPod",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              onTap: () {
                ref.read(gRouteProvider).push(const JokeRoutes());
              },
            ),
            GestureDetector(
              child: Container(
                  width: 200,
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "Scroll",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              onTap: () {
                ref.read(gRouteProvider).push(ScrollRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
