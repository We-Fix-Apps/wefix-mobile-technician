import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'l10n/l10n.dart';
import 'core/unit/util.dart';
import 'core/unit/theme.dart';
import 'injection_container.dart';
import 'core/router/router_page.dart';
import 'core/services/hive_services/hive_services.dart';
import 'presentation/layout/controller/layout_provider.dart';
import 'core/providers/language_provider/l10n_provider.dart';
import 'presentation/ticktes_details/controller/ticktes_details_controller.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveServices().init();
  await init();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log('Handling a background message: ${message.messageId}');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => sl<LanguageProvider>()..setInitLang()),
        ChangeNotifierProvider(create: (context) => sl<LayoutProvider>()..getProfile()),
        ChangeNotifierProvider(create: (context) => sl<TicktesDetailsController>()),
      ],
      child: Consumer<LanguageProvider>(
        builder:
            (context, value, child) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Wefix - Technicians',
              locale: Locale(context.read<LanguageProvider>().lang ?? 'en', ''),
              localizationsDelegates: L10n.localizationsDelegates,
              supportedLocales: L10n.all,
              routerConfig: goRouter,
              builder: (context, child) {
                child = BotToastInit()(context, child);
                child = FlutterSmartDialog.init()(context, child);
                return child;
              },
              theme: MaterialTheme(textTheme).light(),
            ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
