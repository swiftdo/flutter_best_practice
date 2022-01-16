import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RssReadPage extends StatelessWidget {
  const RssReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "订阅",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                addRss(context);
              },
              icon: const Icon(
                Icons.add_circle,
                color: Colors.black,
              ))
        ],
      ),
    );
  }

  addRss(BuildContext context) {
    Alert(
        context: context,
        title: "添加订阅",
        content: Column(
          children: const <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: '将订阅源粘贴到这里',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "获取",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
