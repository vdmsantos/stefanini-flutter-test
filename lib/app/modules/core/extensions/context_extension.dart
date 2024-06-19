import 'package:flutter/material.dart';
import 'package:stefanini_flutter_test/app/modules/core/extensions/app_theme.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;
}

extension CustomTextThemeX on TextTheme {
  TextStyle get _mediumText => const TextStyle(fontSize: 18.0);
  TextStyle get _smallText => const TextStyle(fontSize: 16.0);
  TextStyle get _small14Text => const TextStyle(fontSize: 14.0);
  TextStyle get _largeText => const TextStyle(fontSize: 30.0);

  TextStyle get mediumWhiteTextStyle => _mediumText.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      );
  TextStyle get mediumBlackTextStyle => _mediumText.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      );

  TextStyle get mediumGreyTextStyle => _mediumText.copyWith(
      color: AppColors.greyFF4B585E,
      fontWeight: FontWeight.w400,
      fontFamily: AppFontFamily.dmSansRegular);
  TextStyle get smallGreyRegularTextStyle => _smallText.copyWith(
      color: AppColors.greyFF4B585E,
      fontWeight: FontWeight.w400,
      fontFamily: AppFontFamily.dmSansRegular);
  TextStyle get largeGreenTextStyle => _largeText.copyWith(
      color: AppColors.greenFF018E01,
      height: 0,
      fontWeight: FontWeight.w500,
      fontFamily: AppFontFamily.dmSans);

  TextStyle get smallGreenTextStyle => _smallText.copyWith(
      color: AppColors.greenFF018E01,
      height: 0,
      fontWeight: FontWeight.w500,
      fontFamily: AppFontFamily.dmSansRegular);
  TextStyle get smallGreyTextStyle => _smallText.copyWith(
      color: const Color.fromARGB(255, 151, 157, 159),
      height: 0,
      fontWeight: FontWeight.w500,
      fontFamily: AppFontFamily.dmSans);

  TextStyle get small14BlackTextStyle => _small14Text.copyWith(
        color: AppColors.black,
        height: 0,
        fontFamily: AppFontFamily.dmSans,
        fontWeight: FontWeight.w500,
      );
  TextStyle get smallBlackRegularTextStyle => _smallText.copyWith(
        color: AppColors.black,
        height: 0,
        fontFamily: AppFontFamily.dmSansRegular,
        fontWeight: FontWeight.w500,
      );
  TextStyle get smallGreen461651301RegularTextStyle => _smallText.copyWith(
        color: AppColors.green461651301,
        height: 0,
        fontFamily: AppFontFamily.dmSansRegular,
        fontWeight: FontWeight.w500,
      );
  TextStyle get smallRedRegularTextStyle => _smallText.copyWith(
        color: AppColors.redFFF45757,
        height: 0,
        fontFamily: AppFontFamily.dmSansRegular,
        fontWeight: FontWeight.w500,
      );
}

extension StringExt on String {
  String get numbersOnly => replaceAll(RegExp(r'[^0-9]'), '');
  String get convertPoint => replaceAll('.', ',');

  String get formattedTaxVat {
    final taxVatRegex = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');
    return numbersOnly.replaceFirstMapped(taxVatRegex,
        (match) => '${match[1]}.${match[2]}.${match[3]}-${match[4]}');
  }

  String get formattedCellphone {
    final cellphoneRegex = RegExp(r'^(\d{2})(\d{1})(\d{4})(\d{4})$');
    return replaceFirstMapped(cellphoneRegex,
        (match) => '(${match[1]}) ${match[2]} ${match[3]}-${match[4]}');
  }

  String get formattedCep {
    final cellphoneRegex = RegExp(r'^(\d{2})(\d{5})(\d{4})$');
    return numbersOnly.replaceFirstMapped(
        cellphoneRegex, (match) => '(${match[1]}) ${match[2]}-${match[3]}');
  }

  String get formattedCEP {
    final cepRegex = RegExp(r'^(\d{5})(\d{3})$');
    return replaceAllMapped(cepRegex, (match) => '${match[1]}-${match[2]}');
  }

  String get firstWord {
    return split(' ').firstWhere((word) => word.isNotEmpty, orElse: () => '');
  }

  bool equals(String x) => this == x;

  bool contaisUpperCase() => contains(RegExp(r'[A-Z]'));

  bool contaisLowerCase() => contains(RegExp(r'[a-z]'));

  bool contaisNumber() => contains(RegExp(r'[0-9]'));

  bool contaisSpecialCharacters() => contains(RegExp(r'[!@#\$&*~]'));

  bool contaisMinLength(int minlength) => length >= minlength;
}
