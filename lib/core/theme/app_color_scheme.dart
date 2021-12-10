import 'package:chuck_norris_jokes/core/theme/app_color.dart';
import 'package:flutter/material.dart';

extension AppColorScheme on ColorScheme {
  Color get likeButton =>
      brightness == Brightness.dark ? AppColors.red : AppColors.blue;
}
