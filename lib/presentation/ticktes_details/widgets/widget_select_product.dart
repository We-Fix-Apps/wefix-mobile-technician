import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_cache_network_image.dart';
import '../controller/ticktes_details_controller.dart';
import '../domain/model/tickets_details_model.dart';

class WidgetSelectProduct extends StatelessWidget {
  final TicketMaterial product;
  final int index;
  const WidgetSelectProduct({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColor.grey.withOpacity(0.4))),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(border: Border.all(color: AppColor.grey.withOpacity(.4)), borderRadius: BorderRadius.circular(10)),
            child: const WidgetCachNetworkImage(
              radius: 10,
              image: 'https://5.imimg.com/data5/PD/TO/MY-871457/mechanical-power-transmission-products-500x500.jpg',
            ),
          ),
          10.gap,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title ?? '', style: AppTextStyle.style12B, overflow: TextOverflow.ellipsis),
                Text(
                  '${AppText(context).count}: ${product.quantity}',
                  style: AppTextStyle.style12B.copyWith(color: AppColor.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          10.gap,
          Consumer<TicktesDetailsController>(
            builder:
                (context, provider, child) => Directionality(
                  textDirection: TextDirection.ltr,
                  child: ItemCount(
                    initialValue: product.quantity ?? 0,
                    minValue: 0,
                    maxValue: 10000,
                    decimalPlaces: 0,
                    onChanged: (count) => provider.changeCounter(index: index, value: count),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
