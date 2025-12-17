import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../controller/auth_provider.dart';

class WidgetSocialButton extends StatelessWidget {
  final String linke;
  final String icon;
  const WidgetSocialButton({super.key, required this.linke, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () => context.read<AuthProvider>().launchSocial(linke), child: SizedBox(width: 40, height: 40, child: SvgPicture.asset(icon)));
  }
}
