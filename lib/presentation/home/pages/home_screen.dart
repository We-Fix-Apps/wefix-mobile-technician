import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../controller/home_controller.dart';
import 'containers/container_home_card.dart';
import 'containers/container_orders_requiest.dart';
import 'containers/container_welcome_user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeController is now provided at LayoutScreen level, so we can use it directly
    // If it's not available, create a new one (fallback)
    return Consumer<HomeController>(
      builder: (context, state, child) {
        return RefreshIndicator.adaptive(
          onRefresh: () async => state.checkAccess(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContainerWelcomeUser(), 
                10.gap, 
                const ContainerHomeCard(), 
                15.gap, 
                const ContainerOrdersRequiest()
              ],
            ),
          ),
        );
      },
    );
  }
}
