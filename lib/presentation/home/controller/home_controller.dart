import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../../core/context/global.dart';
import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/router/router_key.dart';
import '../../../core/services/hive_services/box_kes.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/widget/widget_daialog.dart';
import '../../../injection_container.dart';
import '../../auth/domain/model/user_model.dart';
import '../domain/home_enum.dart';
import '../domain/model/home_model.dart';
import '../domain/usecase/home_usecase.dart';

class HomeController extends ChangeNotifier with WidgetsBindingObserver {
  final HomeUsecase homeUsecase;

  ValueNotifier<HomeStatus> homeStatue = ValueNotifier(HomeStatus.init);
  List<Map<String, dynamic>> filterTypes = [];
  String? totalTickets = '0';
  String? memberViews = '0';

  HomeController({required this.homeUsecase});

  // Function to chech User
  Future<void> checkAccess() async {
    try {
      homeStatue.value = HomeStatus.loading;
      final result = await homeUsecase.checkUser();
      result.fold(
        (failure) {
          homeStatue.value = HomeStatus.failuer;
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: failure.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (checkAccess) {
          if (checkAccess.data == false) {
            SmartDialog.show(
              clickMaskDismiss: false,
              backType: SmartBackType.block,
              backDismiss: false,
              builder:
                  (context) => WidgetDilog(
                    isError: true,
                    title: AppText(context).warning,
                    message: AppText(context).blockMessage,
                    cancelText: AppText(context).login,
                    onCancel: () {
                      SmartDialog.dismiss();
                      sl<Box>(instanceName: BoxKeys.appBox).clear();
                      sl<Box<User>>().clear();
                      GlobalContext.context.go(RouterKey.login);
                    },
                  ),
            );
          } else {
            getHomeData();
          }
        },
      );
    } catch (e) {
      homeStatue.value = HomeStatus.failuer;
      log('Server Error In Chack Access Section : $e');
      SmartDialog.show(
        builder:
            (context) => WidgetDilog(
              isError: true,
              title: AppText(context).warning,
              message: 'Server Error In  Chack Access Section : $e',
              cancelText: AppText(context).back,
              onCancel: () => SmartDialog.dismiss(),
            ),
      );
    }
  }

  // Function to get the home data
  Future<void> getHomeData() async {
    try {
      homeStatue.value = HomeStatus.loading;
      final result = await homeUsecase.getHomeData();
      result.fold(
        (l) {
          homeStatue.value = HomeStatus.failuer;
          SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: 'Error in section Get Home Data',
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (r) {
          setFilter(r.data!);
          homeStatue.value = HomeStatus.success;
          notifyListeners();
        },
      );
    } catch (e) {
      homeStatue.value = HomeStatus.failuer;
      log('Server Error in section Get Home Data : $e');
    }
  }

  void setFilter(HomeModel home) {
    filterTypes = [
      {'title': AppText(GlobalContext.context, isFunction: true).today, 'isSelected': true, 'count': '', 'data': []},
      {'title': AppText(GlobalContext.context, isFunction: true).tomorrow, 'isSelected': false, 'count': '', 'data': []},
      {'title': '${AppText(GlobalContext.context, isFunction: true).emergency} 🚨', 'isSelected': false, 'count': '', 'data': []},
    ];
    filterTypes[0]['data'] = home.tickets ?? [];
    filterTypes[0]['count'] = (home.tickets?.length ?? 0).toString();
    filterTypes[1]['data'] = home.ticketsTomorrow ?? [];
    filterTypes[1]['count'] = (home.ticketsTomorrow?.length ?? 0).toString();
    filterTypes[2]['data'] = home.emergency ?? [];
    filterTypes[2]['count'] = (home.emergency?.length ?? 0).toString();
    totalTickets =
        '${(home.tickets?.where((value) => value.status?.toLowerCase() == 'pending').toList().length ?? 0) + (home.ticketsTomorrow?.where((value) => value.status?.toLowerCase() == 'pending').toList().length ?? 0) + (home.emergency?.where((value) => value.status?.toLowerCase() == 'pending').toList().length ?? 0)}';
    memberViews = home.rating.toString();
    notifyListeners();
  }

  // Function to change the selected filter type
  void changeType(int index, BuildContext context) {
    for (var element in filterTypes) {
      element['isSelected'] = false;
    }
    filterTypes[index]['isSelected'] = true;

    notifyListeners();
  }

  void showStatusColorDialog(BuildContext context) {
    SmartDialog.show(
      builder:
          (context) => WidgetDilog(
            isSupport: true,
            title: AppText(context).statusColorsMeaning,
            message: '',
            contents: [
              _buildStatusRow(AppText(context).pending, AppColor.primaryColor600, AppText(context).awaitinginitiationrequest),
              _buildStatusRow(AppText(context).inProgress, AppColor.blue, AppText(context).requestiscurrentlyunderway),
              _buildStatusRow(AppText(context).canceled, AppColor.red, AppText(context).thisrequestwascanceled),
              _buildStatusRow(AppText(context).completed, AppColor.green, AppText(context).thisrequestwascompletedsuccessfully),
            ],
            cancelText: AppText(context).back,
            onCancel: () {
              SmartDialog.dismiss();
            },
          ),
    );
  }

  Widget _buildStatusRow(String label, Color color, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          10.gap,
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)), TextSpan(text: description)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
