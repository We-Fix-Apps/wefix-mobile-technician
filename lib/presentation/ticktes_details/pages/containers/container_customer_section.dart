import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/app_image.dart';
import '../../../../core/extension/gap.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/router/router_key.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../core/widget/widget_cache_network_image.dart';
import '../../../../core/widget/widget_loading.dart';
import '../../controller/ticktes_details_controller.dart';
import '../../domain/ticket_enum.dart';

class ContainerCustomerSection extends StatelessWidget {
  const ContainerCustomerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TicktesDetailsController>(
      builder:
          (context, controller, child) => ValueListenableBuilder(
            valueListenable: controller.ticketStatue,
            builder: (context, value, child) {
              final ticketStatus = controller.ticketsDetails?.status?.toLowerCase();
              final isCanceled = ticketStatus == TicketDetailsStatus.canceled.name;
              final isCompleted = ticketStatus == TicketDetailsStatus.completed.name;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('👤 ${AppText(context).customerDetails}', style: AppTextStyle.style14B),
                  Divider(color: Colors.grey.withOpacity(.4), thickness: 1, height: 20),
                  Row(
                    children: [
                      value == TicketStatus.loading
                          ? const WidgetLoading(width: 50, height: 50, radius: 100)
                          : WidgetCachNetworkImage(width: 50, hieght: 50, image: controller.ticketsDetails?.customerImage ?? '', radius: 1000),
                      10.gap,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            value == TicketStatus.loading
                                ? const WidgetLoading(width: 80)
                                : Text(controller.ticketsDetails?.customerName ?? '', overflow: TextOverflow.ellipsis, style: AppTextStyle.style14B),
                          ],
                        ),
                      ),
                      if (value != TicketStatus.loading) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (!isCanceled && !isCompleted) ...[
                              InkWell(
                                onTap:
                                    () => context.push(
                                      '${RouterKey.layout + RouterKey.requestDetails + RouterKey.chat}?id=${controller.ticketsDetails?.id}&userId=${controller.ticketsDetails?.userId}',
                                    ),
                                child: SvgPicture.asset(Assets.iconChatRquest),
                              ),
                              10.gap,
                            ],
                            InkWell(onTap: () => context.read<TicktesDetailsController>().launchMap(), child: SvgPicture.asset(Assets.iconGps)),
                            10.gap,
                            InkWell(onTap: () => context.read<TicktesDetailsController>().launchCall(), child: SvgPicture.asset(Assets.iconCall)),
                          ],
                        ),
                      ],
                      10.gap,
                    ],
                  ),
                  20.gap,
                ],
              );
            },
          ),
    );
  }
}
