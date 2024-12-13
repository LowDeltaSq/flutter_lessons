import 'package:flutter/cupertino.dart';
import 'package:module_1/src/router/router_const.dart';
import 'package:module_1/src/screens/auth/login/auth_screen.dart';
import 'package:module_1/src/screens/auth/register/register_screen.dart';
import 'package:module_1/src/screens/main/basket/basket_screen.dart';
import 'package:module_1/src/screens/main/main_screen.dart';
import 'package:module_1/src/screens/main/profile/profile_screen.dart';

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
      case MainRoute:
        return CupertinoPageRoute(
          builder: (context) => const MainScreen(),
        );
      case ProfileRoute:
        return CupertinoPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case BasketRoute:
        return CupertinoPageRoute(
          builder: (context) => const BasketScreen(),
        );
      default:
        return CupertinoPageRoute(builder: (context) => const AuthScreen());
    }
  }
}
