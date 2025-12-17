import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/providers/language_provider/l10n_provider.dart';
import '../../../core/router/router_key.dart';
import '../../../core/services/hive_services/box_kes.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/widget/widget_daialog.dart';
import '../../../injection_container.dart';
import '../controller/drawer/drawer_controller.dart';
import '../widgets/widget_list_drawer.dart';
import 'containers/container_drawer_header.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<DrawerControllers>(),
      builder:
          (context, child) => Drawer(
            child: SafeArea(
              child: ListView(
                children: [
                  20.gap,
                  const ContainerDrawerHeader(),
                  5.gap,
                  Divider(color: AppColor.grey.withOpacity(0.5), thickness: 0.5),
                  15.gap,
                  WidgetListDrawer(
                    title: AppText(context).profile,
                    icon: Assets.iconEditProfile,
                    onTap: () => context.push(RouterKey.layout + RouterKey.editProfile),
                  ),
                  Divider(color: AppColor.grey.withOpacity(0.5), thickness: 0.5),
                  WidgetListDrawer(
                    title: AppText(context).notifications,
                    icon: Assets.iconEditNotification,
                    onTap: () => context.push(RouterKey.layout + RouterKey.notification),
                  ),
                  Divider(color: AppColor.grey.withOpacity(0.5), thickness: 0.5),
                  WidgetListDrawer(
                    title: AppText(context).language,
                    icon: Assets.iconLanguage,
                    haveIconArrow: false,
                    onTap: () => context.read<LanguageProvider>().changeLanguage(context),
                  ),
                  Divider(color: AppColor.grey.withOpacity(0.5), thickness: 0.5),
                  WidgetListDrawer(
                    title: AppText(context).privacyPolicy,
                    icon: Assets.iconPrivacy,
                    onTap:
                        () => context.push(
                          '${RouterKey.webview}?url=${_getLanguage(context) == 'en' ? 'https://wefixjo.com/Privacy.html' : 'https://wefixjo.com/Privacy-ar.html'}',
                        ),
                  ),
                  Divider(color: AppColor.grey.withOpacity(0.5), thickness: 0.5),
                  WidgetListDrawer(
                    title: AppText(context).termsConditions,
                    icon: Assets.iconTerms,
                    onTap:
                        () => context.push(
                          '${RouterKey.webview}?url=${_getLanguage(context) == 'en' ? 'https://wefixjo.com/Terms-Conditions.html' : 'https://wefixjo.com/Terms-Conditions-ar.html'}',
                        ),
                  ),
                  Divider(color: AppColor.grey.withOpacity(0.5), thickness: 0.5),
                  WidgetListDrawer(title: AppText(context).logout, icon: Assets.iconLogout, haveIconArrow: false, onTap: () => _logout(context)),
                  Divider(color: AppColor.grey.withOpacity(0.5), thickness: 0.5),
                  WidgetListDrawer(
                    title: AppText(context).deleteAccount,
                    icon: Assets.iconDeleteAccount,
                    iconColor: AppColor.red,
                    haveIconArrow: false,
                    onTap: () {
                      final rootContext = context;
                      SmartDialog.show(
                        builder:
                            (context) => WidgetDilog(
                              isError: true,
                              title: AppText(context).deleteAccount,
                              message: AppText(context).deleteAccountMessage,
                              cancelText: AppText(context).cancel,
                              confirmText: AppText(context).delete,
                              onCancel: () {
                                SmartDialog.dismiss();
                              },
                              onConfirm: () {
                                SmartDialog.dismiss();
                                _logout(rootContext);
                              },
                            ),
                      );
                    },
                  ),
                  25.gap,
                ],
              ),
            ),
          ),
    );
  }

  void _logout(BuildContext context) {
    sl<Box>(instanceName: BoxKeys.appBox).delete(BoxKeys.enableAuth);
    context.go(RouterKey.login);
  }

  String _getLanguage(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'en') {
      return 'en';
    } else if (locale.languageCode == 'ar') {
      return 'ar';
    } else {
      return 'en';
    }
  }
}
