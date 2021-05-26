import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(73, 61, 138, 1);
  static const Color accentColor = Color.fromRGBO(244, 50, 142, 1);
  static const Color backgroundColor = Color.fromRGBO(253, 254, 254, 1);
  static const Color grey = Color.fromRGBO(160, 160, 160, 1);

  ThemeData getTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: accentColor,
      scaffoldBackgroundColor: backgroundColor,
      backgroundColor: backgroundColor,
      buttonColor: primaryColor,
      cardColor: backgroundColor,
      fontFamily: 'Sofia Pro',
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w800,
          fontSize: 24,
        ),
        subtitle2: TextStyle(
          color: grey,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
