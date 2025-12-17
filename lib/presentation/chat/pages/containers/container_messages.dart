import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extension/gap.dart';
import '../../controller/chat_controller.dart';
import '../../widgets/widget_message.dart';

class ContainerMessages extends StatelessWidget {
  const ContainerMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatController>(
      builder:
          (context, controller, child) => Expanded(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ListView.separated(
                reverse: true,
                itemCount: controller.messages.reversed.toList().length,
                separatorBuilder: (context, index) => 5.gap,
                itemBuilder: (context, index) => WidgetMessage(message: controller.messages.reversed.toList()[index]),
              ),
            ),
          ),
    );
  }
}
