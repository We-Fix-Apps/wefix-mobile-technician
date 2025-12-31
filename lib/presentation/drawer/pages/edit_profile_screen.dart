import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_links.dart';
import '../../../core/extension/gap.dart';
import '../../../core/mixin/validation_mixin.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/services/hive_services/box_kes.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/button/app_button.dart';
import '../../../core/widget/language_button.dart';
import '../../../core/widget/widget_phone_field.dart';
import '../../../core/widget/widget_cache_network_image.dart';
import '../../../core/widget/widget_text_field.dart';
import '../../../core/widget/widget_dropdown.dart';
import '../../../injection_container.dart';
import '../../auth/domain/model/user_model.dart';
import '../controller/edit_profile/edit_profile_controller.dart';
import '../widgets/widget_edit_image_profile.dart';

class EditProfileScreen extends StatelessWidget with FormValidationMixin {
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<EditProfileController>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppText(context).profile, style: AppTextStyle.style16B),
          actions: const [LanguageButton()],
          centerTitle: true,
        ),
        body: Consumer<EditProfileController>(
          builder: (context, controller, child) {
            // Check if user is B2B
            final isB2B = controller.isB2BUser;
            
            // Get user data - try controller first, then fallback to Hive
            User? user = isB2B ? controller.currentProfile : null;
            if (user == null) {
              // Fallback to Hive storage if controller doesn't have data
              user = sl<Box<User>>().get(BoxKeys.userData);
            }
            
            // For B2B users, show loading state while fetching
            if (isB2B && controller.profileStatus.value == ProfileStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (user == null && isB2B) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppText(context).loading,
                      style: AppTextStyle.style14,
                    ),
                    20.gap,
                    AppButton.text(
                      text: AppText(context).continues,
                      onPressed: () => controller.loadProfile(),
                    ),
                  ],
                ),
              );
            }
            
            // If still no user data, show error
            if (user == null) {
              return Center(
                child: Text(
                  'No user data available',
                  style: AppTextStyle.style14,
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Form(
                child:  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColor.primaryColor.withOpacity(0.3)),
                      ),
                    
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Two-column layout: User image/name on left, Company logo/name on right
                      10.gap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Left column: User image and name
                          Expanded(
                            child: Column(
                              children: [
                                // User image - editable for B2B users
                                if (isB2B)
                                  GestureDetector(
                                    onTap: () => controller.pickImage(),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: AppColor.grey),
                                      ),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        child: controller.imagePath != null
                                            ? Image.file(
                                                controller.imagePath!,
                                                fit: BoxFit.cover,
                                                width: 100,
                                                height: 100,
                                              )
                                            : WidgetCachNetworkImage(
                                                image: _getImageUrl(user.profileImage ?? user.image ?? ''),
                                              ),
                                      ),
                                    ),
                                  )
                                else
                                  Container(
                                    width: 100,
                                    height: 100,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: AppColor.grey),
                                    ),
                                    child: WidhetEditImageProfile(imageUrl: user.image ?? ''),
                                  ),
                                10.gap,
                                // User name
                                if (isB2B) ...[
                                  if ((user.fullName ?? '').isNotEmpty || (user.fullNameEnglish ?? '').isNotEmpty)
                                    Text(
                                      '${user.fullName ?? ''} ${user.fullNameEnglish ?? ''}'.trim(),
                                      style: AppTextStyle.style14B.copyWith(color: AppColor.primaryColor),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  else
                                    Text(
                                      user.name ?? 'User',
                                      style: AppTextStyle.style14B.copyWith(color: AppColor.primaryColor),
                                      textAlign: TextAlign.center,
                                    ),
                                ] else ...[
                                  Text(
                                    user.fullName ?? user.name ?? 'User',
                                    style: AppTextStyle.style14B.copyWith(color: AppColor.primaryColor),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          // Right column: Company logo and name (for B2B users)
                          if (isB2B && controller.companyInfo != null)
                            Expanded(
                              child: Column(
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final company = controller.companyInfo;
                                      if (company?.logo != null && company!.logo!.isNotEmpty) {
                                        // Construct full URL if logo path is relative
                                        String? logoUrl;
                                        final companyLogo = company.logo!;
                                        if (companyLogo.startsWith('http://') || companyLogo.startsWith('https://')) {
                                          logoUrl = companyLogo;
                                        } else {
                                          String baseUrl = AppLinks.serverTMMS;
                                          if (baseUrl.endsWith('/api/v1')) {
                                            baseUrl = baseUrl.replaceAll('/api/v1', '');
                                          } else if (baseUrl.endsWith('/api/v1/')) {
                                            baseUrl = baseUrl.replaceAll('/api/v1/', '');
                                          }
                                          baseUrl = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
                                          logoUrl = '$baseUrl$companyLogo';
                                        }
                                        
                                        return Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey[200],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: WidgetCachNetworkImage(
                                              width: 100,
                                              hieght: 100,
                                              radius: 0,
                                              boxFit: BoxFit.cover,
                                              image: logoUrl,
                                            ),
                                          ),
                                        );
                                      }
                                      return Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[200],
                                        ),
                                        child: Icon(Icons.business, size: 50, color: Colors.grey[400]),
                                      );
                                    },
                                  ),
                                  10.gap,
                                  // Company name
                                  Builder(
                                    builder: (context) {
                                      final company = controller.companyInfo;
                                      if (company != null) {
                                        // Get company name based on language
                                        final locale = Localizations.localeOf(context);
                                        final companyName = locale.languageCode == 'ar' && company.nameArabic != null && company.nameArabic!.isNotEmpty
                                            ? company.nameArabic
                                            : (company.nameEnglish ?? company.name);
                                        
                                        if (companyName != null && companyName.isNotEmpty) {
                                          return Text(
                                            companyName,
                                            style: AppTextStyle.style14.copyWith(color: AppColor.grey),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          );
                                        }
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      // Display user ID and type below the two columns
                      if (user.id != null) ...[
                        10.gap,
                        Text('#${user.id}', style: AppTextStyle.style12.copyWith(color: AppColor.grey)),
                      ],
                      5.gap,
                      // Display user type (B2B Team or WeFix Team)
                      Text(
                        isB2B ? AppText(context).b2bTeam : AppText(context).weFixTeam,
                        style: AppTextStyle.style12B.copyWith(color: AppColor.primaryColor),
                      ),
                      5.gap,
                      // Full Name (Arabic) - editable for B2B
                      Text(AppText(context).fullNameArabic, style: AppTextStyle.style14B),
                      5.gap,
                      WidgetTextField(
                        AppText(context).enterYourName,
                        controller: isB2B
                            ? controller.firstnameController
                            : TextEditingController(text: user.fullName ?? user.name ?? ''),
                        readOnly: !isB2B,
                        validator: (p0) => validateNull(context, p0),
                      ),
                      // Full Name (English) - editable for B2B
                      if (isB2B) ...[
                        5.gap,
                        Text(AppText(context).fullNameEnglish, style: AppTextStyle.style14B),
                        5.gap,
                        WidgetTextField(
                          'Enter full name in English',
                          controller: controller.lastnameController,
                          readOnly: false,
                          validator: (p0) => validateNull(context, p0),
                        ),
                      ],
                      5.gap,
                      // Email (editable for B2B)
                      Text(AppText(context).email, style: AppTextStyle.style14B),
                      5.gap,
                      WidgetTextField(
                        'example@example.com',
                        controller: isB2B
                            ? controller.emailController
                            : TextEditingController(text: user.email),
                        readOnly: !isB2B,
                        keyboardType: TextInputType.emailAddress,
                        validator: (p0) => validateEmail(context, p0),
                      ),
                      5.gap,
                      // Mobile (editable for B2B)
                      Text(AppText(context).mobile, style: AppTextStyle.style14B),
                      5.gap,
                      if (isB2B)
                        WidgetPhoneField(
                          phoneController: controller.phoneController,
                          onCountryChanged: (phoneNumber) => controller.onPhoneNumberChanged(phoneNumber),
                          code: _getCountryCodeFromUser(user),
                        )
                      else
                        WidgetPhoneField(
                          phoneController: TextEditingController(
                            text: user.mobile?.replaceAll('+962', '') ?? '',
                          ),
                        ),
                      5.gap,
                      // Gender (editable for B2B)
                      Text(AppText(context).gender, style: AppTextStyle.style14B),
                      5.gap,
                      if (isB2B)
                        Builder(
                          builder: (context) {
                            final appText = AppText(context);
                            // Normalize gender value to match dropdown items ('Male' or 'Female')
                            String? normalizedGender;
                            final currentGender = controller.selectedGender;
                            if (currentGender != null && currentGender.isNotEmpty) {
                              // Normalize to match the dropdown items
                              final lowerGender = currentGender.toLowerCase();
                              if (lowerGender == 'male' || lowerGender == 'm') {
                                normalizedGender = 'Male';
                              } else if (lowerGender == 'female' || lowerGender == 'f') {
                                normalizedGender = 'Female';
                              } else {
                                normalizedGender = currentGender; // Keep original if doesn't match
                              }
                            }
                            
                            return WidgetDropDown<String>(
                              items: const ['Male', 'Female'],
                              value: normalizedGender,
                              hintText: appText.selectGender,
                              itemLabel: (value) {
                                if (value == 'Male') return appText.male;
                                if (value == 'Female') return appText.female;
                                return value;
                              },
                              onChanged: (value) {
                                controller.onGenderChanged(value);
                              },
                            );
                          },
                        )
                      else
                        // Show gender as read-only for WeFix Team users
                        WidgetTextField(
                          controller.currentProfile?.gender ?? user.gender ?? '',
                          readOnly: true,
                        ),
                      // Save button for B2B users
                      if (isB2B) ...[
                        30.gap,
                        ValueListenableBuilder<ProfileStatus>(
                          valueListenable: controller.profileStatus,
                          builder: (context, status, child) {
                            return AppButton.text(
                              text: AppText(context).continues,
                              loading: status == ProfileStatus.loading,
                              onPressed: () async {
                                final success = await controller.updateProfile();
                                if (success) {
                                  SmartDialog.showToast(
                                    'Profile updated successfully',
                                    alignment: Alignment.center,
                                  );
                                } else {
                                  SmartDialog.showToast(
                                    'Failed to update profile',
                                    alignment: Alignment.center,
                                  );
                                }
                              },
                            );
                          },
                        ),
                        20.gap,
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _getImageUrl(String imagePath) {
    if (imagePath.isEmpty) return '';
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return imagePath;
    }
    String baseUrl = AppLinks.serverTMMS;
    baseUrl = baseUrl.replaceAll('/api/v1', '');
    baseUrl = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
    return '$baseUrl$imagePath';
  }
  
  String? _getCountryCodeFromUser(User? user) {
    if (user?.countryCode != null) {
      // Map country dial codes to ISO codes
      // This covers the most common countries in the region and worldwide
      final countryCodeMap = {
        '+962': 'JO', // Jordan
        '+971': 'AE', // UAE
        '+964': 'IQ', // Iraq
        '+966': 'SA', // Saudi Arabia
        '+974': 'QA', // Qatar
        '+970': 'PS', // Palestine
        '+965': 'KW', // Kuwait
        '+968': 'OM', // Oman
        '+961': 'LB', // Lebanon
        '+963': 'SY', // Syria
        '+20': 'EG',  // Egypt
        '+212': 'MA', // Morocco
        '+213': 'DZ', // Algeria
        '+216': 'TN', // Tunisia
        '+218': 'LY', // Libya
        '+249': 'SD', // Sudan
        '+967': 'YE', // Yemen
        '+1': 'US',   // USA/Canada
        '+44': 'GB',  // UK
        '+33': 'FR',  // France
        '+49': 'DE',  // Germany
        '+39': 'IT',  // Italy
        '+34': 'ES',  // Spain
        '+7': 'RU',   // Russia
        '+86': 'CN',  // China
        '+91': 'IN',  // India
        '+81': 'JP',  // Japan
        '+82': 'KR',  // South Korea
        '+61': 'AU',  // Australia
        '+27': 'ZA',  // South Africa
        '+90': 'TR',  // Turkey
        '+30': 'GR',  // Greece
      };
      
      // Normalize country code (ensure it starts with +)
      String normalizedCode = user!.countryCode!.startsWith('+') 
          ? user.countryCode! 
          : '+${user.countryCode}';
      
      final isoCode = countryCodeMap[normalizedCode];
      if (isoCode != null) return isoCode;
      
      // Default to Jordan if not found
      return 'JO';
    }
    return 'JO'; // Default to Jordan
  }
}
