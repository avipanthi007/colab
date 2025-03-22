import 'package:colab/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static TextTheme lightTextTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: AppColors.bigTextColor,
      fontFamily: 'Roboto',
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.textBlackColor,
      fontFamily: 'Roboto',
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textWhiteColor,
      fontFamily: 'Roboto',
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.textBlackColor,
      fontFamily: 'Roboto',
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textBlackColor,
      fontFamily: 'Roboto',
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textBlackColor,
      fontFamily: 'Roboto',
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.textBlackColor,
      fontFamily: 'Roboto',
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textBlackColor,
      fontFamily: 'Roboto',
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.labelColor,
      fontFamily: 'Roboto',
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textBlackColor,
      fontFamily: 'Roboto',
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.labelColor,
      fontFamily: 'Roboto',
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.labelColor,
      fontFamily: 'Roboto',
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: AppColors.textWhiteColor,
      fontFamily: 'Roboto',
    ),
    headlineMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryBlack,
      fontFamily: 'Roboto',
    ),
    headlineSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor,
      fontFamily: 'Roboto',
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.textWhiteColor,
      fontFamily: 'Roboto',
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.labelColor,
      fontFamily: 'Roboto',
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textWhiteColor,
      fontFamily: 'Roboto',
    ),
    bodyLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryColor2,
      fontFamily: 'Roboto',
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textWhiteColor,
      fontFamily: 'Roboto',
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor,
      fontFamily: 'Roboto',
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryBlack,
      fontFamily: 'Roboto',
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.labelColor,
      fontFamily: 'Roboto',
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textGreyColor,
      fontFamily: 'Roboto',
    ),
  );

  // Define custom ColorSchemes
  static ColorScheme lightColorScheme = const ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.primaryBlack,
    onPrimary: AppColors.lightBackground,
    primaryContainer: AppColors.labelColor,
    primaryFixed: AppColors.borderColor,
    secondary: AppColors.primaryColor2,
    onSecondary: AppColors.lightBackground,
    error: Colors.red,
    onError: AppColors.white,
    surface: AppColors.lightBackground,
    onSurface: AppColors.black,
    background: AppColors.lightBackground,
    onBackground: AppColors.black,
  );

  static ColorScheme darkColorScheme = const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.primaryBlack,
    onPrimary: AppColors.black,
    secondary: AppColors.primaryColor2,
    onSecondary: AppColors.black,
    error: Colors.red,
    onError: AppColors.black,
    surface: AppColors.black,
    onSurface: AppColors.white,
    background: AppColors.black,
    onBackground: AppColors.white,
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryBlack,
    scaffoldBackgroundColor: AppColors.lightBackground,
    
    colorScheme: lightColorScheme,
    iconTheme: const IconThemeData(color: AppColors.black),
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.black, size: 3.5.h),
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.black,
      selectionColor: AppColors.primaryBlack,
    ),
    textTheme: lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: darkColorScheme,
    iconTheme: const IconThemeData(color: AppColors.white),
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      backgroundColor: AppColors.black,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.white, size: 3.5.h),
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.white,
      selectionColor: AppColors.black,
    ),
    textTheme: darkTextTheme,
  );
}
