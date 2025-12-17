import 'package:flutter/material.dart';

import '../../../core/unit/app_color.dart';
import '../../../core/widget/widget_cache_network_image.dart';

class WidhetEditImageProfile extends StatelessWidget {
  final String imageUrl;
  const WidhetEditImageProfile({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 120,
            height: 120,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: AppColor.grey)),
            child: CircleAvatar(radius: 50, backgroundColor: Colors.white, child: WidgetCachNetworkImage(image: imageUrl)),
          ),
        ],
      ),
    );
  }
}
