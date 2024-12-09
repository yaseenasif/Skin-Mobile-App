import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFonts {
  static const String primaryFont = 'Montserrat';

  static const TextStyle headline1 = TextStyle(
    fontFamily: primaryFont,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontFamily: primaryFont,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Colors.white,
  );
}
