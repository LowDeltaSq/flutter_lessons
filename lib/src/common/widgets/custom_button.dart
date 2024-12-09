import 'package:flutter/cupertino.dart';
import 'package:module_1/src/UI/styles/auth_screen_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: AuthScreenStyles.buttonPadding,
      color: AuthScreenStyles.buttonColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: AuthScreenStyles.buttonTextStyle,
      ),
    );
  }
}
