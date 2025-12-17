import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/extension/gap.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../injection_container.dart';
import '../controller/chat_controller.dart';
import '../widgets/widget_send_message.dart';
import 'containers/container_messages.dart';

class ChatScreen extends StatelessWidget {
  final String? ticketId;
  final String? userId;
  const ChatScreen({super.key, this.ticketId, this.userId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) =>
              sl<ChatController>()
                ..connect(int.tryParse(ticketId ?? '0') ?? 0, int.tryParse(userId ?? '0') ?? 0)
                ..getAllMessages(int.tryParse(ticketId ?? '0') ?? 0),
      builder:
          (context, child) => Scaffold(
            appBar: AppBar(title: Text(AppText(context).helpCenterChat, style: AppTextStyle.style16B), centerTitle: true),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<ChatController>(
                builder:
                    (context, controller, child) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [10.gap, const ContainerMessages(), 10.gap, WidgetSendMessage(ticketId: ticketId, userId: userId)],
                    ),
              ),
            ),
          ),
    );
  }
}
