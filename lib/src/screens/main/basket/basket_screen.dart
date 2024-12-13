import 'package:flutter/cupertino.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Корзина'),
        ),
        child: SafeArea(
            child: Column(
          children: [],
        )));
  }
}
