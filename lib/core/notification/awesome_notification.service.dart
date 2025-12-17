import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../constant/app_image.dart';
import '../context/global.dart';
import 'globale.dart';
import 'model/notification_channel_model.dart';

class NotificationsController {
  static ReceivedAction? initialAction;

  static Future<void> initializeLocalNotifications() async {
    await initializeIsolateReceivePort();

    await AwesomeNotifications().initialize(
      "resource://drawable/app_icon",
      [
        NotificationChannel(
          channelGroupKey: NotificationChannelKey.basicChannel.groupKey,
          channelKey: NotificationChannelKey.basicChannel.key,
          channelName: NotificationChannelKey.basicChannel.name,
          channelDescription: NotificationChannelKey.basicChannel.description,
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        ),
        NotificationChannel(
          channelGroupKey: NotificationChannelKey.categoryChannel.groupKey,
          channelKey: NotificationChannelKey.categoryChannel.key,
          channelName: NotificationChannelKey.categoryChannel.name,
          channelDescription: NotificationChannelKey.categoryChannel.description,
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          ledColor: Colors.white,
          channelShowBadge: true,
          locked: true,
          defaultRingtoneType: DefaultRingtoneType.Ringtone,
        ),
        NotificationChannel(
          channelGroupKey: NotificationChannelKey.categoryChannel.groupKey,
          channelKey: NotificationChannelKey.alarmChannel,
          channelName: 'Alarms Channel',
          channelDescription: 'Channel with alarm ringtone',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          ledColor: Colors.white,
          channelShowBadge: true,
          locked: true,
          defaultRingtoneType: DefaultRingtoneType.Alarm,
        ),
        NotificationChannel(
          channelGroupKey: NotificationChannelKey.scheduleChannel.groupKey,
          channelKey: NotificationChannelKey.scheduleChannel.key,
          channelName: NotificationChannelKey.scheduleChannel.name,
          channelDescription: NotificationChannelKey.scheduleChannel.description,
          defaultColor: const Color(0xFF9D50DD),
          ledColor: const Color(0xFF9D50DD),
          vibrationPattern: lowVibrationPattern,
          importance: NotificationImportance.High,
          defaultRingtoneType: DefaultRingtoneType.Alarm,
          criticalAlerts: true,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(channelGroupKey: 'basic', channelGroupName: 'Basic'),
        NotificationChannelGroup(channelGroupKey: 'category', channelGroupName: 'Category'),
        NotificationChannelGroup(channelGroupKey: 'schedule', channelGroupName: 'Schedule'),
      ],
      debug: true,
    );

    initialAction = await AwesomeNotifications().getInitialNotificationAction(removeFromActionEvents: false);
  }

  static Future<void> initializeNotificationsEventListeners() async {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationsController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationsController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationsController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationsController.onDismissActionReceivedMethod,
    );
  }

  static ReceivePort? receivePort;

  static Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Notification action port in main isolate');
    receivePort!.listen((serializedData) {
      final receivedAction = ReceivedAction().fromMap(serializedData);
      onActionReceivedMethodImpl(receivedAction);
    });

    IsolateNameServer.registerPortWithName(receivePort!.sendPort, 'notification_action_port');
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    log('Notification created on ${receivedNotification.createdLifeCycle?.name}');
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    log('Notification displayed on ${receivedNotification.displayedLifeCycle?.name}');
    log('Notification displayed at ${receivedNotification.displayedDate}');
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    log('Notification dismissed on ${receivedAction.dismissedLifeCycle?.name}');
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    if (receivePort != null) {
      await onActionReceivedMethodImpl(receivedAction);
    } else {
      log('Redirecting the execution to main isolate process in listening...');
      SendPort? sendPort = IsolateNameServer.lookupPortByName('notification_action_port');
      sendPort?.send(receivedAction.toMap());
    }
  }

  static Future<void> onActionReceivedMethodImpl(ReceivedAction receivedAction) async {
    log('Action ${receivedAction.actionType?.name} received on ${receivedAction.actionLifeCycle?.name}');
    WidgetsFlutterBinding.ensureInitialized();
  }

  static Future<void> interceptInitialCallActionRequest() async {
    ReceivedAction? receivedAction = await AwesomeNotifications().getInitialNotificationAction();
    if (receivedAction?.channelKey == 'call_channel') {
      initialAction = receivedAction;
    }
  }

  static Future<void> createNewNotification({
    required String title,
    required String body,
    String? bigPicture,
    NotificationChannelModel? channel,
    required Map<String, String?> payload,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    } else {
      handleNotificationPayload(GlobalContext.context, payload.cast());

      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: -1,
          channelKey: channel?.key ?? NotificationChannelKey.basicChannel.key,
          title: title,
          body: body,
          bigPicture: bigPicture,
          largeIcon: Assets.imageLogo,
          notificationLayout: NotificationLayout.BigPicture,
          payload: payload,
        ),
      );
    }
  }

  static Future<void> scheduleNotification({
    required String title,
    required String body,
    required int id,
    required DateTime date,
    Map<String, String?>? payload,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        title: title,
        body: body,
        wakeUpScreen: true,
        autoDismissible: false,
        category: NotificationCategory.Reminder,
        groupKey: NotificationChannelKey.scheduleChannel.groupKey,
        channelKey: NotificationChannelKey.scheduleChannel.key,
        payload: payload,
      ),
      schedule: NotificationCalendar(
        year: date.year,
        month: date.month,
        day: date.day,
        hour: date.hour,
        minute: date.minute,
        second: date.second,
        allowWhileIdle: true,
        preciseAlarm: true,
        repeats: true,
      ),
    );
  }

  static void handleNotificationPayload(BuildContext context, Map<String, dynamic> payload) {
    // Handle your payload here (e.g., update cubit, navigate, etc.)
  }

  static Future<void> cancelScheduleNotification({required int id}) async {
    await AwesomeNotifications().cancelSchedule(id);
  }

  static Future<void> cancelAllScheduleNotification() async {
    await AwesomeNotifications().cancelAllSchedules();
  }

  static Future<void> getAllScheduleNotifications() async {
    List<NotificationModel> allScheduleNotifications = await AwesomeNotifications().listScheduledNotifications();
    log("Total Scheduled Notifications: ${allScheduleNotifications.length}");
    log("Scheduled Notifications: $allScheduleNotifications");
  }
}
