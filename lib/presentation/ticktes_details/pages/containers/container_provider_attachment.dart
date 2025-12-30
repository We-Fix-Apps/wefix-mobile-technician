import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extension/gap.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/unit/app_color.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../controller/ticktes_details_controller.dart';
import '../../domain/ticket_enum.dart';
import '../../widgets/widget_attchmants.dart';

class ContainerProviderAttachment extends StatelessWidget {
  final String id;
  const ContainerProviderAttachment({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Consumer<TicktesDetailsController>(
      builder:
          (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('📷 ${AppText(context).technicianAttachment}', style: AppTextStyle.style14B),
                  InkWell(
                    onTap: () => value.selectMethodForImage(isAdd: true, ticketId: id),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: AppColor.primaryColor, width: 1)),
                      child: Icon(Icons.add, color: AppColor.primaryColor, size: 20),
                    ),
                  ),
                ],
              ),
              Divider(color: AppColor.grey.withOpacity(.4), thickness: 1, height: 20),
              10.gap,
              ValueListenableBuilder(
                valueListenable: value.ticketStatue,
                builder: (context, status, child) {
                  final technicianAttachments = value.ticketsDetails?.technicianAttachments ?? [];
                  
                  if (status == TicketStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  
                  if (technicianAttachments.isEmpty) {
                    return Text(
                      AppText(context).emptyAttachments,
                      style: AppTextStyle.style14B.copyWith(color: AppColor.grey),
                    );
                  }
                  
                  return ListView.separated(
                    itemCount: technicianAttachments.length,
                    separatorBuilder: (context, index) => 10.gap,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => WidgetAttachmants(
                      url: technicianAttachments[index].filePath ?? '',
                    ),
                  );
                },
              ),
              10.gap,
            ],
          ),
    );
  }
}
