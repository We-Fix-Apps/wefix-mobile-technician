import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/providers/language_provider/l10n_provider.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../controller/ticktes_details_controller.dart';

class CustomerServices extends StatelessWidget {
  const CustomerServices({super.key});

  @override
  Widget build(BuildContext context) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';
    return Consumer<TicktesDetailsController>(
      builder:
          (context, controller, child) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('🛠 ${AppText(context).services}', style: AppTextStyle.style14B),
              Divider(color: AppColor.grey.withOpacity(.4), thickness: 1, height: 20),
              8.gap,
              ListView.separated(
                itemCount: controller.ticketsDetails?.serviceTickets?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => 8.gap,
                itemBuilder:
                    (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}- ${lang == 'ar' ? (controller.ticketsDetails?.serviceTickets?[index].nameAr ?? '') : controller.ticketsDetails?.serviceTickets?[index].name ?? ''}',
                          style: AppTextStyle.style12B,
                        ),
                        Text(
                          '${AppText(context).quantity}: X${controller.ticketsDetails?.serviceTickets?[index].quantity ?? '0'}',
                          style: AppTextStyle.style12,
                        ),
                      ],
                    ),
              ),
              10.gap,
            ],
          ),
    );
  }
}
