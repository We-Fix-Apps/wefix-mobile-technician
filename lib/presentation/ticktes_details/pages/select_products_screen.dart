import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/button/app_button.dart';
import '../controller/ticktes_details_controller.dart';
import '../domain/ticket_enum.dart';
import '../widgets/widget_select_product.dart';

class SelectProductsScreen extends StatelessWidget {
  final String id;
  const SelectProductsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: context.read<TicktesDetailsController>()..getMaterial(id),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(AppText(context).requiredMaterial, style: AppTextStyle.style16B)),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Consumer<TicktesDetailsController>(
                  builder:
                      (context, provider, child) => ValueListenableBuilder(
                        valueListenable: provider.materials,
                        builder:
                            (context, value, child) => ListView.separated(
                              itemCount: value.length,
                              separatorBuilder: (context, index) => 5.gap,
                              itemBuilder: (context, index) => WidgetSelectProduct(product: value[index], index: index),
                            ),
                      ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ValueListenableBuilder(
            valueListenable: context.read<TicktesDetailsController>().addMaterilsStatus,
            builder:
                (context, value, child) => AppButton.text(
                  loading: value == AddMaterilsStatus.loading,
                  text: AppText(context).request,
                  onPressed: () {
                    context.read<TicktesDetailsController>().addMaterial(context, id);
                  },
                ),
          ),
        ),
      ),
    );
  }
}
