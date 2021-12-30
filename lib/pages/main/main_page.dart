import 'package:flutter/material.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:flutter_best_practice/router/route.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  late AutoScrollController controller;

  @override
  void initState() {
    controller = AutoScrollController(
        viewportBoundaryGetter: () => const Rect.fromLTRB(0, 0, 0, 0),
        axis: Axis.horizontal);
    super.initState();
  }

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HookConsumer(builder: (context, ref, child) {
              return GestureDetector(
                child: Container(
                    color: Colors.blueAccent,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 100),
                    child: const Text(
                      "RiverPod",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                onTap: () {
                  ref.read(gRouteProvider).push(const JokeRoutes());
                },
              );
            }),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
