import 'package:chuck_norris_jokes/core/theme/color.dart';
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
        systemOverlayStyle: SystemUiOverlayStyle.light,
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

  static final _textStyleDark = TextStyle(color: AppColors.onSecondary);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      // primaryColor: AppColors.primary,
      // primaryColorBrightness: Brightness.dark,
      // primaryColorDark: AppColors.primaryDark,
      // primaryColorLight: AppColors.primaryLight,
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
            onPrimary: AppColors.onPrimary,
            onSecondary: AppColors.onSecondary,
            onBackground: AppColors.onSecondary,
            background: AppColors.primary,
            surface: AppColors.primary,
            error: AppColors.secondary,
            onError: AppColors.onSecondary,
            onSurface: AppColors.onPrimary,
            primaryVariant: AppColors.secondary,
            secondaryVariant: AppColors.primary,
          ),
      scaffoldBackgroundColor: AppColors.primary,
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
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.secondary,
        textTheme: ButtonTextTheme.normal,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.secondary),
          foregroundColor: MaterialStateProperty.all(AppColors.onSecondary),
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        foregroundColor: AppColors.onSecondary,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      brightness: Brightness.dark,
      dividerTheme: DividerThemeData(
        color: AppColors.onSecondary.withOpacity(0.3),
        space: 0,
        thickness: 0.5,
        endIndent: 2,
        indent: 2,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: AppColors.onSecondary,
        color: AppColors.onPrimary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        unselectedItemColor: AppColors.onSecondary,
        selectedItemColor: AppColors.secondary,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }
}
