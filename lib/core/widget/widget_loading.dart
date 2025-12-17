import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetLoading extends StatelessWidget {
  final double? width;
  final double? height;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? radius;

  const WidgetLoading({super.key, this.width, this.height, this.top, this.bottom, this.left, this.right, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius ?? 0)),
      padding: EdgeInsets.only(top: top ?? 0, bottom: bottom ?? 0, left: left ?? 0, right: right ?? 0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 9.0,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
