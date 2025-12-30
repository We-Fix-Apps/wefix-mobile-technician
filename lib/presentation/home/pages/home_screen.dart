import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../injection_container.dart';
import '../controller/home_controller.dart';
import 'containers/container_home_card.dart';
import 'containers/container_orders_requiest.dart';
import 'containers/container_welcome_user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<HomeController>()..checkAccess(),
      child: Consumer<HomeController>(
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
      ),
    );
  }
}
