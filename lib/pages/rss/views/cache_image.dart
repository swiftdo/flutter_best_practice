import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String imageUrl;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;

  const CacheImage(
      {Key? key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit,
      this.margin,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      clipBehavior: borderRadius != null ? Clip.antiAlias : Clip.none,
      decoration: BoxDecoration(borderRadius: borderRadius),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: fit,
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          alignment: Alignment.center,
          color: Colors.grey[100],
          child: const CircularProgressIndicator(
            color: Colors.black54,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          alignment: Alignment.center,
          child: Icon(
            Icons.error,
            color: Colors.black38.withOpacity(0.1),
            size: width != null ? max(16, width! * 0.1) : 20,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}
