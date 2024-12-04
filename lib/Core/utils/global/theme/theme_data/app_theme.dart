import 'package:flutter/material.dart';
import 'package:todo/Core/utils/constants.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: AppColor.blackColor,
      selectedItemColor: AppColor.primaryColor,
      backgroundColor: AppColor.backgroundColor,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontFamily: appFontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        minimumSize: const Size(215, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.backgroundColor,
      iconSize: 25,
      shape: CircleBorder(),
    ),
    primaryColor: AppColor.primaryColor,
    useMaterial3: true,
  );
}
