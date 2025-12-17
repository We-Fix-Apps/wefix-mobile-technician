import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/app_image.dart';
import '../../../../core/extension/gap.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../controller/auth_provider.dart';
import '../../domain/model/contact_info_model.dart';
import '../../widgets/widget_social_button.dart';

class ContainerSocial extends StatelessWidget {
  const ContainerSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppText(context).followAsOnSocialMedia, style: AppTextStyle.style14B),
        10.gap,
        Consumer<AuthProvider>(
          builder:
              (context, controller, child) => ValueListenableBuilder<ContactInfoModel>(
                valueListenable: controller.contractInfo,
                builder:
                    (context, data, child) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WidgetSocialButton(linke: data.languages?.facebook ?? '', icon: Assets.iconFacebook),
                          WidgetSocialButton(linke: data.languages?.instagram ?? '', icon: Assets.iconInstagram),
                          WidgetSocialButton(linke: data.languages?.twitter ?? '', icon: Assets.iconX),
                          WidgetSocialButton(linke: data.languages?.linkedin ?? '', icon: Assets.iconLinkedIn),
                          WidgetSocialButton(linke: data.languages?.youtube ?? '', icon: Assets.iconYoutupe),
                        ],
                      ),
                    ),
              ),
        ),
      ],
    );
  }
}
