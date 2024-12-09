import 'package:flutter/cupertino.dart';
import 'package:module_1/src/UI/styles/auth_screen_styles.dart';
import 'package:module_1/src/router/router_const.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AuthScreenStyles.backgroundColor,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CupertinoTextField(
              placeholder: 'Почта',
              decoration: BoxDecoration(
                  color: AuthScreenStyles.textFieldBackgroundColor),
              padding: AuthScreenStyles.textFieldPadding,
            ),
            Container(
              height: 1,
              color: AuthScreenStyles.borderColor,
              padding: AuthScreenStyles.screenPadding,
            ),
            const CupertinoTextField(
              placeholder: 'Пароль',
              decoration: BoxDecoration(
                  color: AuthScreenStyles.textFieldBackgroundColor),
              padding: AuthScreenStyles.textFieldPadding,
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: AuthScreenStyles.screenPadding,
              child: CupertinoButton(
                padding: AuthScreenStyles.buttonPadding,
                color: AuthScreenStyles.buttonColor,
                child: const Text(
                  'Войти',
                  style: AuthScreenStyles.buttonTextStyle,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Padding(
              padding: AuthScreenStyles.screenPadding,
              child: CupertinoButton(
                  padding: AuthScreenStyles.buttonPadding,
                  color: AuthScreenStyles.buttonColor,
                  child: const Text(
                    'Зарегистрироваться',
                    style: AuthScreenStyles.buttonTextStyle,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterRoute);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
