import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/language_provider/l10n_provider.dart';
import '../../../core/router/router_key.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_cache_network_image.dart';
import '../../../core/widget/widget_loading.dart';
import '../../ticktes_details/domain/ticket_enum.dart';
import '../domain/model/home_model.dart';
import 'widget_card_button.dart';

class WidgetCardRequests extends StatelessWidget {
  final Tickets? tickets;
  final bool? isHistory;
  final bool? loading;

  const WidgetCardRequests({super.key, this.isHistory = false, this.tickets, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade300)),
      child: ListTile(
        onTap: loading == true ? null : () => context.push('${RouterKey.layout + RouterKey.requestDetails}?id=${tickets?.id}'),
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        leading:
            loading == true
                ? const WidgetLoading(width: 50, height: 50, radius: 1000)
                : WidgetCachNetworkImage(width: 50, hieght: 50, image: tickets?.image ?? '', radius: 1000),
        title:
            loading == true
                ? const Row(children: [WidgetLoading(width: 150)])
                : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(color: _statusColor(tickets?.status?.toLowerCase() ?? 'pending'), borderRadius: BorderRadius.circular(100)),
                    ),
                    5.gap,
                    Expanded(child: Text(tickets?.customer ?? '', style: AppTextStyle.style12B)),
                  ],
                ),
        subtitle:
            loading == true
                ? const Row(children: [WidgetLoading(width: 50)])
                : Text(
                  '${DateFormat("MMM, d yyyy").format(tickets?.date ?? DateTime.now())} ${DateFormat("HH:mm").format(DateTime.tryParse(tickets?.time ?? '') ?? DateTime.now())}',
                  style: AppTextStyle.style11,
                ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isHistory == false) ...[
              WidgetCardButton(
                loading: loading,
                title:
                    '${(context.read<LanguageProvider>().lang == 'ar' ? tickets?.ticketTypeAr ?? '' : tickets?.ticketType ?? '').toUpperCase()}  ${TicketDetailsType.emergency.name == tickets?.ticketType ? '🚨' : ''}',
              ),
              10.gap,
            ],
            const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'pending':
        return AppColor.primaryColor600;
      case 'inprogress':
        return AppColor.blue;
      case 'canceled':
        return AppColor.red;
      case 'completed':
        return AppColor.green;
      default:
        return AppColor.grey;
    }
  }
}
