import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(color: AppColors.background),
    textTheme: const TextTheme(
      headlineLarge: AppFonts.headline1,
      bodyMedium: AppFonts.bodyText1,
      labelMedium: AppFonts.button,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.background,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: AppColors.background,
      indicatorShape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      indicatorColor: AppColors.secondary,
    ),
    indicatorColor: AppColors.primary,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: AppFonts.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppFonts.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
