import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/router/router_key.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/widget/language_button.dart';

class WidgetAppbar {
  static AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const SizedBox(width: 120, child: Image(image: AssetImage(Assets.imageLogin))),
      actions: [
        const LanguageButton(),
        IconButton(
          onPressed: () => context.push(RouterKey.layout + RouterKey.notification),
          icon: SvgPicture.asset(Assets.iconNotifications, color: AppColor.secondColor, width: 25, height: 25),
          // icon: Badge.count(count: 1, child: SvgPicture.asset(Assets.iconNotifications, color: AppColor.secondColor, width: 25, height: 25)),
        ),
      ],
    );
  }
}
