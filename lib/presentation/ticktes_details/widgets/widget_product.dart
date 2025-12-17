import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/language_provider/l10n_provider.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_cache_network_image.dart';
import '../../../core/widget/widget_loading.dart';
import '../controller/ticktes_details_controller.dart';
import '../domain/model/tickets_details_model.dart';
import '../domain/ticket_enum.dart';

class WidgetProduct extends StatelessWidget {
  final TicketTool? product;
  final TicketMaterial? material;
  final int? index;
  final bool? isTools;
  final bool? loading;
  const WidgetProduct({super.key, this.product, this.index, this.isTools = false, this.loading = false, this.material});

  @override
  Widget build(BuildContext context) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColor.grey.withOpacity(.4))),
      child: Row(
        children: [
          loading == true
              ? const WidgetLoading(width: 50, height: 50, radius: 10)
              : Container(
                width: 50,
                height: 50,
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
                loading == true
                    ? const WidgetLoading(width: 150)
                    : Text(
                      isTools == false
                          ? lang == 'ar'
                              ? material?.titleAr ?? ''
                              : material?.title ?? ''
                          : lang == 'ar'
                          ? product?.titleAr ?? ''
                          : product?.title ?? '',
                      style: AppTextStyle.style14B,
                      overflow: TextOverflow.ellipsis,
                    ),
                // loading == true
                //     ? const WidgetLoading(width: 50, top: 5)
                //     : Text('X${isTools == false ? material?.quantity ?? '0' : product?.quantity}', style: AppTextStyle.style12B.copyWith(color: AppColor.grey)),
              ],
            ),
          ),
          if (isTools == false) ...[
            10.gap,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TicketDetailsStatus.completed.name == context.read<TicktesDetailsController>().ticketsDetails?.status?.toLowerCase()
                    ? const SizedBox.shrink()
                    : MaterialStatus.accepted.name == (material?.status ?? '').toLowerCase()
                    ? const SizedBox.shrink()
                    : InkWell(
                      onTap: loading == true ? null : () => context.read<TicktesDetailsController>().deleteMaterial(material?.id ?? 0),
                      child: Icon(Icons.clear, color: loading == true ? AppColor.grey : AppColor.red),
                    ),
                Text(
                  material?.status ?? '',
                  style: AppTextStyle.style12B.copyWith(
                    color: MaterialStatus.accepted.name == (material?.status ?? '').toLowerCase() ? AppColor.green : AppColor.primaryColor,
                  ),
                ),
              ],
            ),
            10.gap,
          ],
        ],
      ),
    );
  }
}
