import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';

class WidgetCompletionAttchment extends StatelessWidget {
  final String url;
  final Function()? onDelete;

  const WidgetCompletionAttchment({super.key, required this.url, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(blurRadius: 1, blurStyle: BlurStyle.outer, color: Colors.grey, offset: Offset(.3, 0))],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 10,
            children: [
              const Icon(Icons.file_copy, color: Colors.black),
              Expanded(child: Text(url.split('/').last.toString(), maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyle.style14)),
              Row(
                spacing: 5,
                children: [
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(url));
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [BoxShadow(blurRadius: 1, blurStyle: BlurStyle.outer, color: Colors.grey, offset: Offset(.3, 0))],
                      ),
                      child: const Icon(Icons.remove_red_eye_outlined, size: 15, color: AppColor.grey),
                    ),
                  ),
                  InkWell(
                    onTap: onDelete,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [BoxShadow(blurRadius: 1, blurStyle: BlurStyle.outer, color: Colors.grey, offset: Offset(.3, 0))],
                      ),
                      child: const Icon(Icons.delete, size: 15, color: AppColor.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
