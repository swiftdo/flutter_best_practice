import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// 数据为空的页面
class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
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
  final VoidCallback? onReloadTap;
  const ErrorView({Key? key, this.onReloadTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: const Text("发生未知错误"),
          ),
          TextButton(onPressed: onReloadTap, child: const Text("重新加载")),
        ],
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          SpinKitDoubleBounce(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
