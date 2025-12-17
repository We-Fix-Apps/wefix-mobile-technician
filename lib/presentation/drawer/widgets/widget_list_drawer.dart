import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/extension/gap.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';

class WidgetListDrawer extends StatelessWidget {
  final String title;
  final String icon;
  final Color? iconColor;
  final bool? haveIconArrow;
  final Function()? onTap;
  const WidgetListDrawer({this.iconColor, super.key, required this.title, required this.icon, this.onTap, this.haveIconArrow = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 25, height: 25, color: iconColor),
            10.gap,
            Text(title, style: AppTextStyle.style14.copyWith(color: AppColor.black)),
            const Spacer(),
            if (haveIconArrow == true) const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
