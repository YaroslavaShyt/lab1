import 'package:flutter/material.dart';
import 'package:lab1/app/common/routing/inavigation_util.dart';
import 'package:lab1/app/common/routing/routes.dart';
import 'package:lab1/app/services/user_service.dart';
import 'package:lab1/data/user.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(
      {required INavigationUtil navigationUtil,
      required UserService userService})
      : _navigationUtil = navigationUtil,
        _userService = userService;

  final INavigationUtil _navigationUtil;
  final UserService _userService;

  bool isCreateFileSelected = false;
  bool isOpenFileSelected = false;

  void onCreateFilePressed() {
    isCreateFileSelected = true;
    isOpenFileSelected = false;
    notifyListeners();
  }

  void onOpenFilePressed() {
    isOpenFileSelected = true;
    isCreateFileSelected = false;
    notifyListeners();
  }

  User get userData => User(
        group: "ТВ-13",
        name: "Ярослава",
        surname: "Шит",
      ); //_userService.userData!;

  void onLogoutPressed() => _navigationUtil.navigateToAndMakeRoot(routeLogin);
  Function() get onOKPressed => _navigationUtil.navigateBack;
}
