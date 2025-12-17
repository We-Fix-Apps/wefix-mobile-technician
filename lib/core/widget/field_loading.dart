import 'package:flutter/material.dart';

import '../function/app_size.dart';
import '../unit/app_color.dart';
import 'widget_loading.dart';

class FieldLoading extends StatelessWidget {
  const FieldLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize(context).height * 0.055,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), border: Border.all(color: AppColor.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [WidgetLoading(width: AppSize(context).width * 0.3, height: 10), const Spacer(), const Icon(Icons.arrow_drop_down, color: AppColor.white)],
      ),
    );
  }
}
