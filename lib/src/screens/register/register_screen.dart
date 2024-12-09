import 'package:flutter/cupertino.dart';
import 'package:module_1/src/UI/styles/register_screen_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: RegisterScreenStyles.backgroundColor,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Регистрация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CupertinoTextField(
              placeholder: 'Логин',
              decoration: BoxDecoration(
                color: RegisterScreenStyles.textFieldBackgroundColor,
              ),
              padding: RegisterScreenStyles.textFieldPadding,
            ),
            Container(
              height: 1,
              padding: RegisterScreenStyles.screenPadding,
              color: RegisterScreenStyles.borderColor,
            ),
            const CupertinoTextField(
              placeholder: 'Почта',
              decoration: BoxDecoration(
                color: RegisterScreenStyles.textFieldBackgroundColor,
              ),
              padding: RegisterScreenStyles.textFieldPadding,
            ),
            Container(
              height: 1,
              padding: RegisterScreenStyles.screenPadding,
              color: RegisterScreenStyles.borderColor,
            ),
            const CupertinoTextField(
              placeholder: 'Пароль',
              decoration: BoxDecoration(
                color: RegisterScreenStyles.textFieldBackgroundColor,
              ),
              padding: RegisterScreenStyles.textFieldPadding,
            ),
            Padding(
              padding: RegisterScreenStyles.screenPadding,
              child: CupertinoButton(
                padding: RegisterScreenStyles.buttonPadding,
                color: RegisterScreenStyles.buttonColor,
                child: const Text(
                  'Создать аккаунт',
                  style: RegisterScreenStyles.buttonTextStyle,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
