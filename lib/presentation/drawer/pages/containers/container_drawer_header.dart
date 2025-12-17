import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/extension/gap.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../core/unit/app_color.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../core/widget/widget_cache_network_image.dart';
import '../../../../injection_container.dart';
import '../../../auth/domain/model/user_model.dart';

class ContainerDrawerHeader extends StatelessWidget {
  const ContainerDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: sl<Box<User>>().listenable(),
      builder: (context, value, child) {
        User? user = value.get(BoxKeys.userData);
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              WidgetCachNetworkImage(width: 70, hieght: 70, image: user?.image ?? '', radius: 1000),
              10.gap,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user?.name ?? '', overflow: TextOverflow.ellipsis, style: AppTextStyle.style14B),
                    Text(user?.email ?? '', style: AppTextStyle.style12.copyWith(color: AppColor.grey)),
                    Text(user?.mobile ?? '', style: AppTextStyle.style12.copyWith(color: AppColor.grey)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
