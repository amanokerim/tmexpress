import 'package:flutter/material.dart';

final appTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: AppColors.primary,
  primarySwatch: _primarySwatch,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AppColors.bgMain,
  textTheme: TextTheme(
    bodyText1: AppTextStyle.dark18,
    bodyText2: AppTextStyle.dark16,
    headline1: AppTextStyle.bold32,
    headline2: AppTextStyle.bold26,
    headline3: AppTextStyle.bold24,
    headline4: AppTextStyle.bold20,
    headline5: AppTextStyle.bold18,
    headline6: AppTextStyle.bold16,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.bg,
  ),
);

abstract class AppTextStyle {
  // Headlines
  static TextStyle get bold32 => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: AppColors.textMain,
      );
  static TextStyle get bold26 => bold32.copyWith(fontSize: 26);
  static TextStyle get bold24 => bold32.copyWith(fontSize: 24);
  static TextStyle get bold20 => bold32.copyWith(fontSize: 20);
  static TextStyle get bold18 => bold32.copyWith(fontSize: 18);
  static TextStyle get bold16 => bold32.copyWith(fontSize: 16);
  static TextStyle get bold14 => bold32.copyWith(fontSize: 14);
  static TextStyle get bold12 => bold32.copyWith(fontSize: 12);

  // Primary styles (normal text, dark color)
  static TextStyle get dark20 => bold20.copyWith(fontWeight: FontWeight.w400);
  static TextStyle get dark18 => dark20.copyWith(fontSize: 18);
  static TextStyle get dark16 => dark20.copyWith(fontSize: 16);
  static TextStyle get dark16_2 => dark20.copyWith(
        fontSize: 16,
        letterSpacing: 0.256,
      );
  static TextStyle get dark14 => dark20.copyWith(fontSize: 14);
  static TextStyle get dark12 => dark20.copyWith(fontSize: 12);
  static TextStyle get dark10 => dark20.copyWith(fontSize: 10);

  // Secondary styles (normal text with grey color)
  static TextStyle get grey20 => dark20.copyWith(color: AppColors.textSec);
  static TextStyle get grey18 => grey20.copyWith(fontSize: 18);
  static TextStyle get grey16 => grey20.copyWith(fontSize: 16);
  static TextStyle get grey16_2 => grey20.copyWith(
        fontSize: 16,
        letterSpacing: 0.256,
        height: 1.5,
      );
  static TextStyle get grey16_3 =>
      grey20.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle get grey14 => grey20.copyWith(fontSize: 14);
  static TextStyle get grey12 => grey20.copyWith(fontSize: 12);
  static TextStyle get grey10 =>
      grey20.copyWith(fontSize: 10, color: AppColors.textData);

  static TextStyle get white16 => dark16.copyWith(color: AppColors.white);
}

// TODO Change colors
abstract class AppColors {
  static Color get primary => const Color(0xFF31313b);
  static Color get secondary => const Color(0xFFD0021B);

  static Color get bg => const Color(0xFFFEFEFE);
  static Color get bg2 => const Color(0xFFFAFAFA);

  static Color get bgMain => const Color(0xFFFFFFFF);
  static Color get tabBarInactive => const Color(0xFFB7BDC3);

  static Color get dark => const Color(0xFF212121);
  static Color get grey => const Color(0xFF999999);
  static Color get lGrey => const Color(0xFFDDDDDD);

  static Color get white => Colors.white;

  static Color get black => const Color(0xFF000000);

  static Color get blue => const Color(0xFF456297);
  static Color get blue2 => const Color(0xFFB9D0F2);

  static Color get lightBlue => const Color(0xFFBAD1FB);
  static Color get pink => const Color(0xFFEFA097);
  static Color get pink2 => const Color(0xFFF7DFDF);

  static Color get purple => const Color(0xFFD0C4FD);
  static Color get purple2 => const Color(0xFFB8AAED);

  static Color get green => const Color(0xFFB7DEE4);
  static Color get green2 => const Color(0xFF9CC8CF);
  static Color get green3 => const Color(0xFFB9DAC9);

  static Color get lightYellow => const Color(0xFFF9DDB3);

  static Color get textMain => dark;
  static Color get textSec => const Color(0xFF858C95);
  static Color get textData => const Color(0xFFAEB3BA);
  static Color get textHint => const Color(0xFFC2C6CB);
  static Color get textInvisible => const Color(0xFFF0F1F3);
}

MaterialColor get _primarySwatch => MaterialColor(
      AppColors.primary.value,
      {
        50: AppColors.primary,
        100: AppColors.primary,
        200: AppColors.primary,
        300: AppColors.primary,
        400: AppColors.primary,
        500: AppColors.primary,
        600: AppColors.primary,
        700: AppColors.primary,
        800: AppColors.primary,
        900: AppColors.primary,
      },
    );

const appShadow = [
  BoxShadow(
    offset: Offset(0, -4),
    blurRadius: 12,
    color: Color.fromRGBO(0, 0, 0, 0.06),
  )
];
