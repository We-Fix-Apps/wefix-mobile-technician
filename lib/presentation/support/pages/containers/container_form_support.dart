import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extension/gap.dart';
import '../../../../core/mixin/validation_mixin.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../core/widget/widget_phone_field.dart';
import '../../../../core/widget/widget_text_field.dart';
import '../../controller/support_provider.dart';

class ContainerFormSupport extends StatelessWidget with FormValidationMixin {
  ContainerFormSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SupportProvider>(
      builder:
          (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppText(context).userName, style: AppTextStyle.style14B),
              5.gap,
              WidgetTextField(AppText(context).enteryourusername, controller: value.name, validator: (p0) => validateNull(context, p0)),
              5.gap,
              Text(AppText(context).email, style: AppTextStyle.style14B),
              5.gap,
              WidgetTextField(
                'example@example.com',
                keyboardType: TextInputType.emailAddress,
                controller: value.email,
                validator: (p0) => validateEmail(context, p0),
              ),
              5.gap,
              Text(AppText(context).mobile, style: AppTextStyle.style14B),
              5.gap,
              WidgetPhoneField(
                onCountryChanged: (phone) => value.modifyMobileNumber(phone.phoneNumber?.replaceAll(phone.dialCode ?? '', '') ?? '', phone.dialCode ?? ''),
                phoneController: value.phone,
              ),
              5.gap,
              Text(AppText(context).note, style: AppTextStyle.style14B),
              WidgetTextField(AppText(context).enterYourNotes, controller: value.note, maxLines: 4, validator: (p0) => validateNull(context, p0)),
            ],
          ),
    );
  }
}
