import 'package:flutter/material.dart';

import '../../presentation/layout/widgets/widget_notification.dart';
import '../extension/gap.dart';

class LoadingAllNotification extends StatefulWidget {
  const LoadingAllNotification({super.key});

  @override
  State<LoadingAllNotification> createState() => _LoadingAllNotificationState();
}

class _LoadingAllNotificationState extends State<LoadingAllNotification> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      padding: const EdgeInsets.all(10),
      separatorBuilder: (context, index) => 6.gap,
      itemBuilder: (context, index) => WidgetNotificationList(title: 'Loading', date: DateTime.now(), desc: '', loading: true),
    );
  }
}
