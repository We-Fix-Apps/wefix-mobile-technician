import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_cache_network_image.dart';
import '../controller/ticktes_details_controller.dart';
import '../domain/model/maintenances_list_model.dart';

class WidgetTitleExpansion extends StatelessWidget {
  final String icon;
  final String title;
  final int ticketId;
  final int mainId;
  final MaintenancesList? maintenancesList;

  const WidgetTitleExpansion({super.key, required this.icon, required this.title, required this.ticketId, required this.mainId, this.maintenancesList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon.contains('svg') ? SvgPicture.network(icon, width: 30, height: 30) : WidgetCachNetworkImage(image: (icon), width: 30, hieght: 30),
        10.gap,
        Expanded(child: Text(title, style: AppTextStyle.style12B)),
        5.gap,
        InkWell(
          onTap: () => context.read<TicktesDetailsController>().uploadMaintenances(context, ticketId, mainId, isLevel1: true , maintenancesList: maintenancesList),
          child: const Icon(Icons.upload, color: Colors.grey),
        ),
      ],
    );
  }
}
