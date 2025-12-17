import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider/l10n_provider.dart';
import '../unit/app_text_style.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => context.read<LanguageProvider>().changeLanguage(context), icon: Text('AR/EN', style: AppTextStyle.style14B));
  }
}
