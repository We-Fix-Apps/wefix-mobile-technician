// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/context/global.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/services/hive_services/box_kes.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/widget/widget_daialog.dart';
import '../../../injection_container.dart';
import '../../auth/domain/model/user_model.dart';
import '../../home/pages/home_screen.dart';
import '../../scan/pages/scan_screen.dart';
import '../../support/pages/support_screen.dart';
import '../../tools/pages/tools_screen.dart';
import '../domain/model/notification_model.dart';
import '../domain/notification_enum.dart';
import '../domain/usecase/layout_usecase.dart';

class LayoutProvider extends ChangeNotifier with WidgetsBindingObserver {
  final LayoutUsecase notificationUseCase;

  ValueNotifier<NotificationState> notificationState = ValueNotifier(NotificationState.init);
  List<BottomNavigationBarItem> items = [];
  List<Widget> screens = [const HomeScreen(), const ScanScreen(), const ToolsScreen(), const SupportScreen()];
  int currentIndex = 0;

  LayoutProvider({required this.notificationUseCase});

  void setBottomNavBar() {
    items = [
      BottomNavigationBarItem(
        label: AppText(GlobalContext.context, isFunction: true).home,
        icon: SizedBox(width: 25, height: 25, child: SvgPicture.asset(Assets.iconHome)),
        activeIcon: SizedBox(width: 25, height: 25, child: SvgPicture.asset(Assets.iconHome, color: AppColor.primaryColor)),
      ),
      BottomNavigationBarItem(
        label: AppText(GlobalContext.context, isFunction: true).scan,
        icon: SizedBox(width: 25, height: 25, child: SvgPicture.asset(Assets.iconScan, color: AppColor.grey)),
        activeIcon: SizedBox(width: 25, height: 25, child: SvgPicture.asset(Assets.iconScan, color: AppColor.primaryColor)),
      ),
      BottomNavigationBarItem(
        label: AppText(GlobalContext.context, isFunction: true).tools,
        icon: SizedBox(width: 25, height: 25, child: SvgPicture.asset(Assets.iconTools, color: AppColor.grey)),
        activeIcon: SizedBox(width: 25, height: 25, child: SvgPicture.asset(Assets.iconTools, color: AppColor.primaryColor)),
      ),
      BottomNavigationBarItem(
        label: AppText(GlobalContext.context, isFunction: true).support,
        icon: SizedBox(width: 25, height: 25, child: SvgPicture.asset(Assets.iconSupport, color: AppColor.grey)),
        activeIcon: SizedBox(width: 25, height: 25, child: SvgPicture.asset(Assets.iconSupport, color: AppColor.primaryColor)),
      ),
    ];

    notifyListeners();
  }

  // * Function to change the current index of the bottom navigation bar
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  // * Function to get the current index of the bottom navigation bar
  void setCurrentIndex(int? index) {
    if (index != null) {
      currentIndex = index;
      notifyListeners();
    }
  }

  // * Function Get Notifivation
  NotificationModel? notificationModel;
  Future<void> getNotification() async {
    try {
      notificationState.value = NotificationState.loading;
      final notificationResponse = await notificationUseCase.getNotifications();
      notificationResponse.fold(
        (failure) {
          notificationState.value = NotificationState.failure;
          notifyListeners();
        },
        (notification) {
          if (notification.data?.notification?.isEmpty ?? true) {
            notificationState.value = NotificationState.empty;
          } else {
            notificationState.value = NotificationState.success;
          }
          notificationModel = notification.data;
          notifyListeners();
        },
      );
    } catch (e) {
      notificationState.value = NotificationState.failure;
      log('Server Error In Notification Section : $e');
      notifyListeners();
    }
  }

  // * Function Get Profile
  Future<void> getProfile() async {
    try {
      final result = await notificationUseCase.profile();
      result.fold((failure) {}, (profile) {
        sl<Box<User>>().put(BoxKeys.userData, profile.data!);
      });
    } catch (e) {
      log('Server Error In Profile Section : $e');
      SmartDialog.show(
        builder:
            (context) => WidgetDilog(
              isError: true,
              title: AppText(context).warning,
              message: 'Server Error In Profile Section : $e',
              cancelText: AppText(context).back,
              onCancel: () => SmartDialog.dismiss(),
            ),
      );
    }
  }
}
