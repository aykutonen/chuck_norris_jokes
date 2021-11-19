import 'package:chuck_norris_jokes/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // Light
  static final _textStyleLight = TextStyle(
    color: AppColors.black,
  );

  static final body1 = _textStyleLight.copyWith(
    fontSize: 14,
  );
  static final body2 = _textStyleLight.copyWith(
    fontSize: 12,
  );
  static final h1 = _textStyleLight.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.normal,
  );
  static final h2 = _textStyleLight.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.normal,
  );
  static final h3 = _textStyleLight.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.normal,
  );
  static final h4 = _textStyleLight.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );
  static final h5 = _textStyleLight.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final h6 = _textStyleLight.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final button = _textStyleLight.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final subtitle1 = _textStyleLight.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static final subtitle2 = _textStyleLight.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // Dark
  static final _textStyleDark = _textStyleLight.copyWith(
    color: AppColors.white,
  );

  static final body1Dark = _textStyleDark.copyWith(
    fontSize: 16,
  );
  static final body2Dark = _textStyleDark.copyWith(
    fontSize: 14,
  );
  static final subtitle1Dark = _textStyleDark.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static final subtitle2Dark = _textStyleDark.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final h1Dark = _textStyleDark.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.normal,
  );
  static final h2Dark = _textStyleDark.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.normal,
  );
  static final h3Dark = _textStyleDark.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.normal,
  );
  static final h4Dark = _textStyleDark.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );
  static final h5Dark = _textStyleDark.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final h6Dark = _textStyleDark.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final buttonDark = _textStyleDark.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
