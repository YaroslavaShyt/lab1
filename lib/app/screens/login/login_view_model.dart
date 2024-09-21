import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab1/app/routing/inavigation_util.dart';
import 'package:lab1/app/routing/routes.dart';
import 'package:lab1/app/services/user_service.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({
    required INavigationUtil navigationUtil,
    required UserService userService,
  })  : _navigationUtil = navigationUtil,
        _userService = userService;

  final INavigationUtil _navigationUtil;
  final UserService _userService;

  String name = '';
  String surname = '';
  String group = '';
  String password = '';

  VoidCallback get onOKPressed => _navigationUtil.navigateBack;

  void onLoginButtonPressed({required VoidCallback onError}) {
    final bool isUserSet = _userService.setUser(
      name: name,
      surname: surname,
      group: group,
    );
    if (isUserSet) {
      _navigationUtil.navigateToAndReplace(routeHome);
    } else {
      onError();
    }
  }
}
