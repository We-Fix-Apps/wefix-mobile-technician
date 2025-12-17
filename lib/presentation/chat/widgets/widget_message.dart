import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/extension/gap.dart';
import '../../../core/services/hive_services/box_kes.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_cache_network_image.dart';
import '../../../injection_container.dart';
import '../../auth/domain/model/user_model.dart';
import '../domain/model/chat_message_model.dart';

class WidgetMessage extends StatelessWidget {
  final Message message;
  const WidgetMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final profile = sl<Box<User>>().get(BoxKeys.userData);
    return Row(
      mainAxisAlignment: profile?.id != message.fromUserId ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: profile?.id == message.fromUserId ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        profile?.id == message.fromUserId ? const SizedBox() : const WidgetCachNetworkImage(width: 40, hieght: 40, image: ''),
        10.gap,
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7, minWidth: 50),
          child:
              message.image != '' && message.image != null
                  ? WidgetCachNetworkImage(width: 120, hieght: 120, image: message.image ?? '')
                  : Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor200,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                    ),
                    child: Text(message.message ?? '', style: AppTextStyle.style12),
                  ),
        ),
      ],
    );
  }
}
