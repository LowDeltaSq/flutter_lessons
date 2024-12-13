import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_1/src/screens/auth/login/auth_screen.dart';

final loginController = TextEditingController();

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void logout(BuildContext context) {
    // Очищаем данные о логине
    loginController.clear();

    // Переходим на экран входа и удаляем все экраны из стека навигации
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => const AuthScreen()),
      (Route<dynamic> route) => false, // Условие для удаления всех экранов
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        border: Border(),
        middle: Text(
          'Профиль',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
                size: 120,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Логин: ${loginController.text}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: () =>
                  logout(context), // Выйти и вернуться на AuthScreen
              child: const Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}
