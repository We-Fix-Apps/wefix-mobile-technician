import 'package:flutter/material.dart';

import '../extension/gap.dart';
import '../unit/app_text_style.dart';
import 'button/app_button.dart';

class WidgetEmptyScreen extends StatelessWidget {
  final String title;
  final String desc;
  final Widget icon;
  final VoidCallback? onPressed;
  final bool? loading;
  const WidgetEmptyScreen({super.key, required this.title, required this.desc, required this.icon, this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 100, height: 100, child: icon),
          40.gap,
          Text(title, style: AppTextStyle.style16B),
          10.gap,
          Text(desc, style: AppTextStyle.style14.copyWith(color: Colors.grey)),
          if (onPressed != null) ...[10.gap, AppButton.text(text: 'Refresh', loading: loading, onPressed: onPressed)],
        ],
      ),
    );
  }
}
