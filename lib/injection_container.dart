import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'core/notification/awesome_notification.service.dart';
import 'core/notification/fcm_setup.dart';
import 'core/providers/domain/repoistory/language_repoistory.dart';
import 'core/providers/domain/usecase/language_usecase.dart';
import 'core/services/cache_helper.dart';
import 'core/providers/language_provider/l10n_provider.dart';
import 'core/services/hive_services/hive_services.dart';
import 'firebase_options.dart';
import 'presentation/auth/controller/auth_provider.dart';
import 'presentation/auth/domain/repoistory/login_repository.dart';
import 'presentation/auth/domain/repoistory/register_repository.dart';
import 'presentation/auth/domain/usecase/auth_usecase.dart';
import 'presentation/chat/controller/chat_controller.dart';
import 'presentation/chat/domain/repoistory/chat_repoistory.dart';
import 'presentation/chat/domain/usecase/chat_usecase.dart';
import 'presentation/drawer/controller/drawer/drawer_controller.dart';
import 'presentation/drawer/controller/edit_profile/edit_profile_controller.dart';
import 'presentation/drawer/domain/repository/content_repository.dart';
import 'presentation/drawer/domain/repository/profile_repository.dart';
import 'presentation/drawer/domain/usecase/content_usecase.dart';
import 'presentation/drawer/domain/usecase/profile_usecase.dart';
import 'presentation/home/controller/home_controller.dart';
import 'presentation/home/domain/repoistory/home_repoistory.dart';
import 'presentation/home/domain/usecase/home_usecase.dart';
import 'presentation/layout/controller/layout_provider.dart';
import 'presentation/layout/domain/repository/layout_repoistory.dart';
import 'presentation/layout/domain/repository/notification_repository.dart';
import 'presentation/layout/domain/usecase/layout_usecase.dart';
import 'presentation/scan/controller/scan_provider.dart';
import 'presentation/scan/domain/repoistory/scan_repistory.dart';
import 'presentation/scan/domain/usecase/scan_usecase.dart';
import 'presentation/splash/controller/splash_provider.dart';
import 'presentation/support/controller/support_provider.dart';
import 'presentation/support/domain/repository/support_repository.dart';
import 'presentation/support/domain/usecase/support_usecase.dart';
import 'presentation/ticktes_details/controller/ticktes_details_controller.dart';
import 'presentation/ticktes_details/domain/repoistory/maintenances_repoistory.dart';
import 'presentation/ticktes_details/domain/repoistory/material_repoistory.dart';
import 'presentation/ticktes_details/domain/repoistory/tickets_details_reoistory.dart';
import 'presentation/ticktes_details/domain/repoistory/tools_repoistory.dart';
import 'presentation/ticktes_details/domain/usecase/ticket_usecase.dart';
import 'presentation/tools/controller/tools_controller.dart';
import 'presentation/tools/domain/repoistory/tools_repoistory.dart';
import 'presentation/tools/domain/usecase/tools_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // * ======================== Hive  ========================================
  sl.registerLazySingleton(() => sl<HiveServices>().init());
  // * ======================== CacheHelper  ========================================
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  CacheHelper.init();
  // * ======================== Dot env  ========================================
  await dotenv.load(fileName: ".env");
  // * ======================== Firebase ========================================
  sl.registerSingleton<FirebaseMessaging>(FirebaseMessaging.instance);
  await NotificationsController.initializeLocalNotifications();
  await NotificationsController.initializeIsolateReceivePort();
  await FcmHelper.initFcm();
  // * ======================== Provider ========================================
  sl.registerFactory<LanguageProvider>(() => LanguageProvider());
  sl.registerFactory<SplashProvider>(() => SplashProvider(languageUsecase: sl()));
  sl.registerFactory<AuthProvider>(() => AuthProvider(authUsecase: sl()));
  sl.registerFactory<LayoutProvider>(() => LayoutProvider(notificationUseCase: sl()));
  sl.registerFactory<ScanProvider>(() => ScanProvider(scanUsecase: sl()));
  sl.registerFactory<HomeController>(() => HomeController(homeUsecase: sl()));
  sl.registerFactory<SupportProvider>(() => SupportProvider(supportUsecase: sl()));
  sl.registerFactory<DrawerControllers>(() => DrawerControllers(contentUsecase: sl()));
  sl.registerFactory<ChatController>(() => ChatController(ticketUsecase: sl(), authUsecase: sl()));
  sl.registerFactory<EditProfileController>(() => EditProfileController(profileUsecase: sl(), homeUsecase: sl()));
  sl.registerFactory<TicktesDetailsController>(() => TicktesDetailsController(ticketUsecase: sl(), authUsecase: sl()));
  sl.registerFactory<ToolsController>(() => ToolsController(toolsUsecase: sl()));
  // * ======================== UseCase ========================================
  sl.registerLazySingleton<AuthUsecase>(() => AuthUsecase(loginRepository: sl(), registerRepository: sl()));
  sl.registerLazySingleton<LayoutUsecase>(() => LayoutUsecase(layoutRepoistory: sl(), notificationRepository: sl()));
  sl.registerLazySingleton<ContentUsecase>(() => ContentUsecase(contentRepository: sl()));
  sl.registerLazySingleton<ProfileUsecase>(() => ProfileUsecase(profileRepository: sl()));
  sl.registerLazySingleton<SupportUsecase>(() => SupportUsecase(supportRepository: sl()));
  sl.registerLazySingleton<ToolsUsecase>(() => ToolsUsecase(toolsRepoi: sl()));
  sl.registerLazySingleton<HomeUsecase>(() => HomeUsecase(homeRepoistory: sl()));
  sl.registerLazySingleton<LanguageUsecase>(() => LanguageUsecase(languageReoistory: sl()));
  sl.registerLazySingleton<ScanUsecase>(() => ScanUsecase(scanRepistory: sl()));
  sl.registerLazySingleton<ChatUsecase>(() => ChatUsecase(chatRepository: sl()));
  sl.registerLazySingleton<TicketUsecase>(
    () => TicketUsecase(ticketsDetailsReoistory: sl(), toolsReoistory: sl(), materialReoistory: sl(), maintenancesRepoistory: sl()),
  );
  // * ======================== Repository ========================================
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl());
  sl.registerLazySingleton<LayoutRepoistory>(() => LayoutRepoistoryImpl());
  sl.registerLazySingleton<NotificationRepository>(() => NotificationRepositoryImpl());
  sl.registerLazySingleton<ContentRepository>(() => ContentRepositoryImpl());
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
  sl.registerLazySingleton<SupportRepository>(() => SupportRepositoryImpl());
  sl.registerLazySingleton<ToolsRepoistory>(() => ToolsRepoistoryImpl());
  sl.registerLazySingleton<HomeRepoistory>(() => HomeRepoistoryImpl());
  sl.registerLazySingleton<TicketsDetailsReoistory>(() => TicketsDetailsReoistoryImpl());
  sl.registerLazySingleton<ToolsReoistory>(() => ToolsReoistoryImpl());
  sl.registerLazySingleton<MaterialReoistory>(() => MaterialReoistoryImpl());
  sl.registerLazySingleton<MaintenancesRepoistory>(() => MaintenancesRepoistoryImpl());
  sl.registerLazySingleton<LanguageRepoistory>(() => LanguageRepoistoryImpl());
  sl.registerLazySingleton<ScanRepistory>(() => ScanRepistoryImpl());
  sl.registerLazySingleton<ChatRepoistory>(() => ChatRepoistoryImpl());
}
