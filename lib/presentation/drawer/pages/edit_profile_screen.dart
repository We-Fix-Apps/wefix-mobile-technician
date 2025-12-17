import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/extension/gap.dart';
import '../../../core/mixin/validation_mixin.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/services/hive_services/box_kes.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/language_button.dart';
import '../../../core/widget/widget_phone_field.dart';
import '../../../core/widget/widget_text_field.dart';
import '../../../injection_container.dart';
import '../../auth/domain/model/user_model.dart';
import '../../home/widgets/widget_rating.dart';
import '../widgets/widget_edit_image_profile.dart';

class EditProfileScreen extends StatelessWidget with FormValidationMixin {
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppText(context).profile, style: AppTextStyle.style16B), actions: const [LanguageButton()], centerTitle: true),
      body: ValueListenableBuilder(
        valueListenable: sl<Box<User>>().listenable(),
        builder: (context, value, child) {
          User? user = value.get(BoxKeys.userData);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidhetEditImageProfile(imageUrl: user?.image ?? ''),
                10.gap,
                Center(
                  child: Column(
                    children: [
                      Text('#${user?.id}', style: AppTextStyle.style14B.copyWith(color: AppColor.primaryColor)),
                      WidgetRating(rating: double.tryParse(user?.rating ?? '0') ?? 0.0),
                      Text(Jiffy.parseFromDateTime(user?.createdDate ?? DateTime.now()).MMMMEEEEd, style: AppTextStyle.style14B),
                    ],
                  ),
                ),
                5.gap,
                Text(AppText(context).userName, style: AppTextStyle.style14B),
                5.gap,
                WidgetTextField(
                  AppText(context).enteryourusername,
                  controller: TextEditingController(text: user?.name),
                  readOnly: true,
                  validator: (p0) => validateNull(context, p0),
                ),
                5.gap,
                Text(AppText(context).email, style: AppTextStyle.style14B),
                5.gap,
                WidgetTextField(
                  'example@example.com',
                  controller: TextEditingController(text: user?.email),
                  readOnly: true,
                  keyboardType: TextInputType.emailAddress,
                  validator: (p0) => validateEmail(context, p0),
                ),
                5.gap,
                Text(AppText(context).mobile, style: AppTextStyle.style14B),
                5.gap,
                WidgetPhoneField(phoneController: TextEditingController(text: user?.mobile?.replaceAll('+962', ''))),
                5.gap,
                Text(AppText(context).address, style: AppTextStyle.style14B),
                5.gap,
                WidgetTextField(
                  AppText(context).enteryourAddress,
                  controller: TextEditingController(text: user?.address),
                  readOnly: true,
                  validator: (p0) => validateNull(context, p0),
                ),
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
                            controller: TextEditingController(text: user?.profession),
                            readOnly: true,
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
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            controller: TextEditingController(text: user?.age),
                            validator: (p0) => validateNull(context, p0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                5.gap,
                Text(AppText(context).aboutMe, style: AppTextStyle.style14B),
                5.gap,
                WidgetTextField(
                  AppText(context).talkaboutyourself,
                  readOnly: true,
                  controller: TextEditingController(text: user?.introduce),
                  maxLines: 4,
                  validator: (p0) => validateNull(context, p0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
