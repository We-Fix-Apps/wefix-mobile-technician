import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/loading/loading_contents.dart';
// import '../../../core/providers/language_provider/l10n_provider.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/providers/language_provider/l10n_provider.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/language_button.dart';
import '../../../core/widget/widget_empty.dart';
import '../../../injection_container.dart';
import '../controller/drawer/drawer_controller.dart';
import '../domain/content_enum.dart';

class ContentScreen extends StatelessWidget {
  final String title;
  const ContentScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    String lang = context.read<LanguageProvider>().lang ?? 'en';

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(title, style: AppTextStyle.style16B), actions: const [LanguageButton()]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangeNotifierProvider(
              create: (context) => sl<DrawerControllers>()..getContent(),
              child: Consumer<DrawerControllers>(
                builder: (context, value, child) {
                  switch (value.contentState) {
                    case ContentState.loading:
                      return const LoadingContents();
                    case ContentState.success:
                      return HtmlWidget(
                        title.toLowerCase().contains('terms') == true
                            ? lang == 'ar'
                                ? value.contentsModel?.termsAndConditionsAr ?? ''
                                : value.contentsModel?.termsAndConditions ?? ''
                            : lang == 'ar'
                            ? value.contentsModel?.privacyPolicyAr ?? ''
                            : value.contentsModel?.privacyPolicy ?? '',
                        textStyle: AppTextStyle.style14,
                        onLoadingBuilder: (context, element, loadingProgress) => const Center(child: CircularProgressIndicator()),
                        onErrorBuilder: (context, element, error) => Center(child: Text(AppText(context).errorloadingcontent)),
                      );
                    case ContentState.failure:
                      return WidgetEmptyScreen(
                        title: '${AppText(context).errorWhenGet} $title',
                        desc: AppText(context).pleasetryagainlater,
                        icon: SvgPicture.asset(Assets.iconWarning),
                        onPressed: () => context.read<DrawerControllers>().getContent(),
                      );
                    default:
                      return WidgetEmptyScreen(
                        title: '${AppText(context).errorWhenGet} $title',
                        desc: AppText(context).pleasetryagainlater,
                        icon: SvgPicture.asset(Assets.iconWarning),
                        onPressed: () => context.read<DrawerControllers>().getContent(),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
