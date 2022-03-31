import 'package:flutter/material.dart';
import 'package:flutter_best_practice/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:photo_view/photo_view.dart';

class RssPhotoViewPage extends HookConsumerWidget {
  final String url;

  const RssPhotoViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(
            imageProvider: NetworkImage(url),
          ),
          Positioned(
            right: 10,
            top: MediaQuery.of(context).padding.top + 10,
            child: IconButton(
              icon: const Icon(
                LineIcons.timesCircle,
                color: Colors.white,
              ),
              onPressed: () {
                ref.read(gRouteProvider).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
