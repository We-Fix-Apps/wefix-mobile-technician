// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import '../../injection_container.dart';
// import '../../main.dart';
// import '../constant/app_image.dart';
// import '../context/global.dart';
// import '../router/router_key.dart';
// import '../services/hive_services/box_kes.dart';
// import '../unit/app_color.dart';

// class NotificationServices {
//   NotificationServices() {
//     handelToken();
//     handelNotification(handler: firebaseMessagingBackgroundHandler, navigatorKey: GlobalContext.navigatorKey);
//   }

//   static Future<void> handelToken() async {
//     String? token;
//     try {
//       if (Platform.isIOS) {
//         token = await sl<FirebaseMessaging>().getAPNSToken() ?? "Empty FCM IOS";
//         sl<Box>(instanceName: BoxKeys.appBox).put(BoxKeys.fcmtoken, token);
//       } else {
//         token = await sl<FirebaseMessaging>().getToken();
//         sl<Box>(instanceName: BoxKeys.appBox).put(BoxKeys.fcmtoken, token);
//       }
//     } catch (e) {
//       log('Fcm Token : $e');
//     }
//     log('Fcm Token :- $token ');
//   }

//   static Future<void> handelNotification({required Future<void> Function(RemoteMessage) handler, required GlobalKey<NavigatorState> navigatorKey}) async {
//     // Todo : Start Notifications

//     // * If Application is open , then it will work
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       log('Got a message whilst in the foreground!');
//       log('Message data: ${message.data}');

//       if (message.notification != null) {
//         log('Message also contained a notification: ${message.notification?.title}');
//         BotToast.showNotification(
//           onTap: () => GlobalContext.context.push(RouterKey.notification),
//           contentPadding: const EdgeInsets.all(8.0),
//           align: Alignment.topCenter,
//           title:
//               (w) => Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     children: [
//                       const Image(image: AssetImage(Assets.imageLogo), width: 30, height: 30),
//                       const SizedBox(width: 10.0),
//                       Text(message.notification?.title ?? ' ', style: const TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//           subtitle: (w) => Text(message.notification?.body ?? ' ', style: const TextStyle(color: AppColor.black, fontWeight: FontWeight.normal, fontSize: 14)),
//           duration: const Duration(seconds: 5),
//         );
//       }
//     });

//     // * If Application is in backGround , then it will work
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) async {
//       log('onMessageOpenedApp : $remoteMessage');
//       if (remoteMessage.notification != null) {
//         BotToast.showNotification(
//           onTap: () => GlobalContext.context.push(RouterKey.notification),
//           contentPadding: const EdgeInsets.all(8.0),
//           align: Alignment.topCenter,
//           title:
//               (w) => Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     children: [
//                       const Image(image: AssetImage(Assets.imageLogo), width: 30, height: 30),
//                       const SizedBox(width: 10.0),
//                       Text(remoteMessage.notification?.title ?? ' ', style: const TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//           subtitle:
//               (w) => Text(remoteMessage.notification?.body ?? ' ', style: const TextStyle(color: AppColor.black, fontWeight: FontWeight.normal, fontSize: 14)),
//           duration: const Duration(seconds: 5),
//         );
//       }
//     });

//     // * If Application is in Closed or Terminiated
//     FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? remoteMessage) {
//       if (remoteMessage?.notification != null) {
//         BotToast.showNotification(
//           onTap: () => GlobalContext.context.push(RouterKey.notification),
//           contentPadding: const EdgeInsets.all(8.0),
//           align: Alignment.topCenter,
//           title:
//               (w) => Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     children: [
//                       const Image(image: AssetImage(Assets.imageLogo), width: 30, height: 30),
//                       const SizedBox(width: 10.0),
//                       Text(remoteMessage?.notification?.title ?? ' ', style: const TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               ),
//           subtitle:
//               (w) => Text(remoteMessage?.notification?.body ?? ' ', style: const TextStyle(color: AppColor.black, fontWeight: FontWeight.normal, fontSize: 14)),
//           duration: const Duration(seconds: 5),
//         );
//       }
//     });

//     FirebaseMessaging.onBackgroundMessage(handler);
//   }
// }
