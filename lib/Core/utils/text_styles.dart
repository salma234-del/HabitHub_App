import 'package:flutter/material.dart';
import 'package:todo/Core/utils/constants.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';

abstract class AppTextStyles {
  static TextStyle titleLarge = const TextStyle(
      fontFamily: appFontFamily, fontSize: 64, fontWeight: FontWeight.w600);
  static TextStyle bodyLarge = const TextStyle(
      fontFamily: appFontFamily, fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle bodyMedium = const TextStyle(
    fontFamily: appFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.greyColor,
  );
  static TextStyle bodySmall = const TextStyle(
      fontFamily: appFontFamily, fontSize: 12, fontWeight: FontWeight.w500);
  static const TextStyle text18_700 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColor.primaryColor,
  );
  static const TextStyle text14_300 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle text14_400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle text14_700 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle text24_900 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle text24_500 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle text20_400 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle text12_500 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle text12_700 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle text16_500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
