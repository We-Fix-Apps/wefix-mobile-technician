import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';

import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_text_style.dart';
import '../controller/auth_provider.dart';

class WidgetResendCode extends StatelessWidget {
  final String mobile;
  const WidgetResendCode({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) {
     return InkWell(
      onTap: () async => await context.read<AuthProvider>().resendOTP(mobile),
      child: Text(
        AppText(context).sendtheverificationcodeagain,
        style: AppTextStyle.style14B.copyWith(
          color: Theme.of(context).colorScheme.primary,
          decoration: TextDecoration.underline,
          decorationColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
