import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/app_text.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../core/unit/app_color.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../injection_container.dart';
import '../../controller/ticktes_details_controller.dart';
import 'containers/container_check_list.dart';

class CompletionChecklistScreen extends StatelessWidget {
  final String id;
  const CompletionChecklistScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: context.read<TicktesDetailsController>()..getMaintenances(id),
      child: Consumer<TicktesDetailsController>(
        builder:
            (context, controller, child) => Scaffold(
              appBar: AppBar(title: Text(AppText(context).completionChecklist, style: AppTextStyle.style16B), centerTitle: true),
              body: ValueListenableBuilder(
                valueListenable: controller.completionChecklist,
                builder:
                    (context, value, child) => Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: value.length,
                            separatorBuilder: (context, index) => const Divider(),
                            itemBuilder: (context, index) => ContainerChecList(maintenancesListId: value[index].id ?? 0, ticketId: int.parse(id)),
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: ValueListenableBuilder(
                              valueListenable: sl<Box>(instanceName: BoxKeys.appBox).listenable(),
                              builder: (context, box, child) {
                                final duration = box.get('duration', defaultValue: 0) as int;
                                Duration durationObject = Duration(seconds: duration);
                                String formattedDuration = '${durationObject.inMinutes}:${(durationObject.inSeconds % 60).toString().padLeft(2, '0')}';
                                return SafeArea(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        spacing: 10,
                                        children: [
                                          Icon(Icons.timer, color: AppColor.primaryColor),
                                          Text(AppText(context).theticketstartedat, style: AppTextStyle.style14B),
                                        ],
                                      ),
                                      Text(formattedDuration, style: AppTextStyle.style14B),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
            ),
      ),
    );
  }
}
