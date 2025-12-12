import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Application text styles
abstract final class AppTextStyles {
  static const neonText = TextStyle(color: AppColors.neonColor, fontSize: 14);

  static const boldBlack = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const boldWhite = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
