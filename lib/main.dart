import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  late AutoScrollController controller;

  @override
  void initState() {
    controller = AutoScrollController(
        viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, 0),
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
