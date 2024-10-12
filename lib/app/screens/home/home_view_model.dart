import 'package:flutter/material.dart';
import 'package:lab1/app/common/routing/inavigation_util.dart';
import 'package:lab1/app/common/routing/routes.dart';
import 'package:lab1/app/services/encryption_service.dart';
import 'package:lab1/app/services/file_service.dart';
import 'package:lab1/app/services/user_service.dart';
import 'package:lab1/data/ciphers.dart';
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

  bool is2DKey = false;
  bool is3DKey = false;
  bool isKeyword = false;

  String selectedLangValue = "Українська";
  String selectedTypeValue = "Цезарь";
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
    if (selectedLangValue == "Українська") {
      resultData = isCheckedFirst
          ? _encryptionService.encryptUkrainian(
              data: data,
              key2D: is2DKey
                  ? key.split(',').map((item) => int.parse(item)).toList()
                  : null,
              key3D: is3DKey
                  ? key.split(',').map((item) => int.parse(item)).toList()
                  : null,
              keyword: isKeyword ? key : null,
              shift: selectedTypeValue == 'Цезарь' ? int.parse(key) : 0,
              cipher: selectedTypeValue == "Цезарь"
                  ? Ciphers.ceasar
                  : selectedTypeValue == "Тритеміус"
                      ? Ciphers.trithemius
                      : Ciphers.vigenere,
            )
          : _encryptionService.decryptUkrainian(
              data: data,
              key2D: is2DKey
                  ? key.split(',').map((item) => int.parse(item)).toList()
                  : null,
              key3D: is3DKey
                  ? key.split(',').map((item) => int.parse(item)).toList()
                  : null,
              keyword: isKeyword ? key : null,
              shift: selectedTypeValue == 'Цезарь' ? int.parse(key) : 0,
              cipher: selectedTypeValue == "Цезарь"
                  ? Ciphers.ceasar
                  : selectedTypeValue == "Тритеміус"
                      ? Ciphers.trithemius
                      : Ciphers.vigenere,
            );
    } else {
      resultData = isCheckedFirst
          ? _encryptionService.encryptEnglish(
              data: data,
              key2D: is2DKey
                  ? key.split(',').map((item) => int.parse(item)).toList()
                  : null,
              key3D: is3DKey
                  ? key.split(',').map((item) => int.parse(item)).toList()
                  : null,
              keyword: isKeyword ? key : null,
              shift: selectedTypeValue == 'Цезарь' ? int.parse(key) : 0,
              cipher: selectedTypeValue == "Цезарь"
                  ? Ciphers.ceasar
                  : selectedTypeValue == "Тритеміус"
                      ? Ciphers.trithemius
                      : Ciphers.vigenere,
            )
          : _encryptionService.decryptEnglish(
              data: data,
              key2D: is2DKey
                  ? key.split(',').map((item) => int.parse(item)).toList()
                  : null,
              key3D: is3DKey
                  ? key.split(',').map((item) => int.parse(item)).toList()
                  : null,
              keyword: isKeyword ? key : null,
              shift: selectedTypeValue == 'Цезарь' ? int.parse(key) : 0,
              cipher: selectedTypeValue == "Цезарь"
                  ? Ciphers.ceasar
                  : selectedTypeValue == "Тритеміус"
                      ? Ciphers.trithemius
                      : Ciphers.vigenere,
            );
    }
    if (resultData != null) {
      onSuccess();
    } else {
      onFailure();
    }
    notifyListeners();
  }

  void onOpenFileNextPressed() {
    if (selectedLangValue == "Українська") {
      resultData = isCheckedFirst
          ? _encryptionService.encryptUkrainian(
              data: '',
              key2D: key.split(',').map(int.parse).toList(),
              key3D: key.split(',').map(int.parse).toList(),
              keyword: key,
              shift: int.parse(key),
              cipher: selectedTypeValue == "Цезарь"
                  ? Ciphers.ceasar
                  : Ciphers.trithemius,
            )
          : _encryptionService.decryptUkrainian(
              data: '',
              key2D: key.split(',').map(int.parse).toList(),
              key3D: key.split(',').map(int.parse).toList(),
              keyword: key,
              shift: int.parse(key),
              cipher: selectedTypeValue == "Цезарь"
                  ? Ciphers.ceasar
                  : Ciphers.trithemius,
            );
    } else {
      resultData = isCheckedFirst
          ? _encryptionService.encryptEnglish(
              data: '',
              key2D: key.split(',').map(int.parse).toList(),
              key3D: key.split(',').map(int.parse).toList(),
              keyword: key,
              shift: int.parse(key),
              cipher: selectedTypeValue == "Цезарь"
                  ? Ciphers.ceasar
                  : Ciphers.trithemius,
            )
          : _encryptionService.decryptEnglish(
              data: '',
              key2D: key.split(',').map(int.parse).toList(),
              key3D: key.split(',').map(int.parse).toList(),
              keyword: key,
              shift: int.parse(key),
              cipher: selectedTypeValue == "Цезарь"
                  ? Ciphers.ceasar
                  : Ciphers.trithemius,
            );
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

  void onLanguageDropdownChange(String? val) {
    selectedLangValue = val!;
    notifyListeners();
  }

  void onTypeDropdownChange(String? val) {
    selectedTypeValue = val!;
    notifyListeners();
  }

  void onFirstCheckBoxChanged(bool? value) {
    isCheckedFirst = value ?? isCheckedFirst;
    isCheckedSecond = !value!;
    notifyListeners();
  }

  void onKeywordCheckBoxChanged(bool? value) {
    isKeyword = value ?? isKeyword;
    notifyListeners();
  }

  void on2DKeyCheckBoxChanged(bool? value) {
    is2DKey = value ?? is2DKey;
    notifyListeners();
  }

  void on3DKeyCheckBoxChanged(bool? value) {
    is3DKey = value ?? is3DKey;
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
