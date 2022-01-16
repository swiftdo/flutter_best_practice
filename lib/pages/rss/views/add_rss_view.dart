import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddRssView extends HookConsumerWidget {
  const AddRssView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: <Widget>[
        const TextField(
          decoration: InputDecoration(
              labelText: '将订阅源粘贴到这里',
              contentPadding: EdgeInsets.only(bottom: 10)),
        ),
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "获取",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    );
  }
}
