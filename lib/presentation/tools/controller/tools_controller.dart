import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../core/providers/app_text.dart';
import '../../../core/widget/widget_daialog.dart';
import '../../ticktes_details/domain/model/tickets_details_model.dart';
import '../domain/tools_enum.dart';
import '../domain/usecase/tools_usecase.dart';

class ToolsController extends ChangeNotifier with WidgetsBindingObserver {
  final ToolsUsecase toolsUsecase;
  final ValueNotifier<ToolsStatus> toolsStatus = ValueNotifier(ToolsStatus.init);
  final ValueNotifier<DeleteToolsStatus> deleteToolsStatus = ValueNotifier(DeleteToolsStatus.init);
  bool startSearch = false;
  TextEditingController search = TextEditingController();
  List<TicketTool> tools = [];
  List<TicketTool> toolsSearch = [];

  ToolsController({required this.toolsUsecase});

  // Get Tools Function
  Future<void> getTools() async {
    toolsStatus.value = ToolsStatus.loading;
    try {
      final resultTools = await toolsUsecase.getDriverTools();
      resultTools.fold(
        (failure) {
          toolsStatus.value = ToolsStatus.failure;
          return SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: failure.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (success) {
          toolsStatus.value = ToolsStatus.success;
          tools = success.data!;
          notifyListeners();
        },
      );
    } catch (e) {
      toolsStatus.value = ToolsStatus.failure;
      log('Server Error in section Get Tools : $e');
    }
  }

  Future<void> deleteTool(int toolId) async {
    deleteToolsStatus.value = DeleteToolsStatus.loading;
    try {
      final resultDeleteTools = await toolsUsecase.deleteDriverTools(toolId);
      resultDeleteTools.fold(
        (failure) {
          deleteToolsStatus.value = DeleteToolsStatus.failure;
          return SmartDialog.show(
            builder:
                (context) => WidgetDilog(
                  isError: true,
                  title: AppText(context).warning,
                  message: failure.message,
                  cancelText: AppText(context).back,
                  onCancel: () => SmartDialog.dismiss(),
                ),
          );
        },
        (success) {
          deleteToolsStatus.value = DeleteToolsStatus.success;
          tools.removeWhere((element) => element.toolId == toolId);
          notifyListeners();
        },
      );
    } catch (e) {
      deleteToolsStatus.value = DeleteToolsStatus.failure;
      log('Server Error in section Delete Tools : $e');
    }
  }

  void searchTools(String query) {
    toolsSearch.clear();
    startSearch = true;
    toolsSearch = tools.where((element) => element.title?.toLowerCase().contains(query.toLowerCase()) ?? false).toList();
    notifyListeners();
  }

  void resetSearch() {
    search.clear();
    toolsSearch.clear();
    startSearch = false;
    notifyListeners();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
