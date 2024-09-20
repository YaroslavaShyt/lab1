import 'package:flutter/material.dart';
import 'package:lab1/app/routing/inavigation_util.dart';
import 'package:lab1/app/routing/routes.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required INavigationUtil navigationUtil})
      : _navigationUtil = navigationUtil;
  final INavigationUtil _navigationUtil;

  String email = '';
  String password = '';

  String? emailError;
  String? passwordError;

  void onLoginButtonPressed(){
    _navigationUtil.navigateTo(routeHome);
  }

  
}
