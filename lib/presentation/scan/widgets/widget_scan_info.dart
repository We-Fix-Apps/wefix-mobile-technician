import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_text_style.dart';

class WidgetScanInfo extends StatelessWidget {
  const WidgetScanInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SvgPicture.asset(Assets.iconScan, width: 25, height: 25), 10.gap, Text(AppText(context).scanQRCode, style: AppTextStyle.style16B)],
            ),
            20.gap,
            Text(AppText(context).scanningaQRcodetoretrievefullcarinformation, textAlign: TextAlign.center, style: AppTextStyle.style14),
          ],
        ),
      ),
    );
  }
}
