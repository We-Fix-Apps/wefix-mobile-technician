import 'package:flutter/material.dart';

import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_loading.dart';

class WidgetCardButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color? color;
  final bool? loading;
  const WidgetCardButton({super.key, required this.title, this.onTap, this.color, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: color ?? AppColor.primaryColor)),
        child:
            loading == true
                ? const Row(children: [WidgetLoading(width: 50, top: 5, bottom: 5)])
                : Text(title, style: AppTextStyle.style9.copyWith(color: color ?? AppColor.primaryColor)),
      ),
    );
  }
}
