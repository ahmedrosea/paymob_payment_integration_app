import 'package:flutter/material.dart';
import 'package:payment_integration/view/screens/pay_options/credit_card_screen.dart';
import 'package:payment_integration/view/screens/pay_options/pay_options_screen.dart';
import 'package:payment_integration/view/screens/pay_options/ref_code_screen.dart';
import 'package:payment_integration/view/screens/register/register_screen.dart';
import 'package:payment_integration/view_model/database/network/dio_helper.dart';

void main() async {
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'registerScreen': (context) => RegisterScreen(),
        'payOptionsScreen': (context) => const PayOptionsScreen(),
        'refCodeScreen': (context) => const RefCodeScreen(),
        'creditCardScreen': (context) => const CreditCardScreen(),
      },
      home: RegisterScreen(),
    );
  }
}
