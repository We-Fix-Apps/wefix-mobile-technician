import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/app_text.dart';
import '../../../core/widget/button/app_button.dart';
import '../controller/support_provider.dart';
import '../domain/support_enum.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder(
              valueListenable: context.read<SupportProvider>().supportState,
              builder:
                  (context, value, child) => AppButton.text(
                    text: AppText(context).send,
                    loading: value == SupportState.loading,
                    onPressed: () async => await context.read<SupportProvider>().sendSupport(),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
