import 'package:flutter/cupertino.dart';
import 'package:module_1/src/router/router_const.dart';
import 'package:module_1/src/screens/auth/register/register_screen.dart';
import 'package:module_1/src/screens/auth/login/auth_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      default:
        return CupertinoPageRoute(builder: (context) => const AuthScreen());
    }
  }
}
