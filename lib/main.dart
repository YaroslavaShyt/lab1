import 'package:flutter/material.dart';
import 'package:lab1/app.dart';
import 'package:lab1/app/common/routing/app_router.dart';
import 'package:lab1/app/common/routing/inavigation_util.dart';
import 'package:lab1/app/common/routing/navigation_util.dart';
import 'package:lab1/app/common/di_manager.dart';
import 'package:provider/provider.dart';

void main() {
  final INavigationUtil navigationUtil = NavigationUtil();
  final AppRouter appRouter = AppRouter();
  initGetIt();
  runApp(MultiProvider(
    providers: [
      Provider.value(value: navigationUtil),
    ],
    child: CryptoApp(
      appRouter: appRouter,
      navigationUtil: navigationUtil,
    ),
  ));
}
