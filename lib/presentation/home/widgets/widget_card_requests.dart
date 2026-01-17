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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tickets?.ticketTitle ?? tickets?.customer ?? 'N/A',
                            style: AppTextStyle.style12B,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (tickets?.customer != null && tickets?.customer != 'N/A' && tickets?.ticketTitle != null)
                            Text(
                              tickets?.customer ?? '',
                              style: AppTextStyle.style10.copyWith(color: AppColor.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
        subtitle:
            loading == true
                ? const Row(children: [WidgetLoading(width: 50)])
                : Text(
                  _formatTicketDateTime(context, tickets?.date, tickets?.time, tickets?.ticketTimeTo),
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

  String _formatTicketDateTime(BuildContext context, DateTime? date, String? time, String? timeTo) {
    // Format date as dd-MMMM-yyyy (e.g., "17-January-2026")
    // Always use English locale for month names to ensure consistent format
    // This prevents RTL issues in Arabic mode
    final dateFormat = DateFormat("dd-MMMM-yyyy", "en_US");
    final dateStr = date != null 
        ? dateFormat.format(date)
        : dateFormat.format(DateTime.now());
    
    // Format time from ticketTimeFrom (e.g., "14:00:00" -> "14:00")
    String timeStr = '';
    if (time != null && time.isNotEmpty) {
      try {
        // ticketTimeFrom is already in "HH:mm:ss" or "HH:mm" format from backend
        final timeParts = time.split(':');
        if (timeParts.length >= 2) {
          // Take only hours and minutes (HH:mm)
          timeStr = '${timeParts[0]}:${timeParts[1]}';
        } else {
          timeStr = time;
        }
      } catch (e) {
        timeStr = time;
      }
    }
    
    // Format timeTo from ticketTimeTo (e.g., "16:00:00" -> "16:00")
    String timeToStr = '';
    if (timeTo != null && timeTo.isNotEmpty) {
      try {
        // ticketTimeTo is already in "HH:mm:ss" or "HH:mm" format from backend
        final timeToParts = timeTo.split(':');
        if (timeToParts.length >= 2) {
          // Take only hours and minutes (HH:mm)
          timeToStr = '${timeToParts[0]}:${timeToParts[1]}';
        } else {
          timeToStr = timeTo;
        }
      } catch (e) {
        timeToStr = timeTo;
      }
    }
    
    // Combine date and time(s) with LTR mark to prevent RTL reversal in Arabic
    // \u200E is the Left-to-Right Mark (LRM) Unicode character
    String result = '\u200E$dateStr';
    if (timeStr.isNotEmpty) {
      result += ' $timeStr';
      if (timeToStr.isNotEmpty) {
        result += ' - $timeToStr';
      }
    }
    
    return result.trim();
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'pending':
        return AppColor.primaryColor600;
      case 'inprogress':
        return AppColor.blue;
      case 'cancelled':
        return AppColor.red;
      case 'completed':
        return AppColor.green;
      default:
        return AppColor.grey;
    }
  }
}
