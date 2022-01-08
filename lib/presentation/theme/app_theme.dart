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
    headline1: AppTextStyle.headline1,
    headline2: AppTextStyle.headline2,
    headline3: AppTextStyle.headline3,
    headline4: AppTextStyle.headline4,
    headline5: AppTextStyle.headline5,
    headline6: AppTextStyle.headline6,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.background,
  ),
);

abstract class AppTextStyle {
  // Headlines
  static TextStyle get headline1 => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: AppColors.textMain,
      );
  static TextStyle get headline2 => headline1.copyWith(fontSize: 26);
  static TextStyle get headline3 => headline1.copyWith(fontSize: 24);
  static TextStyle get headline4 => headline1.copyWith(fontSize: 20);
  static TextStyle get headline5 => headline1.copyWith(fontSize: 18);
  static TextStyle get headline6 => headline1.copyWith(fontSize: 16);
  static TextStyle get headline7 => headline1.copyWith(fontSize: 14);
  static TextStyle get headline8 => headline1.copyWith(fontSize: 12);

  // Lights
  static TextStyle get headline1w =>
      headline1.copyWith(color: AppColors.white, fontWeight: FontWeight.w700);
  static TextStyle get headline3w =>
      headline3.copyWith(color: AppColors.white, fontWeight: FontWeight.w700);

  // Primary styles (normal text, dark color)
  static TextStyle get dark20 =>
      headline4.copyWith(fontWeight: FontWeight.w400);
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
  static Color get primary => red;
  static Color get background => const Color(0xFFf4f4f4);

  static Color get red => const Color(0xFFEB5757);
  static Color get red2 => const Color(0xFFE15537);
  static Color get red3 => const Color(0xFFF45B5B);
  static Color get red4 => const Color(0xFFEB5757);

  static Color get red30 => red.withOpacity(.3);
  static Color get red10 => red.withOpacity(.1);
  static Color get bgMain => const Color(0xFFF8F8F8);
  static Color get tabBarInactive => const Color(0xFFB7BDC3);

  static Color get dark => const Color(0xFF212121);
  static Color get dark2 => const Color(0xFF343B47);
  static Color get dark3 => const Color(0xFFd1d2d5);
  static Color get grey3 => const Color(0xFFCFD3D9); // data and time icons
  static Color get grey4 => const Color(0xFFCFD5DA);
  static Color get grey5 => const Color(0xFFE5E5E5);
  static Color get grey6 => const Color(0xFFEEEEEE);
  static Color get grey7 => const Color(0xFFEEEFF2);
  static Color get grey8 => const Color(0xFFB3B8C0);
  static Color get grey9 => const Color(0xFF969696);
  static Color get grey10 => const Color(0xFFF8F8F8); //real bg main
  static Color get grey11 => const Color(0xFFF0F0F0);
  static Color get grey12 => const Color(0xFFEAEAEA);
  static Color get grey13 => const Color(0xFFEEEFF2);
  static Color get grey14 => const Color(0xFFF6F7F9);
  static Color get grey15 => const Color(0xFF9A9FA9);
  static Color get grey16 => const Color(0xFFAEB2BA);
  static Color get grey17 => const Color(0xFF737373);
  static Color get grey18 => const Color(0xFFececec);

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
