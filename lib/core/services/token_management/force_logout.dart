import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:go_router/go_router.dart';

import '../../context/global.dart';
import '../../services/hive_services/box_kes.dart';
import '../../router/router_key.dart';
import '../../../injection_container.dart';

/// Force logout user when account is deactivated or token is invalid
Future<void> forceLogout() async {
  try {
    log('forceLogout called');
    
    // Clear all user data and tokens immediately
    final box = sl<Box>(instanceName: BoxKeys.appBox);
    
    await box.delete(BoxKeys.usertoken);
    await box.delete('${BoxKeys.usertoken}_refresh');
    await box.delete('${BoxKeys.usertoken}_expiresAt');
    await box.delete(BoxKeys.enableAuth);
    await box.delete(BoxKeys.userTeam);
    
    // Clear user data box if registered
    try {
      final userBox = sl<Box<dynamic>>();
      await userBox.clear();
    } catch (_) {}
    
    log('Tokens cleared, navigating to login');

    // Navigate to login screen
    final navigatorContext = GlobalContext.navigatorKey.currentContext;
    if (navigatorContext != null && navigatorContext.mounted) {
      navigatorContext.go(RouterKey.login);
    } else {
      // Fallback: use navigatorKey directly
      GlobalContext.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        RouterKey.login,
        (route) => false,
      );
    }
  } catch (e) {
    log('Error during force logout: $e');
  }
}
