import 'package:flutter/cupertino.dart';
import 'package:module_1/src/UI/styles/auth_screen_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.placeholder,
  });

  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      decoration:
          const BoxDecoration(color: AuthScreenStyles.textFieldBackgroundColor),
      padding: AuthScreenStyles.textFieldPadding,
    );
  }
}
