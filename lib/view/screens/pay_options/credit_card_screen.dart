import 'package:flutter/material.dart';
import 'package:payment_integration/core/constants/payment_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            'https://accept.paymob.com/api/acceptance/iframes/679385?payment_token=$paymentToken',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
