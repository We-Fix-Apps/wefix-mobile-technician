import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../injection_container.dart';
import '../controller/support_provider.dart';
import '../widgets/send_button.dart';
import 'containers/container_form_support.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<SupportProvider>(),
      builder:
          (context, child) => Form(
            key: context.read<SupportProvider>().formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  5.gap,
                  Text(
                    AppText(context).sendyourinquirytooursupportteamandwellassistyouassoonaspossible,
                    style: AppTextStyle.style14.copyWith(color: AppColor.grey, height: 1.3),
                  ),
                  10.gap,
                  ContainerFormSupport(),
                  30.gap,
                  const SendButton(),
                ],
              ),
            ),
          ),
    );
  }
}
