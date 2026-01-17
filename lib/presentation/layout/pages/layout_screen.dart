import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/unit/app_text_style.dart';
import '../../../injection_container.dart';
import '../../drawer/pages/drawer.dart';
import '../../home/controller/home_controller.dart';
import '../controller/layout_provider.dart';
import '../widgets/widget_appbar.dart';

class LayoutScreen extends StatelessWidget {
  final int? index;
  const LayoutScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final layoutProvider = context.read<LayoutProvider>();
    
    // Handle index parameter if provided
    if (index != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        layoutProvider.setCurrentIndex(index);
      });
    }
    
    // Schedule navigation bar update after build to avoid setState during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      layoutProvider.setBottomNavBar();
    });
    
    return ChangeNotifierProvider(
      create: (context) => sl<HomeController>()..checkAccess(),
      child: Scaffold(
      appBar: WidgetAppbar.appBar(context),
      drawer: const DrawerWidget(),
      body: Consumer<LayoutProvider>(
        builder: (context, value, child) {
          // Ensure screens list is valid before accessing
          if (value.screens.isEmpty) {
            return const SizedBox.shrink();
          }
          
          final currentIndex = value.currentIndex.clamp(0, value.screens.length - 1);
          return value.screens[currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<LayoutProvider>(
        builder: (context, value, child) {
          // Check if user is B2B Team - hide navigation bar completely for B2B users
          final isB2B = value.isB2BTeam;
          
          // Hide navigation bar for B2B users (they only have Home, so no navigation needed)
          if (isB2B || value.items.isEmpty || value.items.length <= 1) {
            return const SizedBox.shrink();
          }
          
          // Ensure items list is valid before building navigation bar
          if (value.items.isEmpty || value.currentIndex >= value.items.length) {
            return const SizedBox.shrink();
          }
          
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: value.currentIndex.clamp(0, value.items.length - 1),
            selectedItemColor: Theme.of(context).colorScheme.primary,
            selectedLabelStyle: AppTextStyle.style14B,
            items: value.items,
            onTap: value.changeIndex,
          );
        },
        ),
      ),
    );
  }
}
