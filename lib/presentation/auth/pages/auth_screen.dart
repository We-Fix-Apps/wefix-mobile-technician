import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/router/router_key.dart';
import '../../../core/services/hive_services/box_kes.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/language_button.dart';
import '../../../injection_container.dart';
import '../controller/auth_provider.dart';
import '../domain/model/user_model.dart';
import '../widgets/widget_profile_image.dart';
import '../widgets/widget_toggle_auth.dart';
import '../widgets/widget_team_selector.dart';
import 'containers/auth_button.dart';
import 'containers/container_form_login.dart';
import 'containers/container_form_register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    // Check if technician is already logged in and redirect if so
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthAndRedirect();
    });
  }

  void _checkAuthAndRedirect() {
    try {
      final box = sl<Box>(instanceName: BoxKeys.appBox);
      final enableAuth = box.get(BoxKeys.enableAuth);
      
      // If user is authenticated, check their role
      if (enableAuth == true) {
        final userBox = sl<Box<User>>();
        final user = userBox.get(BoxKeys.userData);
        
        // Check if user has valid technician role (21 = Technician, 22 = Sub-Technician)
        if (user != null && (user.userRoleId == 21 || user.userRoleId == 22)) {
          // User is already logged in as technician, redirect to layout
          if (mounted) {
            context.go(RouterKey.layout);
          }
        }
      }
    } catch (e) {
      // If there's an error checking auth, allow login screen to show
      // This handles cases where boxes might not be initialized yet
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<AuthProvider>(),
      builder:
          (context, child) => Scaffold(
            appBar: AppBar(
              centerTitle: context.watch<AuthProvider>().isRegister == true ? true : false,
              title:
                  context.watch<AuthProvider>().isRegister == true
                      ? const SizedBox(width: 120, child: Image(image: AssetImage(Assets.imageLogin)))
                      : ValueListenableBuilder<String>(
                          valueListenable: context.watch<AuthProvider>().selectedTeam,
                          builder: (context, selectedTeam, child) {
                            final teamLabel = selectedTeam == 'B2B Team'
                                ? AppText(context).b2bTeam
                                : AppText(context).weFixTeam;
                            // Fallback to English if translation is empty
                            final displayLabel = teamLabel.isEmpty
                                ? (selectedTeam == 'B2B Team' ? 'B2B Team' : 'WeFix Team')
                                : teamLabel;
                            return Text(
                              displayLabel,
                              style: AppTextStyle.style14B,
                            );
                          },
                        ),
              actions: const [LanguageButton()],
            ),
            body: SafeArea(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Image(image: AssetImage(Assets.imageBacLogin)),
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        10.gap,
                        context.watch<AuthProvider>().isRegister == true
                            ? const WidgetProfileImage()
                            : const Center(child: Image(image: AssetImage(Assets.imageLogin))),
                        10.gap,
                        Text(
                          context.watch<AuthProvider>().isRegister == true
                              ? AppText(context).createaccountandjoinustoday
                              : AppText(context).welcomebackSignintocontinue,
                          style: AppTextStyle.style14,
                        ),
                        110.gap,
                        // Team selector - only show on login screen, not register
                        if (context.watch<AuthProvider>().isRegister == false) ...[
                          const WidgetTeamSelector(),
                          20.gap,
                        ],
                        context.watch<AuthProvider>().isRegister == false ? const ContainerFormLogin() : ContainerFormRegister(),
                        context.watch<AuthProvider>().isRegister == false ? 30.gap : const SizedBox.shrink(),
                        context.watch<AuthProvider>().isRegister == false ? const AuthButton() : const SizedBox.shrink(),
                        20.gap,
                        if (context.watch<AuthProvider>().isRegister == false) ...[
                          InkWell(
                            onTap: () => context.read<AuthProvider>().supportDailg(context),
                            child: Text(
                              '${AppText(context).havingtroubleloggingin}  ',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.style14B.copyWith(
                                color: AppColor.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.black,
                              ),
                            ),
                          ),
                          20.gap,
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const WidgetToggleAuth(),
          ),
    );
  }
}
