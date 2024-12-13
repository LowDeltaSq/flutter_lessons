import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_1/src/UI/styles/register_screen_styles.dart';
import 'package:module_1/src/common/widgets/custom_button.dart';
import 'package:module_1/src/common/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:module_1/src/router/router_const.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController loginController = TextEditingController();

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
            CustomTextField(
              placeholder: 'Логин',
              controller: loginController,
            ),
            Container(
              height: 1,
              padding: RegisterScreenStyles.screenPadding,
              color: RegisterScreenStyles.borderColor,
            ),
            CustomTextField(
              placeholder: 'Почта',
              controller: emailController,
            ),
            Container(
              height: 1,
              padding: RegisterScreenStyles.screenPadding,
              color: RegisterScreenStyles.borderColor,
            ),
            CustomTextField(
              placeholder: 'Пароль',
              controller: passwordController,
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: RegisterScreenStyles.screenPadding,
              child: CustomButton(
                text: 'Создать аккаунт',
                onPressed: () async {
                  Dio dio = Dio();
                  String baseUrl = 'http://10.0.2.2:53000/register';

                  try {
                    Response response = await dio.post(
                      baseUrl,
                      data: {
                        'login': loginController.text,
                        'mail': emailController.text,
                        'password': passwordController.text,
                      },
                    );

                    if (response.statusCode == 201) {
                      print('Регистрация успешна: ${response.data}');

                      Navigator.pushNamed(context, AuthRoute);
                    } else {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Ошибка регистрации'),
                            content: Text('Ошибка: ${response.data}'),
                            actions: [
                              CupertinoButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } on DioException catch (e) {
                    print('Ошибка при запросе: ${e.message}');

                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Ошибка'),
                          content: const Text('Введите данные'),
                          actions: [
                            CupertinoButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
