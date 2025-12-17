import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/extension/gap.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../controller/auth_provider.dart';

class WidgetAudio extends StatelessWidget {
  const WidgetAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: AppColor.primaryColor)),
      child: Row(
        children: [
          SvgPicture.asset(Assets.iconRecord, width: 25),
          5.gap,
          Expanded(child: Text('${context.read<AuthProvider>().audioRecord['path']}', style: AppTextStyle.style12B)),
          5.gap,
          InkWell(onTap: () => context.read<AuthProvider>().clearAudioRecord(), child: const Icon(Icons.clear, color: AppColor.red)),
        ],
      ),
    );
  }
}
