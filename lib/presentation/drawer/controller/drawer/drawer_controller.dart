import 'dart:developer';

import 'package:flutter/material.dart';

import '../../domain/content_enum.dart';
import '../../domain/model/contents_model.dart';
import '../../domain/usecase/content_usecase.dart';

class DrawerControllers extends ChangeNotifier with WidgetsBindingObserver {
  final ContentUsecase contentUsecase;
  DrawerControllers({required this.contentUsecase});

  ContentState contentState = ContentState.init;

  // Function get content
  ContentsModel? contentsModel;
  Future<void> getContent() async {
    try {
      contentState = ContentState.loading;
      final result = await contentUsecase.call();
      result.fold(
        (failure) {
          contentState = ContentState.failure;
          notifyListeners();
        },
        (content) {
          contentState = ContentState.success;
          contentsModel = content.data;
          notifyListeners();
        },
      );
    } catch (e) {
      contentState = ContentState.failure;
      log('Server Error In Content Section : $e');
      notifyListeners();
    }
  }
}
