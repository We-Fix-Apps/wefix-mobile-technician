import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/app_image.dart';
import '../unit/app_color.dart';
import '../unit/app_text_style.dart';

class WidgetDilog extends StatelessWidget {
  final bool? isError;
  final bool? isSupport;
  final String title;
  final List<Widget>? contents;
  final String message;
  final String? confirmText;
  final VoidCallback? onConfirm;
  final String cancelText;
  final VoidCallback onCancel;

  const WidgetDilog({
    super.key,
    this.isError = false,
    this.isSupport = false,
    required this.title,
    required this.message,
    this.confirmText,
    this.onConfirm,
    required this.cancelText,
    required this.onCancel,
    this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 300,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSupport == true) SizedBox(width: 80, height: 80, child: SvgPicture.asset(Assets.iconSupportDailog)),
          if (contents == null)
            Icon(isError == true ? Icons.warning_amber_rounded : Icons.check, size: 60, color: isError == true ? AppColor.red : AppColor.green),
          const SizedBox(height: 10),
          Text(title, style: AppTextStyle.style16B),
          const SizedBox(height: 10),
          contents != null
              ? Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: contents!)
              : Text(message, style: AppTextStyle.style14, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: Text(cancelText)),
              const SizedBox(width: 10),
              if (onConfirm != null) ElevatedButton(onPressed: onConfirm, child: Text(confirmText!)),
            ],
          ),
        ],
      ),
    );
  }
}
