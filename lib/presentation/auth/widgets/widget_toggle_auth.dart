import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../controller/auth_provider.dart';
import '../pages/containers/auth_button.dart';
import '../pages/containers/container_social.dart';

class WidgetToggleAuth extends StatelessWidget {
  const WidgetToggleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (context.watch<AuthProvider>().isRegister == true) ...[const AuthButton(), 10.gap],
          if (context.watch<AuthProvider>().isRegister == false) ...[const ContainerSocial(), 30.gap],
          if (context.watch<AuthProvider>().isRegister == true)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppText(context).backTo, style: AppTextStyle.style14),
                InkWell(
                  onTap: () => context.read<AuthProvider>().toggleAuth(),
                  child: Text(AppText(context).login, style: AppTextStyle.style14B.copyWith(color: AppColor.primaryColor)),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
