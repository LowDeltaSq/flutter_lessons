import 'package:flutter/cupertino.dart';
import 'package:module_1/src/router/router.dart';
import 'package:module_1/src/router/router_const.dart';
import 'package:module_1/src/screens/auth/login/auth_screen.dart';
import 'package:module_1/src/screens/auth/register/register_screen.dart';
import 'package:module_1/src/screens/main/main_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  runApp(const ShopApp());
}

class ShopApp extends StatefulWidget {
  const ShopApp({super.key});

  @override
  State<ShopApp> createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  String initialRoute = AuthRoute;

  @override
  void initState() {
    Box tokensBox = Hive.box('tokens');

    if (tokensBox.get('access') != null || tokensBox.get('refresh') != null) {
      initialRoute = MainRoute;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      home: AuthScreen(),
    );
  }
}
