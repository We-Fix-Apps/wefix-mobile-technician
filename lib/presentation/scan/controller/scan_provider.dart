import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../core/providers/app_text.dart';
import '../../../core/router/router_key.dart';
import '../../../core/widget/widget_daialog.dart';
import '../domain/usecase/scan_usecase.dart';

class ScanProvider extends ChangeNotifier with WidgetsBindingObserver {
  final ScanUsecase scanUsecase;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  bool loading = false;
  bool isScanHandled = false;
  ScanProvider({required this.scanUsecase});

  // Function to get result from QR code scanner
  void onQRViewCreated(BuildContext context, QRViewController ctrl) {
    controller = ctrl;
    controller?.scannedDataStream.listen((scanData) async {
      if (!isScanHandled) {
        isScanHandled = true;
        result = scanData;
        await controller?.pauseCamera();
        scanQR(context);
      }
    });
  }

  // Scan Qrcode And Get ID
  void scanQR(BuildContext context) async {
    try {
      SmartDialog.showLoading(msg: AppText(context, isFunction: true).loading);
      final resultDeleteTools = await scanUsecase(result?.code ?? '');
      resultDeleteTools.fold(
        (failure) {
          SmartDialog.dismiss();
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
          SmartDialog.dismiss();
          context.push('${RouterKey.layout + RouterKey.requestDetails}?id=${success.data!}');
          notifyListeners();
        },
      );
    } catch (e) {
      SmartDialog.dismiss();
      log('Server Error in section scanQR : $e');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
