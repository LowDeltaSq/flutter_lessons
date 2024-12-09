import 'package:flutter/cupertino.dart';
import 'package:module_1/src/UI/styles/register_screen_styles.dart';
import 'package:module_1/src/common/widgets/custom_button.dart';
import 'package:module_1/src/common/widgets/custom_text_field.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTextField(placeholder: 'Логин'),
            Container(
              height: 1,
              padding: RegisterScreenStyles.screenPadding,
              color: RegisterScreenStyles.borderColor,
            ),
            const CustomTextField(placeholder: 'Почта'),
            Container(
              height: 1,
              padding: RegisterScreenStyles.screenPadding,
              color: RegisterScreenStyles.borderColor,
            ),
            const CustomTextField(placeholder: 'Пароль'),
            const SizedBox(
              height: 32,
            ),
            Padding(
                padding: RegisterScreenStyles.screenPadding,
                child: CustomButton(text: 'Создать аккаунт', onPressed: () {})),
          ],
        ),
      ),
    );
  }
}
