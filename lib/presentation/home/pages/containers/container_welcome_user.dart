import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../core/constant/app_image.dart';
import '../../../../core/extension/gap.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../core/unit/app_color.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../injection_container.dart';
import '../../../auth/domain/model/user_model.dart';

class ContainerWelcomeUser extends StatelessWidget {
  const ContainerWelcomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.iconEditProfile),
            5.gap,
            Text(AppText(context).welcome, textAlign: TextAlign.center, style: AppTextStyle.style12),
            3.gap,
            ValueListenableBuilder(
              valueListenable: sl<Box<User>>().listenable(),
              builder: (context, value, child) {
                User? user = value.get(BoxKeys.userData);
                return Text(user?.name ?? '', textAlign: TextAlign.center, style: AppTextStyle.style12B);
              },
            ),
          ],
        ),
        5.gap,
        Row(
          children: [
            SvgPicture.asset(Assets.iconDate),
            5.gap,
            Text(DateFormat("MMM, d yyyy").format(DateTime.now()), style: AppTextStyle.style12B.copyWith(color: AppColor.primaryColor)),
          ],
        ),
      ],
    );
  }
}
