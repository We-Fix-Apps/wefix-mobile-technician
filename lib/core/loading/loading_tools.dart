import 'package:flutter/material.dart';

import '../../presentation/ticktes_details/widgets/widget_product.dart';
import '../extension/gap.dart';

class LoadingTools extends StatelessWidget {
  const LoadingTools({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (context, index) => 5.gap,
      itemBuilder: (context, index) => const WidgetProduct(loading: true, isTools: true),
    );
  }
}
