// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/extension/gap.dart';
import '../../../core/function/app_size.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_loading.dart';

class WidgetNotificationList extends StatelessWidget {
  final String title;
  final String desc;
  final DateTime date;
  final bool? loading;
  final Function()? onCancel;
  final Function()? onTap;
  final Function(bool?)? onChange;
  const WidgetNotificationList({
    super.key,
    required this.title,
    required this.desc,
    this.onCancel,
    this.onTap,
    this.loading,
    required this.date,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: AppColor.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      loading == true ? const WidgetLoading(width: 100) : Expanded(child: Text(title, style: AppTextStyle.style14B)),
                      10.gap,
                      loading == true
                          ? const WidgetLoading(width: 60)
                          : Text(Jiffy.parseFromDateTime(date).fromNow(), style: AppTextStyle.style12.copyWith(color: AppColor.grey)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  loading == true
                      ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          WidgetLoading(width: AppSize(context).width),
                          5.gap,
                          WidgetLoading(width: AppSize(context).width),
                          5.gap,
                          WidgetLoading(width: AppSize(context).width),
                          5.gap,
                          WidgetLoading(width: AppSize(context).width),
                          5.gap,
                          WidgetLoading(width: AppSize(context).width * 0.8),
                        ],
                      )
                      : Text(desc, style: AppTextStyle.style12.copyWith(color: AppColor.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
