import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/core/theme/app_colors.dart';

enum AppThemeMode {
  dark,
  light,
}

extension Toggle on AppThemeMode {
  AppThemeMode opposite() {
    if (this == AppThemeMode.light) {
      return AppThemeMode.dark;
    }
    return AppThemeMode.light;
  }
}

class AppTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    buttonTheme: const ButtonThemeData(),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      centerTitle: false,
      shadowColor: AppColor.white,
      elevation: 0.0,
      actionsIconTheme: IconThemeData(
        color: AppColor.white,
        size: 26.sp,
      ),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: Colors.transparent,
      textColor: AppColor.white,
      tilePadding: EdgeInsets.zero,
      iconColor: Colors.white,
    ),
    // primaryColor: AppColor.primaryBg,
    // colorScheme: const ColorScheme.dark(),
    // iconTheme: IconThemeData(color: Colors.redAccent.shade200, opacity: 0.8),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          color: AppColor.black,
          fontSize: 14.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColor.white,
        fontSize: 40.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        color: AppColor.white,
        fontSize: 32.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        color: AppColor.white,
        fontSize: 28.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      displayLarge: TextStyle(
        color: AppColor.white,
        fontSize: 24.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        color: AppColor.white,
        fontSize: 20.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        color: AppColor.white,
        fontSize: 18.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: AppColor.white,
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColor.white,
        fontSize: 14.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColor.white,
        fontSize: 12.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColor.white,
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColor.white,
        fontSize: 14.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColor.white,
        fontSize: 12.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: AppColor.white,
        fontSize: 10.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        color: AppColor.white,
        fontSize: 10.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: AppColor.white,
        fontSize: 10.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF5F5F5),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.black,
      centerTitle: true,
      shadowColor: AppColor.black,
      elevation: 0.0,
      actionsIconTheme: IconThemeData(
        color: AppColor.black,
        size: 26.sp,
      ),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: Colors.transparent,
      textColor: AppColor.black,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.symmetric(vertical: 0),
      iconColor: Colors.black,
    ),
    primaryColor: AppColor.white,

    primaryColorLight: Colors.redAccent,
    // colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(
      color: Colors.black,
      opacity: 0.8,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xffff914d), // Background color.
      textTheme: ButtonTextTheme.accent,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        iconColor: AppColor.white,
        foregroundColor: const Color(0xffff914d),
        textStyle: const TextStyle(
          color: AppColor.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          const Color(0xffffffff),
        ), //text (and icon)
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColor.black,
        fontSize: 40.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        color: AppColor.black,
        fontSize: 32.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        color: AppColor.black,
        fontSize: 28.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      displayLarge: TextStyle(
        color: AppColor.black,
        fontSize: 24.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        color: AppColor.black,
        fontSize: 20.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        color: AppColor.black,
        fontSize: 18.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: AppColor.black,
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColor.black,
        fontSize: 14.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColor.black,
        fontSize: 12.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColor.black,
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColor.black,
        fontSize: 14.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColor.black,
        fontSize: 12.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: AppColor.black,
        fontSize: 16.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: AppColor.black,
        fontSize: 14.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: AppColor.black,
        fontSize: 12.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
