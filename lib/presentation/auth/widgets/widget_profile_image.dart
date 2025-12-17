import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/unit/app_color.dart';
import '../../../core/widget/widget_cache_network_image.dart';
import '../controller/auth_provider.dart';

class WidgetProfileImage extends StatelessWidget {
  const WidgetProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Consumer<AuthProvider>(
            builder: (context, value, child) {
              return Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: AppColor.grey)),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child:
                      value.imagePath != null
                          ? Image.file(value.imagePath!)
                          : const WidgetCachNetworkImage(
                            image:
                                'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?b=1&s=612x612&w=0&k=20&c=hEPh7-WEAqHTHdQtPrfEN9-yYCiPGKvD32VZ5lcL6SU=',
                          ),
                ),
              );
            },
          ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [BoxShadow(blurRadius: 0, blurStyle: BlurStyle.outer, offset: Offset(0.1, 0))],
              color: Colors.white,
            ),
            child: Center(
              child: IconButton(
                splashRadius: 20,
                onPressed: () => context.read<AuthProvider>().pickImage(),
                icon: Icon(Icons.edit, color: AppColor.primaryColor, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
