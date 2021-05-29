import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme(BuildContext context) {
    return ThemeData(
      primaryColor: const Color.fromRGBO(85, 142, 255, 1),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      errorColor: const Color.fromRGBO(255, 85, 85, 1),
      shadowColor: const Color.fromRGBO(200, 200, 200, 1),
      fontFamily: 'Karla',
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: Color.fromRGBO(74, 74, 74, 1),
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
        bodyText1: TextStyle(
          color: Color.fromRGBO(168, 168, 168, 1),
          fontWeight: FontWeight.w700,
          height: 1.3,
          fontSize: 15,
          textBaseline: TextBaseline.alphabetic
        ),
        button: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    );
  }
}
