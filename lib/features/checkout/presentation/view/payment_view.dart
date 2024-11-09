import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../core/services/paymob_manger/paymob_manger.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/utils/constants.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  static const String routeName = '/paymentView';
  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String? url;
  late WebViewController controller;
  @override
  initState() {
    super.initState();

    _loadPaymentUrl();
  }

  void _loadPaymentUrl() async {

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(

        NavigationDelegate(
          onProgress: (int progress) {},

          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },

        ),
      );
    log(total.toString());
    String paymentKey =
        await PaymobManager().getPaymentKey(total.toInt(), 'EGP');

    setState(() {
      url = paymentKey;
      controller.loadRequest(Uri.parse(
          'https://accept.paymobsolutions.com/api/acceptance/iframes/841393?payment_token=$url'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: url == null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : WebViewWidget(controller: controller),
    );
  }
}
