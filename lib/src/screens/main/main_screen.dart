import 'package:flutter/cupertino.dart';
import 'package:module_1/src/screens/auth/login/auth_screen.dart';
import 'package:module_1/src/screens/auth/register/register_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Каталог'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.gift), label: 'Корзина'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: 'Профиль'),
        ]),
        tabBuilder: (context, index) {
          return CupertinoTabView(builder: (context) {
            switch (index) {
              case 0:
                return const AuthScreen();
              case 1:
                return const RegisterScreen();
              case 2:
                return const AuthScreen();
              case 3:
                return const RegisterScreen();
              default:
                return const RegisterScreen();
            }
          });
        });
  }
}
