import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/app_image.dart';
import '../../../core/extension/gap.dart';
import '../../../core/loading/loading_tools.dart';
import '../../../core/providers/app_text.dart';
import '../../../core/unit/app_color.dart';
import '../../../core/unit/app_text_style.dart';
import '../../../core/widget/widget_empty.dart';
import '../../../core/widget/widget_text_field.dart';
import '../../../injection_container.dart';
import '../../ticktes_details/widgets/widget_product.dart';
import '../controller/tools_controller.dart';
import '../domain/tools_enum.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.iconTools, width: 25, height: 25),
              5.gap,
              Text(AppText(context).dailyMaterialAndTools, style: AppTextStyle.style16B),
            ],
          ),
          20.gap,
          ChangeNotifierProvider(
            create: (context) => sl<ToolsController>()..getTools(),
            builder:
                (context, child) => Expanded(
                  child: Consumer<ToolsController>(
                    builder:
                        (context, controller, child) => ValueListenableBuilder(
                          valueListenable: controller.toolsStatus,
                          builder: (context, value, child) {
                            switch (value) {
                              case ToolsStatus.loading:
                                return const LoadingTools();
                              case ToolsStatus.success:
                                return Column(
                                  children: [
                                    WidgetTextField(
                                      AppText(context).search,
                                      controller: controller.search,
                                      prefixIcon: Icon(Icons.search, color: AppColor.primaryColor),
                                      suffixIcon:
                                          controller.startSearch == true
                                              ? IconButton(onPressed: () => controller.resetSearch(), icon: const Icon(Icons.clear, color: AppColor.red))
                                              : const SizedBox.shrink(),
                                      onChanged: (query) => controller.searchTools(query),
                                    ),
                                    10.gap,
                                    Expanded(
                                      child:
                                          controller.startSearch == true
                                              ? controller.toolsSearch.isEmpty
                                                  ? WidgetEmptyScreen(
                                                    title: AppText(context).emptyTools,
                                                    desc: AppText(context).weNotFoundToolsLikeThisName,
                                                    icon: SvgPicture.asset(Assets.iconTools),
                                                  )
                                                  : ListView.separated(
                                                    itemCount: controller.toolsSearch.length,
                                                    separatorBuilder: (context, index) => 5.gap,
                                                    itemBuilder:
                                                        (context, index) => WidgetProduct(product: controller.toolsSearch[index], index: index, isTools: true),
                                                  )
                                              : controller.tools.isEmpty
                                              ? WidgetEmptyScreen(
                                                title: AppText(context).emptyTools,
                                                desc: AppText(context).youDontHaveToolsYet,
                                                icon: SvgPicture.asset(Assets.iconTools),
                                              )
                                              : ListView.separated(
                                                itemCount: controller.tools.length,
                                                separatorBuilder: (context, index) => 5.gap,
                                                itemBuilder: (context, index) => WidgetProduct(product: controller.tools[index], index: index, isTools: true),
                                              ),
                                    ),
                                  ],
                                );
                              case ToolsStatus.failure:
                                return ValueListenableBuilder(
                                  valueListenable: controller.toolsStatus,
                                  builder:
                                      (context, value, child) => WidgetEmptyScreen(
                                        title: '${AppText(context).errorWhenGet} ${AppText(context).dailyMaterialAndTools}',
                                        desc: AppText(context).pleasetryagainlater,
                                        icon: SvgPicture.asset(Assets.iconWarning),
                                        loading: value == ToolsStatus.loading,
                                        onPressed: () => context.read<ToolsController>().getTools(),
                                      ),
                                );
                              default:
                                return ValueListenableBuilder(
                                  valueListenable: controller.toolsStatus,
                                  builder:
                                      (context, value, child) => WidgetEmptyScreen(
                                        title: '${AppText(context).errorWhenGet} ${AppText(context).dailyMaterialAndTools}',
                                        desc: AppText(context).pleasetryagainlater,
                                        icon: SvgPicture.asset(Assets.iconWarning),
                                        loading: value == ToolsStatus.loading,
                                        onPressed: () => controller.getTools(),
                                      ),
                                );
                            }
                          },
                        ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
