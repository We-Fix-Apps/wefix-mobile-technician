import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../function/hex_color.dart';
import '../unit/app_text_style.dart';

class WebviewScreen extends StatelessWidget {
  final String? url;
  final String? title;

  const WebviewScreen({super.key, this.url, this.title});

  WebViewController _createController(BuildContext context) {
    final controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..clearCache()
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (_) => SmartDialog.showLoading(msg: 'loading...'),
              onPageFinished: (_) => SmartDialog.dismiss(),
              onWebResourceError: (_) => SmartDialog.dismiss(),
            ),
          )
          ..loadRequest(Uri.parse(url ?? 'https://example.com'));
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    final controller = _createController(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true, backgroundColor: HexColor.fromHex('#ffe9d7'), title: Text(title ?? '', style: AppTextStyle.style16B)),
      body: WebViewWidget(controller: controller),
    );
  }
}
