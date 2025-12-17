import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/extension/gap.dart';
import '../../../core/providers/language_provider/l10n_provider.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../domain/model/maintenances_list_model.dart';

class WidgetHeaderCheckList extends StatelessWidget {
  const WidgetHeaderCheckList({super.key, required this.maintenancesList});

  final MaintenancesList maintenancesList;

  @override
  Widget build(BuildContext context) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';

    return Row(
      children: [
        SvgPicture.asset(Assets.iconTickets, width: 90, height: 90),
        10.gap,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang == 'ar' ? maintenancesList.nameAr ?? '' : maintenancesList.name ?? '',
                style: AppTextStyle.style20B.copyWith(color: AppColor.primaryColor),
              ),
              5.gap,
              Text(
                maintenancesList.description ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.style14B.copyWith(color: AppColor.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
