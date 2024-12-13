import 'package:flutter/cupertino.dart';

class CatalogScreenStyles {
  static const Color backgroundColor = Color(0xFFF3F4F6);
  static const Color itemBackgroundColor = CupertinoColors.white;
  static const Color searchBarColor = CupertinoColors.systemGrey;
  static const Color searchButtonColor = Color(0xFF4631D2);
  static const TextStyle itemTextStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, color: CupertinoColors.black);

  static const EdgeInsetsGeometry itemPadding = EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 16,
  );

  static const EdgeInsetsGeometry screenPadding = EdgeInsets.all(16);
}
