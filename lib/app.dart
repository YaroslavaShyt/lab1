import 'package:flutter/material.dart';
import 'package:lab1/app/common/routing/app_router.dart';
import 'package:lab1/app/common/routing/inavigation_util.dart';
import 'package:lab1/app/common/routing/routes.dart';
import 'package:provider/provider.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({
    required INavigationUtil navigationUtil,
    required AppRouter appRouter,
    super.key,
  })  : 
        _router = appRouter;

  final AppRouter _router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _router.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      navigatorKey: context.read<INavigationUtil>().navigatorKey,
      title: 'Symmetric Cryptography System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: routeHome,
    );
  }
}
