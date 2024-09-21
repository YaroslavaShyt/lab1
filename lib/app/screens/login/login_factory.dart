import 'package:flutter/material.dart';
import 'package:lab1/app/routing/inavigation_util.dart';
import 'package:lab1/app/screens/login/login_screen.dart';
import 'package:lab1/app/screens/login/login_view_model.dart';
import 'package:lab1/app/services/user_service.dart';
import 'package:lab1/di_manager.dart';
import 'package:provider/provider.dart';

class LoginFactory {
  static Widget build() {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(
        navigationUtil: context.read<INavigationUtil>(),
        userService: diManager.get<UserService>(),
      ),
      child: Consumer<LoginViewModel>(builder: (context, model, child) {
        return LoginScreen(
          viewModel: model,
        );
      }),
    );
  }
}
