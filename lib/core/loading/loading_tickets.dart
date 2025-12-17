import 'package:flutter/material.dart';

import '../../presentation/home/widgets/widget_card_requests.dart';
import '../extension/gap.dart';

class LoadingTickets extends StatelessWidget {
  const LoadingTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      padding: const EdgeInsets.symmetric(vertical: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => 5.gap,
      itemBuilder: (context, index) => const WidgetCardRequests(loading: true),
    );
  }
}
