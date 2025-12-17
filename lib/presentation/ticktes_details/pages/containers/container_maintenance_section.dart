import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';

import '../../../../core/extension/gap.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/providers/language_provider/l10n_provider.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../controller/ticktes_details_controller.dart';
import '../../domain/ticket_enum.dart';
import '../../widgets/widget_record_mainten_scestion.dart';

class ContainerMaintenanceSection extends StatelessWidget {
  const ContainerMaintenanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('🔧 ${AppText(context).maintenanceTicketDetails}', style: AppTextStyle.style14B),
        Divider(color: Colors.grey.withOpacity(.4), thickness: 1, height: 20),
        10.gap,
        Consumer<TicktesDetailsController>(
          builder: (context, controller, child) {
            return ValueListenableBuilder(
              valueListenable: controller.ticketStatue,
              builder:
                  (context, value, child) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetRecordMaintenSection(
                        title: AppText(context).title,
                        loading: value == TicketStatus.loading,
                        value:
                            controller.ticketsDetails?.type == TicketDetailsType.preventive.name
                                ? lang == 'ar'
                                    ? controller.ticketsDetails?.typeAr ?? ''
                                    : controller.ticketsDetails?.type ?? ''
                                : lang == 'ar'
                                ? controller.ticketsDetails?.titleAr ?? ''
                                : controller.ticketsDetails?.title ?? '',
                        title2: AppText(context).status,
                        value2: lang == 'ar' ? controller.ticketsDetails?.status ?? '' : controller.ticketsDetails?.status ?? '',
                      ),
                      20.gap,
                      WidgetRecordMaintenSection(
                        title: AppText(context).type,
                        value:
                            '${lang == 'ar' ? controller.ticketsDetails?.typeAr ?? '' : controller.ticketsDetails?.type ?? ''}  ${TicketDetailsType.emergency.name == controller.ticketsDetails?.type ? '🚨' : ''}',
                        loading: value == TicketStatus.loading,
                        title2: AppText(context).date,
                        value2:
                            '${DateFormat("MMM, d yyyy").format(controller.ticketsDetails?.date ?? DateTime.now())} ${DateFormat("HH:mm").format(DateTime.tryParse(controller.ticketsDetails?.time ?? '') ?? DateTime.now())}  ',
                      ),
                      20.gap,
                    ],
                  ),
            );
          },
        ),
      ],
    );
  }
}
