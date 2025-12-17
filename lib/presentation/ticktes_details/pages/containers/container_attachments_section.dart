import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/app_image.dart';
import '../../../../core/extension/gap.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/unit/app_color.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../controller/ticktes_details_controller.dart';
import '../../domain/ticket_enum.dart';

class ContainerAttachmentsSection extends StatelessWidget {
  const ContainerAttachmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('📷 ${AppText(context).attachments}', style: AppTextStyle.style14B),
            ValueListenableBuilder(
              valueListenable: context.read<TicktesDetailsController>().ticketStatue,
              builder: (context, value, child) {
                if (value == TicketStatus.success) {
                  return InkWell(
                    onTap: () => context.read<TicktesDetailsController>().showAttachmant(context),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: AppColor.primaryColor, width: 1)),
                      child: SvgPicture.asset(Assets.iconAttachmant),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
        Divider(color: AppColor.grey.withOpacity(.4), thickness: 1, height: 20),
        10.gap,
      ],
    );
  }
}
