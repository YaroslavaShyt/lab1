import 'package:flutter/material.dart';
import 'package:lab1/app/screens/login/login.dart';
import 'package:lab1/app/screens/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginFactory{
  static Widget build(){
    final LoginViewModel loginViewModel = LoginViewModel(navigationUtil: navigationUtil);
    return ChangeNotifierProvider.value(
      value: loginViewModel,
      child: LoginScreen(
        viewModel: loginViewModel,
      ));
  }
}