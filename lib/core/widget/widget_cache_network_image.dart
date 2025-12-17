import 'package:cached_network_image_plus/flutter_cached_network_image_plus.dart';
import 'package:flutter/material.dart';

class WidgetCachNetworkImage extends StatelessWidget {
  final String image;
  final String? title;
  final BoxFit? boxFit;
  final double? radius;
  final double? width;
  final double? hieght;
  final bool? isOutApp;

  const WidgetCachNetworkImage({super.key, required this.image, this.boxFit, this.radius, this.isOutApp = false, this.title, this.width, this.hieght});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hieght,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius ?? 0)),
      child: CacheNetworkImagePlus(
        imageUrl: image,
        imageBuilder:
            (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 0),
                image: DecorationImage(image: imageProvider, fit: boxFit ?? BoxFit.cover),
              ),
            ),
        errorWidget: const WidgetCachNetworkImage(image: 'https://wefix.oneit.website/favicon.ico'),
      ),
    );
  }
}
