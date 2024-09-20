import 'package:flutter/material.dart';
import 'package:lab1/app/common/widgets/main_button.dart';
import 'package:lab1/app/screens/login/login_view_model.dart';
import 'package:lab1/app/screens/login/widgets/form_text_field.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    required this.viewModel,
    super.key,
  });

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: kIsWeb ? 500 : MediaQuery.of(context).size.height - 300,
            width: kIsWeb ? 400 : MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Caesar Cipher",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          FormTextField(
                              errorText: viewModel.emailError,
                              label: 'Email',
                              onChanged: (value) =>
                                  viewModel.email = value,
                              ),
                          const SizedBox(height: 40),
                          FormTextField(
                            errorText: viewModel.passwordError,
                            label: 'Password',
                            onChanged: (value) =>
                                viewModel.password = value,
                            obscureText: true,
                          ),
                          const SizedBox(height: 40),
                          MainButton(
                              onButtonPressed:
                                 viewModel.onLoginButtonPressed,
                              )
                        ],
                      ))
                ])),
      ),
    );
  }
}
