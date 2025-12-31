import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/app_links.dart';
import '../../../../core/extension/gap.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../core/unit/app_color.dart';
import '../../../../core/unit/app_text_style.dart';
import '../../../../core/widget/widget_cache_network_image.dart';
import '../../../../injection_container.dart';
import '../../../auth/domain/model/user_model.dart';
import '../../../home/controller/home_controller.dart';

class ContainerDrawerHeader extends StatelessWidget {
  const ContainerDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if user is B2B Team
    final userTeam = sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.userTeam);
    final isB2B = userTeam == 'B2B Team';

    if (isB2B) {
      // For B2B users, fetch from backend-tmms (home data or user/me)
      // HomeController is now provided at LayoutScreen level
      return Consumer<HomeController>(
        builder: (context, homeController, child) {
          
          final technician = homeController.currentHomeData?.technician;
          final user = sl<Box<User>>().get(BoxKeys.userData);
          
          // Construct full URL for profile image if it's relative
          String? imageUrl;
          if (technician != null && technician.image != null && technician.image!.isNotEmpty) {
            if (technician.image!.startsWith('http://') || technician.image!.startsWith('https://')) {
              imageUrl = technician.image;
            } else {
              String baseUrl = AppLinks.serverTMMS;
              baseUrl = baseUrl.replaceAll('/api/v1', '');
              baseUrl = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
              imageUrl = '$baseUrl${technician.image}';
            }
          } else if (user?.profileImage != null && user!.profileImage!.isNotEmpty) {
            if (user.profileImage!.startsWith('http://') || user.profileImage!.startsWith('https://')) {
              imageUrl = user.profileImage;
            } else {
              String baseUrl = AppLinks.serverTMMS;
              baseUrl = baseUrl.replaceAll('/api/v1', '');
              baseUrl = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
              imageUrl = '$baseUrl${user.profileImage}';
            }
          } else if (user?.image != null && user!.image!.isNotEmpty) {
            if (user.image!.startsWith('http://') || user.image!.startsWith('https://')) {
              imageUrl = user.image;
            } else {
              String baseUrl = AppLinks.serverTMMS;
              baseUrl = baseUrl.replaceAll('/api/v1', '');
              baseUrl = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
              imageUrl = '$baseUrl${user.image}';
            }
          }
          
          // Get name from technician (backend-tmms) or fallback to user
          final displayName = technician != null
              ? '${technician.name ?? ''} ${technician.nameEnglish ?? ''}'.trim()
              : (user?.fullName ?? user?.name ?? '');
          
          // Get email from user (stored in Hive)
          final email = user?.email ?? '';
          
          // Get mobile from user
          final mobile = user?.mobileNumber != null && user?.countryCode != null
              ? '${user!.countryCode} ${user.mobileNumber}'
              : (user?.mobile ?? '');
          
          return Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                WidgetCachNetworkImage(
                  width: 70,
                  hieght: 70,
                  image: imageUrl ?? '',
                  radius: 1000,
                ),
                10.gap,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.style14B,
                      ),
                      if (email.isNotEmpty)
                        Text(
                          email,
                          style: AppTextStyle.style12.copyWith(color: AppColor.grey),
                        ),
                      if (mobile.isNotEmpty)
                        Text(
                          mobile,
                          style: AppTextStyle.style12.copyWith(color: AppColor.grey),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // For WeFix Team users, use existing Hive storage
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
}
