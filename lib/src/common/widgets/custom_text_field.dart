import 'package:flutter/cupertino.dart';
import 'package:module_1/src/UI/styles/auth_screen_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.placeholder,
    this.controller,
  });

  final String placeholder;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      decoration:
          const BoxDecoration(color: AuthScreenStyles.textFieldBackgroundColor),
      padding: AuthScreenStyles.textFieldPadding,
    );
  }
}
