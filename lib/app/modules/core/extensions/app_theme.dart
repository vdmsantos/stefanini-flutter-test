import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  //Grey
  static const Color greyFF4B585E = Color(0xFF4B585E);
  static const Color greyFFE4E4E4 = Color(0xFFE4E4E4);
  static const Color greyFFD2D8D7 = Color(0xFFD2D8D7);

  //Green
  static const Color greenFF37C66D = Color(0xFF37C66D);
  static const Color green461651301 = Color.fromRGBO(46, 165, 130, 1);
  static const Color greenFF20B858 = Color(0xFF20B858);
  static const Color greenFF018E01 = Color(0xFF018E01);
  static const Color greenFFA9E9D3 = Color(0xFFA9E9D3);
  static const Color greenFF2B9873 = Color(0xFF2B9873);

  //Red
  static const Color redFFF45757 = Color(0xFFF45757);
  static const Color redFFEDA09C = Color(0xFFEDA09C);
  static const Color redFFFBECEB = Color(0xFFFBECEB);

  //Blue
  static const Color blueFFB4E5FD = Color(0xFFB4E5FD);
  static const Color blueFFF5FBFF = Color(0xFFF5FBFF);

  //Yellow
  static const Color yellowFFFAA61A = Color(0xFFFAA61A);
  static const Color yellowFFFEF0D9 = Color(0xFFFEF0D9);

  //Purple
  static const Color purpleFF95507E = Color(0xFF95507E);
  static const Color purpleFF903571 = Color(0xFF903571);
}

extension CustomColorSchemeX on ColorScheme {
  Color get greenFF018E01 => AppColors.greenFF018E01;
  Color get greenFF2B9873 => AppColors.greenFF2B9873;
  Color get greenFF37C66D => AppColors.greenFF37C66D;
  Color get green461651301 => AppColors.green461651301;

  Color get primaryWhite => AppColors.white;

  Color get primaryBlack => AppColors.black;
  Color get greyFFD2D8D7 => AppColors.greyFFD2D8D7;
  Color? get smallBoxColor12 =>
      brightness == Brightness.light ? Colors.blue : Colors.grey[400];
}

class AppFontFamily {
  static const String dmSans = 'DMSans';
  static const String dmSansRegular = 'DMSansRegular';
  static const String roboto = 'Roboto';
}

class AppTheme {
  static const primaryFont = AppFontFamily.roboto;

  static final themeData = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
    ),
    appBarTheme: appBarTheme,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
  );

  static const appBarTheme = AppBarTheme(
    surfaceTintColor: AppColors.white,
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.white,
    iconTheme: IconThemeData(
      color: AppColors.black,
    ),
  );
}
