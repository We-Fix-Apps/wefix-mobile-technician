import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/widget/widget_text_field.dart';
import '../controller/chat_controller.dart';

class WidgetSendMessage extends StatelessWidget {
  final String? ticketId;
  final String? userId;
  const WidgetSendMessage({super.key, this.ticketId, this.userId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: WidgetTextField(
          AppText(context).message,
          controller: context.read<ChatController>().messageController,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => context.read<ChatController>().selectMethodForImage(int.tryParse(ticketId ?? '0') ?? 0, int.tryParse(userId ?? '0') ?? 0),
                child: const Icon(Icons.image),
              ),

              10.gap,
              InkWell(
                onTap: () => context.read<ChatController>().sendMessages(int.tryParse(ticketId ?? '0') ?? 0, int.tryParse(userId ?? '0') ?? 0),
                child: const Icon(Icons.send_rounded),
              ),
              10.gap,
            ],
          ),
        ),
      ),
    );
  }
}
