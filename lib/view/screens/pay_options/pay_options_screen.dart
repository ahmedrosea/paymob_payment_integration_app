import 'package:flutter/material.dart';

class PayOptionsScreen extends StatelessWidget {
  const PayOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'creditCardScreen');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(7, 7),
                            spreadRadius: 1,
                            blurRadius: 10.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(-1, -1),
                            spreadRadius: 1,
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/card.png',
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Text(
                          'Credit Card',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'refCodeScreen');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(7, 7),
                            spreadRadius: 1,
                            blurRadius: 10.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: const Offset(-1, -1),
                            spreadRadius: 1,
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/machine.png',
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Text(
                          'Reference Code',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
