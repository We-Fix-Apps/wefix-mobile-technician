import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extension/gap.dart';
import '../../../../core/mixin/validation_mixin.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/unit/app_color.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../core/widget/widget_phone_field.dart';
import '../../../../core/widget/widget_text_field.dart';
import '../../controller/auth_provider.dart';
import '../../widgets/widget_audio.dart';
import '../../widgets/widget_record.dart';

class ContainerFormRegister extends StatelessWidget with FormValidationMixin {
  ContainerFormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthProvider>().keyRegister,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppText(context).userName, style: AppTextStyle.style14B),
          5.gap,
          WidgetTextField(AppText(context).enteryourusername, controller: context.read<AuthProvider>().name, validator: (p0) => validateNull(context, p0)),
          5.gap,
          Text(AppText(context).email, style: AppTextStyle.style14B),
          5.gap,
          WidgetTextField(
            'example@example.com',
            controller: context.read<AuthProvider>().email,
            keyboardType: TextInputType.emailAddress,
            validator: (p0) => validateEmail(context, p0),
          ),
          5.gap,
          Text(AppText(context).mobile, style: AppTextStyle.style14B),
          5.gap,
          WidgetPhoneField(
            onCountryChanged:
                (phone) => context.read<AuthProvider>().modifyMobileNumber(phone.phoneNumber?.replaceAll(phone.dialCode ?? '', '') ?? '', phone.dialCode ?? ''),
            phoneController: context.read<AuthProvider>().mobile,
          ),
          5.gap,
          Text(AppText(context).address, style: AppTextStyle.style14B),
          5.gap,
          WidgetTextField(AppText(context).enteryourAddress, controller: context.read<AuthProvider>().address, validator: (p0) => validateNull(context, p0)),
          5.gap,
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppText(context).profession, style: AppTextStyle.style14B),
                    5.gap,
                    WidgetTextField(
                      AppText(context).enteryourprofession,
                      controller: context.read<AuthProvider>().profession,
                      validator: (p0) => validateNull(context, p0),
                    ),
                  ],
                ),
              ),
              5.gap,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppText(context).age, style: AppTextStyle.style14B),
                    5.gap,
                    WidgetTextField(
                      AppText(context).enteryourAge,
                      controller: context.read<AuthProvider>().age,
                      keyboardType: TextInputType.number,
                      validator: (p0) => validateNull(context, p0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          5.gap,
          Text(AppText(context).attachCV, style: AppTextStyle.style14B),
          5.gap,
          WidgetTextField(
            AppText(context).selectYourCV,
            validator: (p0) => validateNull(context, p0),
            controller: context.read<AuthProvider>().cv,
            readOnly: true,
            suffixIcon:
                context.read<AuthProvider>().cv.text.isNotEmpty
                    ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => context.read<AuthProvider>().launchSocial(context.read<AuthProvider>().cv.text),
                          child: Icon(Icons.visibility_sharp, color: AppColor.primaryColor),
                        ),
                        5.gap,
                        InkWell(onTap: () => context.read<AuthProvider>().changeCV(), child: Icon(Icons.clear, color: AppColor.primaryColor)),
                        5.gap,
                      ],
                    )
                    : Icon(Icons.attach_file_outlined, color: AppColor.primaryColor),
            onTap: () => context.read<AuthProvider>().pickFile(),
          ),
          5.gap,
          Text(AppText(context).introduceyourself, style: AppTextStyle.style14B),
          5.gap,
          context.read<AuthProvider>().audioRecord['stop'] == true ? const WidgetAudio() : const WidgetRecord(),
          5.gap,
          WidgetTextField(
            AppText(context).talkaboutyourself,
            controller: context.read<AuthProvider>().intro,
            maxLines: 4,
            validator: (p0) => validateNull(context, p0),
          ),
        ],
      ),
    );
  }
}
