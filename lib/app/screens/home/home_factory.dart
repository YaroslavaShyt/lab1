import 'package:flutter/material.dart';
import 'package:lab1/app/common/routing/inavigation_util.dart';
import 'package:lab1/app/screens/home/home_screen.dart';
import 'package:lab1/app/screens/home/home_view_model.dart';
import 'package:lab1/app/services/encryption_service.dart';
import 'package:lab1/app/services/file_service.dart';
import 'package:lab1/app/services/user_service.dart';
import 'package:lab1/app/common/di_manager.dart';
import 'package:provider/provider.dart';

class HomeFactory {
  static Widget build() {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
          navigationUtil: context.read<INavigationUtil>(),
          userService: diManager.get<UserService>(),
          fileService: diManager.get<FileService>(),
          encryptionService: diManager.get<EncryptionService>()),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) {
          return HomeScreen(
            viewModel: model,
          );
        },
      ),
    );
  }
}
