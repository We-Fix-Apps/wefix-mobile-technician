import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extension/gap.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/unit/app_color.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../core/widget/widget_loading.dart';
import '../../controller/ticktes_details_controller.dart';
import '../../domain/ticket_enum.dart';

/// B2B-specific description section showing:
/// 1. Ticket Title
/// 2. Problem Description
/// 3. Service Description (only when ticket is NOT completed - it's the service type description)
class ContainnerDescriptionSectionB2B extends StatelessWidget {
  const ContainnerDescriptionSectionB2B({super.key});

  bool _isCompleted(String? status) {
    if (status == null) return false;
    final ticketStatus = status.toLowerCase();
    return ticketStatus == TicketDetailsStatus.completed.name || ticketStatus == 'ended';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TicktesDetailsController>(
      builder: (context, controller, child) {
        return ValueListenableBuilder(
          valueListenable: controller.ticketStatue,
          builder: (context, value, child) {
            if (value == TicketStatus.loading) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('📝 ${AppText(context).ticketTitle}', style: AppTextStyle.style14B),
                  Divider(color: AppColor.grey.withOpacity(.4), thickness: 1, height: 20),
                  const WidgetLoading(width: double.infinity),
                  const WidgetLoading(width: double.infinity, top: 5),
                  20.gap,
                  Text('📝 ${AppText(context).problemDescription}', style: AppTextStyle.style14B),
                  Divider(color: AppColor.grey.withOpacity(.4), thickness: 1, height: 20),
                  const WidgetLoading(width: double.infinity),
                  const WidgetLoading(width: double.infinity, top: 5),
                  20.gap,
                ],
              );
            }

            final hasTitle = controller.ticketsDetails?.title != null && controller.ticketsDetails!.title!.isNotEmpty;
            final hasDescription = controller.ticketsDetails?.description != null && controller.ticketsDetails!.description!.isNotEmpty;
            final isCompleted = _isCompleted(controller.ticketsDetails?.status);
            
            // Service Description: Show only if ticket is NOT completed (it's the service type description)
            // If completed, serviceDescription becomes the completion note (shown at the end)
            final hasServiceDescription = !isCompleted && 
                controller.ticketsDetails?.serviceDescription != null && 
                controller.ticketsDetails!.serviceDescription!.trim().isNotEmpty;

            // Show section only if at least one field has content
            if (!hasTitle && !hasDescription && !hasServiceDescription) {
              return const SizedBox.shrink();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ticket Title Section
                if (hasTitle) ...[
                  Text('📝 ${AppText(context).ticketTitle}', style: AppTextStyle.style14B),
                  Divider(color: AppColor.grey.withOpacity(.4), thickness: 1, height: 20),
                  Text(
                    controller.ticketsDetails!.title!,
                    style: AppTextStyle.style14.copyWith(height: 1.5, color: AppColor.black),
                  ),
                  20.gap,
                ],

                // Problem Description Section
                if (hasDescription) ...[
                  Text('📝 ${AppText(context).problemDescription}', style: AppTextStyle.style14B),
                  Divider(color: AppColor.grey.withOpacity(.4), thickness: 1, height: 20),
                  Text(
                    controller.ticketsDetails!.description!,
                    style: AppTextStyle.style14.copyWith(height: 1.5, color: AppColor.black),
                  ),
                  20.gap,
                ],

                // Service Description Section (only when ticket is NOT completed)
                // When ticket is completed, serviceDescription becomes the completion note (shown at the end)
                if (hasServiceDescription) ...[
                  Text('📝 ${AppText(context).serviceDescription}', style: AppTextStyle.style14B),
                  Divider(color: AppColor.grey.withOpacity(.4), thickness: 1, height: 20),
                  Text(
                    controller.ticketsDetails!.serviceDescription!,
                    style: AppTextStyle.style14.copyWith(height: 1.5, color: AppColor.black),
                  ),
                  20.gap,
                ],
              ],
            );
          },
        );
      },
    );
  }
}
