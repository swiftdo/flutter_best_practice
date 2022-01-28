import 'package:flutter/material.dart';

/// 数据为空的页面
class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: const Text("暂无数据"),
          ),
        ],
      ),
    );
  }
}

/// 数据错误的页面
class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: const Text("发生未知错误"),
          ),
        ],
      ),
    );
  }
}
