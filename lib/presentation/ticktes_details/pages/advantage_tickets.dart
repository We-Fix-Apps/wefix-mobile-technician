import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/providers/language_provider/l10n_provider.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../controller/ticktes_details_controller.dart';

class AdvantageTickets extends StatelessWidget {
  const AdvantageTickets({super.key});

  @override
  Widget build(BuildContext context) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';
    return Consumer<TicktesDetailsController>(
      builder:
          (context, controller, child) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('✅️ ${AppText(context).advantageTickets}', style: AppTextStyle.style14B),
              Divider(color: AppColor.grey.withOpacity(.4), thickness: 1, height: 20),
              8.gap,
              ListView.separated(
                itemCount: controller.ticketsDetails?.advantageTickets?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => 8.gap,
                itemBuilder:
                    (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Text(
                          '${index + 1}- ${lang == 'ar' ? (controller.ticketsDetails?.advantageTickets?[index].name ?? '') : controller.ticketsDetails?.advantageTickets?[index].nameAr ?? ''}',
                          style: AppTextStyle.style12B,
                        ),
                        Text('${controller.ticketsDetails?.advantageTickets?[index].price ?? ''} JOD', style: AppTextStyle.style12B),
                      ],
                    ),
              ),
              10.gap,
            ],
          ),
    );
  }
}
