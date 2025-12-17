import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/unit/app_text_style.dart';
import '../../../controller/ticktes_details_controller.dart';
import '../../../domain/model/maintenances_list_model.dart';

class ContainerSubSubCheckList extends StatelessWidget {
  const ContainerSubSubCheckList({super.key, required this.maintenancesListId, required this.subMaintenanceId, required this.lang, required this.ticketId});

  final int maintenancesListId;
  final int subMaintenanceId;
  final String lang;
  final int ticketId;

  @override
  Widget build(BuildContext context) {
    return Consumer<TicktesDetailsController>(
      builder:
          (context, controller, child) => ValueListenableBuilder(
            valueListenable: controller.completionChecklist,
            builder: (context, value, child) {
              List<MaintenancesList>? subSubMaintenances =
                  value
                      .where((value) => value.id == maintenancesListId)
                      .first
                      .subMaintenances!
                      .where((sub) => sub.id == subMaintenanceId)
                      .first
                      .subSubMaintenances!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                  itemCount: subSubMaintenances.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    MaintenancesList? maintenancesList = subSubMaintenances[index];
                    return CheckboxListTile(
                      title: Text(lang == 'ar' ? maintenancesList.nameAr ?? '' : maintenancesList.name ?? '', style: AppTextStyle.style12B),
                      subtitle:
                          maintenancesList.description == null || maintenancesList.description == ''
                              ? null
                              : Text(maintenancesList.description ?? '', style: AppTextStyle.style12.copyWith(color: Colors.grey[600])),
                      value: maintenancesList.isChecked,
                      onChanged: (value) => controller.uploadMaintenances(context, ticketId, maintenancesList.id ?? 0, maintenancesList: maintenancesList),
                    );
                  },
                ),
              );
            },
          ),
    );
  }
}
