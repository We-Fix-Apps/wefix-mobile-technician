import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../../core/extension/gap.dart';
import '../../../../core/mixin/validation_mixin.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/unit/app_color.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../core/widget/button/app_button.dart';
import '../../controller/auth_provider.dart';
import '../../domain/auth_enum.dart';
import '../../widgets/widget_resend_code.dart';

class ContainerFormVerifyB2C extends StatefulWidget with FormValidationMixin {
  final String mobile;
  final String? otp;
  ContainerFormVerifyB2C({super.key, required this.mobile, this.otp});

  @override
  State<ContainerFormVerifyB2C> createState() => _ContainerFormVerifyB2CState();
}

class _ContainerFormVerifyB2CState extends State<ContainerFormVerifyB2C> with FormValidationMixin {

  @override
  void initState() {
    super.initState();
    // Do NOT auto-fill OTP for B2C users - they must manually enter it
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Pinput(
            autofocus: true,
            showCursor: true,
            length: 4,
            validator: (value) => validateNull(context, value),
            hapticFeedbackType: HapticFeedbackType.mediumImpact,
            controller: context.read<AuthProvider>().otp,
            // Completely disable autofill and suggestions for B2C
            enableSuggestions: false,
            // Keyboard type for OTP
            keyboardType: TextInputType.number,
            // Disable SMS autofill for B2C - use empty list instead of null to completely disable
            autofillHints: const [],
          ),
        ),
        30.gap,
        Text(AppText(context).donotreceivethecodeyet, style: AppTextStyle.style12.copyWith(color: AppColor.black)),
        10.gap,
        WidgetResendCode(mobile: widget.mobile),
        30.gap,
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ValueListenableBuilder(
                  valueListenable: context.read<AuthProvider>().sendOTPState,
                  builder:
                      (context, value, child) => AppButton.text(
                        text: AppText(context).veirfy,
                        loading: value == SendState.loading,
                        onPressed: () async => await context.read<AuthProvider>().sendOTP(widget.mobile),
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
