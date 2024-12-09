import 'package:flutter/cupertino.dart';
import 'package:module_1/src/UI/styles/auth_screen_styles.dart';
import 'package:module_1/src/router/router_const.dart';
import 'package:module_1/src/common/widgets/custom_text_field.dart';
import 'package:module_1/src/common/widgets/custom_button.dart';

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
            const CustomTextField(
              placeholder: 'Почта',
            ),
            Container(
              height: 1,
              color: AuthScreenStyles.borderColor,
              padding: AuthScreenStyles.screenPadding,
            ),
            const CustomTextField(
              placeholder: 'Пароль',
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: AuthScreenStyles.screenPadding,
              child: CustomButton(
                onPressed: () {},
                text: 'Войти',
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Padding(
                padding: AuthScreenStyles.screenPadding,
                child: CustomButton(
                    text: 'Регистрация',
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterRoute);
                    })),
          ],
        ),
      ),
    );
  }
}
