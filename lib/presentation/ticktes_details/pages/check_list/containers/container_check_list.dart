import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/language_provider/l10n_provider.dart';
import '../../../controller/ticktes_details_controller.dart';
import '../../../domain/model/maintenances_list_model.dart';
import '../../../widgets/widget_title_expansion.dart';
import 'container_sub_check_list.dart';

class ContainerChecList extends StatelessWidget {
  final int ticketId;
  final int maintenancesListId;
  const ContainerChecList({super.key, required this.maintenancesListId, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';

    return Consumer<TicktesDetailsController>(
      builder:
          (context, controller, child) => ValueListenableBuilder(
            valueListenable: controller.completionChecklist,
            builder: (context, value, child) {
              MaintenancesList maintenancesList = value.where((value) => value.id == maintenancesListId).first;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ExpansionTile(
                  dense: true,
                  title: WidgetTitleExpansion(
                    icon: maintenancesList.icon ?? '',
                    ticketId: ticketId,
                    mainId: maintenancesList.id ?? 0,
                    maintenancesList: maintenancesList,
                    title:
                        maintenancesList.nameRoom != null && maintenancesList.nameRoom != ''
                            ? maintenancesList.nameRoom ?? ''
                            : lang == 'ar'
                            ? maintenancesList.nameAr ?? ''
                            : maintenancesList.name ?? '',
                  ),
                  leading: Checkbox(value: maintenancesList.isChecked, onChanged: (value) {}, visualDensity: VisualDensity.compact),
                  shape: const RoundedRectangleBorder(side: BorderSide.none),
                  children: [
                    if (maintenancesList.subMaintenances?.isNotEmpty ?? false)
                      ListView.separated(
                        itemCount: maintenancesList.subMaintenances!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder:
                            (context, index) => ContainerSubChecList(
                              ticketId: ticketId,
                              maintenancesListId: maintenancesListId,
                              subMaintenanceId: maintenancesList.subMaintenances![index].id ?? 0,
                            ),
                      ),
                  ],
                ),
              );
            },
          ),
    );
  }
}
