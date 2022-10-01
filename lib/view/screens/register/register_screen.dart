import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/core/components/default_button.dart';
import 'package:payment_integration/core/components/default_form_field.dart';
import 'package:payment_integration/core/constants/payment_constants.dart';
import 'package:payment_integration/view_model/cubits/register_cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  //form controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  //form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is PaymentTokenSuccessed) {
            Navigator.pushNamed(context, 'payOptionsScreen');
          }
        },
        builder: (context, state) {
          RegisterCubit myCubit = RegisterCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Register Screen'),
                centerTitle: true,
                backgroundColor: Colors.redAccent,
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 25.0,
                    ),
                    child: Column(
                      children: [
                        defaultFormField(
                          controller: firstNameController,
                          type: TextInputType.name,
                          validationText: 'please enter the first name',
                          icon: Icons.person,
                          label: 'First Name',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: lastNameController,
                          type: TextInputType.name,
                          validationText: 'please enter the last name',
                          icon: Icons.person,
                          label: 'Last Name',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validationText: 'please enter the email',
                          icon: Icons.email,
                          label: 'Email',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validationText: 'please enter the phone number',
                          icon: Icons.phone,
                          label: 'Phone Number',
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: priceController,
                          type: TextInputType.number,
                          validationText: 'please enter the price',
                          icon: Icons.price_check,
                          label: 'Price',
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        myCubit.loading
                            ? const CircularProgressIndicator(
                                color: Colors.redAccent,
                              )
                            : defaultButton(
                                text: 'PAY',
                                buttonHeight: 60.0,
                                buttonColor: Colors.redAccent,
                                textColor: Colors.white,
                                fontSize: 30.0,
                                function: () {
                                  myCubit.getAuthData(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    price: priceController.text,
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
