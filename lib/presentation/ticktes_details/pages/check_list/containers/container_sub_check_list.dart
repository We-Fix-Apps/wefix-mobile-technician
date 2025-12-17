import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/language_provider/l10n_provider.dart';
import '../../../../../core/unit/app_text_style.dart';
import '../../../controller/ticktes_details_controller.dart';
import '../../../domain/model/maintenances_list_model.dart';
import 'contaoner_sub_sub_checklist.dart';

class ContainerSubChecList extends StatelessWidget {
  final int ticketId;
  final int maintenancesListId;
  final int subMaintenanceId;
  const ContainerSubChecList({super.key, required this.subMaintenanceId, required this.maintenancesListId, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';
    return Consumer<TicktesDetailsController>(
      builder:
          (context, controller, child) => ValueListenableBuilder(
            valueListenable: controller.completionChecklist,
            builder: (context, value, child) {
              SubMaintenance? subMaintenance =
                  value.where((value) => value.id == maintenancesListId).first.subMaintenances?.where((sub) => sub.id == subMaintenanceId).first;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ExpansionTile(
                  dense: true,
                  shape: const RoundedRectangleBorder(side: BorderSide.none),
                  title: Text(lang == 'ar' ? subMaintenance?.nameAr ?? '' : subMaintenance?.name ?? '', style: AppTextStyle.style12B),
                  leading: Checkbox(value: subMaintenance?.isChecked, onChanged: (value) {}, visualDensity: VisualDensity.compact),
                  children: [
                    if (subMaintenance?.subSubMaintenances?.isNotEmpty ?? false)
                      ContainerSubSubCheckList(maintenancesListId: maintenancesListId, subMaintenanceId: subMaintenanceId, lang: lang, ticketId: ticketId),
                  ],
                ),
              );
            },
          ),
    );
  }
}
