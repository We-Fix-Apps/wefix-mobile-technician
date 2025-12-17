import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extension/gap.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../core/widget/widget_phone_field.dart';
import '../../controller/auth_provider.dart';

class ContainerFormLogin extends StatelessWidget {
  const ContainerFormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthProvider>().key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppText(context).mobile, style: AppTextStyle.style14B),
          10.gap,
          WidgetPhoneField(onCountryChanged: context.read<AuthProvider>().enterPhoneNumber),
        ],
      ),
    );
  }
}
