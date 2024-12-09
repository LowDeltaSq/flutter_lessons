import 'package:flutter/cupertino.dart';
import 'package:module_1/src/router/router.dart';
import 'src/screens/login/auth_screen.dart';

void main() => runApp(const ShopApp());

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      home: AuthScreen(),
    );
  }
}
