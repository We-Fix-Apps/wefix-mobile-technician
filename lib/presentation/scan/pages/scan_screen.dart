import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../core/unit/app_color.dart';
import '../../../injection_container.dart';
import '../controller/scan_provider.dart';
import '../widgets/widget_scan_info.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<ScanProvider>(),
      builder:
          (context, child) => ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: QRView(
                  key: context.read<ScanProvider>().qrKey,
                  overlay: QrScannerOverlayShape(borderColor: AppColor.white),
                  onQRViewCreated: (result) => context.read<ScanProvider>().onQRViewCreated(context, result),
                ),
              ),
              const WidgetScanInfo(),
            ],
          ),
    );
  }
}
