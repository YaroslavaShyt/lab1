import 'package:flutter/material.dart';
import 'package:lab1/app/common/routing/routes.dart';
import 'package:lab1/app/screens/home/home_factory.dart';
import 'package:lab1/app/screens/login/login_factory.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case routeHome:
        return MaterialPageRoute(
            builder: (_) => _buildHomeSettings(routeSettings));
      case routeLogin:
        return MaterialPageRoute(
            builder: (_) => _buildLoginSettings(routeSettings));

      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }

  Widget _buildHomeSettings(RouteSettings settings) {
    return HomeFactory.build();
  }

  Widget _buildLoginSettings(RouteSettings settings) {
    return LoginFactory.build();
  }

}
