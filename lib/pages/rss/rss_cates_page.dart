import 'package:flutter/material.dart';
import 'package:flutter_best_practice/pages/rss/views/appbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RssCatesPage extends HookConsumerWidget {
  const RssCatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarExt.backTitle("分类管理"),
      body: Container(),
    );
  }
}
