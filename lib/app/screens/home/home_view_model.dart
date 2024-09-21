import 'package:flutter/material.dart';
import 'package:lab1/app/common/routing/inavigation_util.dart';
import 'package:lab1/app/common/routing/routes.dart';
import 'package:lab1/app/services/encryption_service.dart';
import 'package:lab1/app/services/file_service.dart';
import 'package:lab1/app/services/user_service.dart';
import 'package:lab1/data/user.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required INavigationUtil navigationUtil,
    required UserService userService,
    required EncryptionService encryptionService,
    required FileService fileService,
  })  : _navigationUtil = navigationUtil,
        _encryptionService = encryptionService,
        _userService = userService,
        _fileService = fileService;

  final INavigationUtil _navigationUtil;
  final UserService _userService;
  final EncryptionService _encryptionService;
  final FileService _fileService;

  bool isCreateFileSelected = true;
  bool isOpenFileSelected = false;
  bool isCheckedFirst = true;
  bool isCheckedSecond = false;

  String selectedValue = "Українська";
  String key = '';
  String data = '';
  String fileName = '';

  String? resultData;

  void onSavePressed() {
    _fileService.saveFile(fileName, resultData!);
  }

  void onPrintPressed() {
    _fileService.printFile();
  }

  Future<void> onOpenFile() async {
    data = await _fileService.openFile() ?? '';
    notifyListeners();
  }

  void onCreateFileNextPressed(
    VoidCallback onSuccess,
    VoidCallback onFailure,
  ) {
    if (selectedValue == "Українська") {
      resultData = isCheckedFirst
          ? _encryptionService.encryptUkrainian(
              data: data, shift: int.parse(key))
          : _encryptionService.decryptUkrainian(
              data: data, shift: int.parse(key));
    } else {
      resultData = isCheckedFirst
          ? _encryptionService.encryptEnglish(data: data, shift: int.parse(key))
          : _encryptionService.decryptEnglish(
              data: data, shift: int.parse(key));
    }
    if (resultData != null) {
      onSuccess();
    } else {
      onFailure();
    }
    notifyListeners();
  }

  void onOpenFileNextPressed() {
    if (selectedValue == "Українська") {
      resultData = isCheckedFirst
          ? _encryptionService.encryptUkrainian(data: '', shift: int.parse(key))
          : _encryptionService.decryptUkrainian(
              data: '', shift: int.parse(key));
    } else {
      resultData = isCheckedFirst
          ? _encryptionService.encryptEnglish(data: '', shift: int.parse(key))
          : _encryptionService.decryptEnglish(data: '', shift: int.parse(key));
    }
    notifyListeners();
  }

  void onFileNameChanges(String val) {
    fileName = val;
  }

  void onDataChanges(String val) {
    data = val;
  }

  void onKeyChanges(String val) {
    key = val;
  }

  void onDropdownChange(String? val) {
    selectedValue = val!;
    notifyListeners();
  }

  void onFirstCheckBoxChanged(bool? value) {
    isCheckedFirst = value ?? isCheckedFirst;
    isCheckedSecond = !value!;
    notifyListeners();
  }

  void onSecondCheckBoxChanged(bool? value) {
    isCheckedSecond = value ?? isCheckedSecond;
    isCheckedFirst = !value!;
    notifyListeners();
  }

  void onCreateFilePressed() {
    isCreateFileSelected = true;
    isOpenFileSelected = false;
    resultData = null;
    notifyListeners();
  }

  void onOpenFilePressed() {
    isOpenFileSelected = true;
    isCreateFileSelected = false;
    resultData = null;
    notifyListeners();
  }

  User get userData => _userService.userData!;

  void onLogoutPressed() => _navigationUtil.navigateToAndMakeRoot(routeLogin);
  Function() get onOKPressed => _navigationUtil.navigateBack;
}
