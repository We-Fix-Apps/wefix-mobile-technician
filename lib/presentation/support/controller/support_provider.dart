import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../core/providers/app_text.dart';
import '../../../core/widget/widget_daialog.dart';
import '../domain/model/support_params.dart';
import '../domain/support_enum.dart';
import '../domain/usecase/support_usecase.dart';

class SupportProvider extends ChangeNotifier with WidgetsBindingObserver {
  final SupportUsecase supportUsecase;
  SupportProvider({required this.supportUsecase});

  final formKey = GlobalKey<FormState>();
  ValueNotifier<SupportState> supportState = ValueNotifier(SupportState.init);
  TextEditingController name = TextEditingController();
  TextEditingController digitCode = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController note = TextEditingController();

  // Change Mobile Number
  void modifyMobileNumber(String mobile, String code) {
    phone.text = mobile;
    digitCode.text = code;
    notifyListeners();
  }

  // Send Support Function
  Future<void> sendSupport() async {
    if (formKey.currentState!.validate()) {
      try {
        supportState.value = SupportState.loading;
        notifyListeners();
        Map<String, dynamic> json = {'Name': name.text, 'Mobile': digitCode.text + phone.text, 'Email': email.text, 'Note': note.text};
        final supportResponse = await supportUsecase.sendSupport(SupportParams.fromJson(json));
        supportResponse.fold(
          (failure) {
            supportState.value = SupportState.failure;
            SmartDialog.show(
              builder:
                  (context) => WidgetDilog(
                    isError: true,
                    title: AppText(context).warning,
                    message: AppText(context).failedtosendmessagetosupport,
                    cancelText: AppText(context).back,
                    onCancel: () => SmartDialog.dismiss(),
                  ),
            );
          },
          (success) {
            supportState.value = SupportState.success;
            clearForm();
            SmartDialog.show(
              builder:
                  (context) => WidgetDilog(
                    title: AppText(context).successfully,
                    message: AppText(context).successfullysenttosupportteam,
                    cancelText: AppText(context).back,
                    onCancel: () => SmartDialog.dismiss(),
                  ),
            );
          },
        );
      } catch (e) {
        supportState.value = SupportState.failure;
        log('Server Error In Support Section : $e');
      }
    }
  }

  void clearForm() {
    name.clear();
    email.clear();
    phone.clear();
    note.clear();
    supportState.value = SupportState.init;
    notifyListeners();
  }
}
