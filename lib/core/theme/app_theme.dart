import 'package:chuck_norris_jokes/core/theme/app_color.dart';
import 'package:chuck_norris_jokes/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.white,
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: AppTextStyles.body1,
            bodyText2: AppTextStyles.body2,
            button: AppTextStyles.button,
            headline1: AppTextStyles.h1,
            headline2: AppTextStyles.h2,
            headline3: AppTextStyles.h3,
            headline4: AppTextStyles.h4,
            headline5: AppTextStyles.h5,
            headline6: AppTextStyles.h6,
            subtitle1: AppTextStyles.subtitle1,
            subtitle2: AppTextStyles.subtitle2,
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

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      // primaryColor: AppColors.primary,
      // primaryColorBrightness: Brightness.dark,
      // primaryColorDark: AppColors.primaryDark,
      // primaryColorLight: AppColors.primaryLight,
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            primary: AppColors.dark_blue,
            secondary: AppColors.red,
            onPrimary: AppColors.blue,
            onSecondary: AppColors.white,
            onBackground: AppColors.white,
            background: AppColors.dark_blue,
            surface: AppColors.dark_blue,
            error: AppColors.red,
            onError: AppColors.white,
            onSurface: AppColors.blue,
            primaryVariant: AppColors.red,
            secondaryVariant: AppColors.dark_blue,
          ),
      scaffoldBackgroundColor: AppColors.dark_blue,
      textTheme: ThemeData.dark().textTheme.copyWith(
            bodyText1: AppTextStyles.body1Dark,
            bodyText2: AppTextStyles.body2Dark,
            button: AppTextStyles.buttonDark,
            headline1: AppTextStyles.h1Dark,
            headline2: AppTextStyles.h2Dark,
            headline3: AppTextStyles.h3Dark,
            headline4: AppTextStyles.h4Dark,
            headline5: AppTextStyles.h5Dark,
            headline6: AppTextStyles.h6Dark,
            subtitle1: AppTextStyles.subtitle1Dark,
            subtitle2: AppTextStyles.subtitle2Dark,
          ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.red,
        textTheme: ButtonTextTheme.normal,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.red),
          foregroundColor: MaterialStateProperty.all(AppColors.white),
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        foregroundColor: AppColors.white,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      brightness: Brightness.dark,
      dividerTheme: DividerThemeData(
        color: AppColors.light_blue,
        space: 0,
        thickness: 0.5,
        endIndent: 2,
        indent: 2,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: AppColors.white,
        color: AppColors.blue,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.red,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }
}
