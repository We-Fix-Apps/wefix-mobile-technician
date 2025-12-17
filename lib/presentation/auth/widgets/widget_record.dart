import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_color.dart' show AppColor;
import '../../../core/unit/app_text_style.dart';
import '../controller/auth_provider.dart';

class WidgetRecord extends StatelessWidget {
  const WidgetRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, _) {
        return InkWell(
          onTap: () {
            if (provider.isRecording) {
              provider.stopRecording();
            } else {
              provider.startRecording();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: AppColor.primaryColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                provider.isRecording
                    ? Row(
                      children: [
                        const Icon(Icons.mic, color: AppColor.red),
                        5.gap,
                        Text('${AppText(context).recorfing}${_formatDuration(provider.duration)}', style: AppTextStyle.style12.copyWith(color: AppColor.red)),
                      ],
                    )
                    : Text(AppText(context).pleaseintroduceyourselfasVoice, style: AppTextStyle.style12.copyWith(color: AppColor.grey)),
                5.gap,
                Icon(provider.isRecording ? Icons.stop : Icons.mic, color: AppColor.primaryColor),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }
}
