import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/app_image.dart';
import '../../../../core/providers/app_text.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../core/widget/button/app_button.dart';
import '../../../../injection_container.dart';
import '../../controller/auth_provider.dart';
import '../../domain/auth_enum.dart';
import '../../domain/model/user_model.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: context.read<AuthProvider>().loginState,
            builder:
                (context, value, child) => AppButton.text(
                  loading: value == LoginState.loading,
                  text: AppText(context).continues,
                  onPressed: () async {
                    switch (context.read<AuthProvider>().isRegister) {
                      case false:
                        await context.read<AuthProvider>().login();
                      case true:
                        await context.read<AuthProvider>().register();
                    }
                  },
                ),
          ),
        ),
        if (context.read<AuthProvider>().isRegister == false) ...[
          // Use both user box and selected team listeners to update when either changes
          ValueListenableBuilder(
            valueListenable: context.read<AuthProvider>().selectedTeam,
            builder: (context, currentTeam, child) {
              return ValueListenableBuilder(
                valueListenable: sl<Box<User>>().listenable(),
                builder: (context, value, child) {
                  final userBox = sl<Box<User>>();
                  final appBox = sl<Box>(instanceName: BoxKeys.appBox);
                  final storedUser = userBox.get(BoxKeys.userData);
                  final storedTeam = appBox.get(BoxKeys.userTeam);
                  
                  // Only show fingerprint button if:
                  // 1. User data exists
                  // 2. Stored team matches currently selected team
                  // This ensures B2B Team users can only use B2B Team fingerprint
                  // and WeFix Team users can only use WeFix Team fingerprint
                  if (storedUser != null && storedTeam != null && storedTeam == currentTeam) {
                    return AppButton.iconOnly(
                      iconPath: Assets.iconFingerprint, 
                      onPressed: () => context.read<AuthProvider>().authenticate(context)
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            },
          ),
        ],
      ],
    );
  }
}
