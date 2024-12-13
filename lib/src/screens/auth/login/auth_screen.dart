import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:module_1/src/UI/styles/auth_screen_styles.dart';
import 'package:module_1/src/router/router_const.dart';
import 'package:module_1/src/common/widgets/custom_text_field.dart';
import 'package:module_1/src/common/widgets/custom_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

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
            CustomTextField(
              placeholder: 'Почта',
              controller: emailController,
            ),
            Container(
              height: 1,
              color: AuthScreenStyles.borderColor,
              padding: AuthScreenStyles.screenPadding,
            ),
            CustomTextField(
              placeholder: 'Пароль',
              controller: passwordController,
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: AuthScreenStyles.screenPadding,
              child: CustomButton(
                onPressed: () async {
                  // Скрыть клавиатуру, если она отображается
                  FocusScope.of(context).requestFocus(FocusNode());

                  // Открытие коробки Hive для сохранения токенов
                  Box tokensBox = await Hive.openBox('tokens');
                  Dio dio = Dio();
                  String baseUrl =
                      'http://10.0.2.2:53000'; // Адрес вашего сервера
                  try {
                    // Отправка POST-запроса на сервер для логина
                    Response response = await dio.post(
                      '$baseUrl/login',
                      data: {
                        'mail': emailController.text,
                        'password': passwordController.text,
                      },
                    );

                    // Проверка ответа от сервера
                    if (response.data != null) {
                      print('Ответ сервера: ${response.data}');

                      // Сохранение полученного токена в Hive
                      tokensBox.put('access', response.data['token']);
                      print('Токен сохранен: ${tokensBox.get('access')}');

                      // Переход на главный экран с задержкой
                      Future.delayed(Duration(microseconds: 1), () {
                        Navigator.pushNamed(context, MainRoute);
                      });
                    } else {
                      print('Ответ пустой');
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Ошибка'),
                            content: const Text('Ответ от сервера пустой'),
                            actions: [
                              CupertinoButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } on DioException catch (e) {
                    print('Ошибка при запросе: ${e.message}');
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Ошибка'),
                          content: Text(
                            e.response != null
                                ? 'Неверный логин или пароль'
                                : 'Не удаётся подключиться к серверу',
                          ),
                          actions: [
                            CupertinoButton(
                              child: const Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
