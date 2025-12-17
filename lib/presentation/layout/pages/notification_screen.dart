import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/extension/gap.dart';
import '../../../core/loading/loading_notification.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/language_button.dart';
import '../../../core/widget/widget_empty.dart';
import '../../../injection_container.dart';
import '../controller/layout_provider.dart';
import '../domain/notification_enum.dart';
import '../widgets/widget_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(AppText(context).notifications, style: AppTextStyle.style16B), actions: const [LanguageButton()]),
      body: ChangeNotifierProvider(
        create: (context) => sl<LayoutProvider>()..getNotification(),
        builder:
            (context, child) => Consumer<LayoutProvider>(
              builder: (context, state, child) {
                switch (state.notificationState.value) {
                  case NotificationState.loading:
                    return const LoadingAllNotification();
                  case NotificationState.empty:
                    return WidgetEmptyScreen(
                      title: AppText(context).emptyNotification,
                      desc: AppText(context).youDontHaveAnyNotificationYet,
                      icon: SvgPicture.asset(Assets.iconEditNotification),
                    );
                  case NotificationState.success:
                    return ListView.separated(
                      itemCount: state.notificationModel!.notification!.length,
                      padding: const EdgeInsets.all(10),
                      separatorBuilder: (context, index) => 6.gap,
                      itemBuilder:
                          (context, index) => WidgetNotificationList(
                            title: state.notificationModel!.notification![index].title ?? '',
                            desc: state.notificationModel!.notification![index].description ?? '',
                            date: state.notificationModel!.notification![index].createdDate ?? DateTime.now(),
                          ),
                    );
                  case NotificationState.failure:
                    return ValueListenableBuilder(
                      valueListenable: context.read<LayoutProvider>().notificationState,
                      builder:
                          (context, value, child) => WidgetEmptyScreen(
                            title: '${AppText(context).errorWhenGet} ${AppText(context).notifications}',
                            desc: AppText(context).pleasetryagainlater,
                            icon: SvgPicture.asset(Assets.iconWarning),
                            loading: value == NotificationState.loading,
                            onPressed: () => context.read<LayoutProvider>().getNotification(),
                          ),
                    );
                  default:
                    return ValueListenableBuilder(
                      valueListenable: context.read<LayoutProvider>().notificationState,
                      builder:
                          (context, value, child) => WidgetEmptyScreen(
                            title: '${AppText(context).errorWhenGet} ${AppText(context).notifications}',
                            desc: AppText(context).pleasetryagainlater,
                            icon: SvgPicture.asset(Assets.iconWarning),
                            loading: value == NotificationState.loading,
                            onPressed: () => context.read<LayoutProvider>().getNotification(),
                          ),
                    );
                }
              },
            ),
      ),
    );
  }
}
