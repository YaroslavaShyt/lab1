import 'package:flutter/material.dart';
import 'package:lab1/app.dart';
import 'package:lab1/app/routing/app_router.dart';
import 'package:lab1/app/routing/inavigation_util.dart';
import 'package:lab1/app/routing/navigation_util.dart';
import 'package:provider/provider.dart';

void main() {
  final INavigationUtil navigationUtil = NavigationUtil();
  final AppRouter appRouter = AppRouter();

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
