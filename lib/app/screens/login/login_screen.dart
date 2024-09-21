import 'package:flutter/material.dart';
import 'package:lab1/app/common/widgets/main_button.dart';
import 'package:lab1/app/screens/login/login_view_model.dart';
import 'package:lab1/app/common/widgets/form_text_field.dart';

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
        child: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 300,
                vertical: 30,
              ),
              padding: const EdgeInsetsDirectional.all(30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 2,
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
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            FormTextField(
                              label: 'Name',
                              onChanged: (value) => viewModel.name = value,
                            ),
                            const SizedBox(height: 40),
                            FormTextField(
                              label: 'Surname',
                              onChanged: (value) => viewModel.surname = value,
                            ),
                            const SizedBox(height: 40),
                            FormTextField(
                              label: 'Group',
                              onChanged: (value) => viewModel.group = value,
                            ),
                            const SizedBox(height: 40),
                            FormTextField(
                              label: 'Password',
                              onChanged: (value) => viewModel.password = value,
                              obscureText: true,
                            ),
                            const SizedBox(height: 40),
                            MainButton(
                              onButtonPressed: () =>
                                  viewModel.onLoginButtonPressed(
                                onError: () => _onError(context),
                              ),
                            )
                          ],
                        ))
                  ])),
        ),
      ),
    );
  }

  void _onError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Oops"),
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.green,
          ),
          content: const Text("Could not login with these credentials"),
          actions: [
            Center(
              child: TextButton(
                onPressed: viewModel.onOKPressed,
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.green.shade100),
                  foregroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text("OK"),
              ),
            ),
          ],
        );
      },
    );
  }
}
