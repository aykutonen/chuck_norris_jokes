import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final _textStyleLight = TextStyle(color: Colors.grey.shade900);

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: _textStyleLight,
        bodyText2: _textStyleLight,
        button: _textStyleLight,
        caption: _textStyleLight,
        overline: _textStyleLight,
        subtitle1: _textStyleLight,
        subtitle2: _textStyleLight,
        headline1: _textStyleLight,
        headline2: _textStyleLight,
        headline3: _textStyleLight,
        headline4: _textStyleLight,
        headline5: _textStyleLight,
        headline6: _textStyleLight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
          foregroundColor: MaterialStateProperty.all(Colors.red),
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        foregroundColor: Colors.red,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      brightness: Brightness.light,
      dividerColor: Colors.grey.shade400,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
      ),
    );
  }

  static final _textStyleDark = TextStyle(color: Colors.yellow);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.yellow,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: _textStyleDark,
        bodyText2: _textStyleDark,
        button: _textStyleDark,
        caption: _textStyleDark,
        overline: _textStyleDark,
        subtitle1: _textStyleDark,
        subtitle2: _textStyleDark,
        headline1: _textStyleDark,
        headline2: _textStyleDark,
        headline3: _textStyleDark,
        headline4: _textStyleDark,
        headline5: _textStyleDark,
        headline6: _textStyleDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade600),
          foregroundColor: MaterialStateProperty.all(Colors.yellow),
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        foregroundColor: Colors.yellow,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      brightness: Brightness.dark,
      dividerColor: Colors.yellowAccent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.yellow,
      ),
    );
  }
}
