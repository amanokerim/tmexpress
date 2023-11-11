import 'package:flutter/material.dart';

final appTheme = ThemeData(
  fontFamily: 'Nunito',
  primaryColor: AppColors.primary,
  primarySwatch: _primarySwatch,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AppColors.bgMain,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.inputBg,
    border: InputBorder.none,
    labelStyle: AppTextStyle.grey16,
    enabledBorder: inputBorder,
    focusedBorder: inputBorder,
    errorBorder: inputBorder,
    focusedErrorBorder: inputBorder,
    floatingLabelBehavior: FloatingLabelBehavior.never,
  ),
  textTheme: TextTheme(
    bodyLarge: AppTextStyle.dark18,
    bodyMedium: AppTextStyle.dark16,
    displayLarge: AppTextStyle.bold32,
    displayMedium: AppTextStyle.bold26,
    displaySmall: AppTextStyle.bold24,
    headlineMedium: AppTextStyle.bold20,
    headlineSmall: AppTextStyle.bold18,
    titleLarge: AppTextStyle.bold16,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.bg,
  ),
);

final inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: BorderSide.none,
);
final inputErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: BorderSide.none,
);
final inputDecoration = BoxDecoration(
  color: AppColors.inputBg,
  borderRadius: const BorderRadius.all(Radius.circular(20)),
);

abstract class AppTextStyle {
  // Headlines
  static TextStyle get bold32 => TextStyle(
      fontSize: 32, fontWeight: FontWeight.w500, color: AppColors.textMain);
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
  static TextStyle get dark14 => dark20.copyWith(fontSize: 14);
  static TextStyle get dark12 => dark20.copyWith(fontSize: 12);
  static TextStyle get dark10 => dark20.copyWith(fontSize: 10);

  // Secondary styles (normal text with grey color)
  static TextStyle get grey20 => dark20.copyWith(color: AppColors.textSec);
  static TextStyle get grey18 => grey20.copyWith(fontSize: 18);
  static TextStyle get grey16 => grey20.copyWith(fontSize: 16);
  static TextStyle get grey14 => grey20.copyWith(fontSize: 14);
  static TextStyle get grey12 => grey20.copyWith(fontSize: 12);

  static TextStyle get white16 => dark16.copyWith(color: AppColors.white);
  static TextStyle get black20 => bold20.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get black16 => bold16.copyWith(fontWeight: FontWeight.w700);

  static TextStyle get priceTitle => TextStyle(
      color: Colors.grey[400], fontWeight: FontWeight.w300, fontSize: 14);
}

abstract class AppColors {
  static Color get primary => const Color(0xFF31313b);
  static Color get secondary => const Color(0xFFD0021B);

  static Color get bg => const Color(0xFFFEFEFE);
  static Color get bg2 => const Color(0xFFFAFAFA);
  static Color get inputBg => const Color(0xFFF7F7F7);

  static Color get bgMain => const Color(0xFFFFFFFF);
  static Color get tabBarInactive => const Color(0xFFB7BDC3);

  static Color get dark => const Color(0xFF212121);
  static Color get grey => const Color(0xFF999999);
  static Color get lGrey => const Color(0xFFDDDDDD);

  static Color get white => Colors.white;

  static Color get lightBlue => const Color(0xFFebf3ff);

  static Color get textMain => dark;
  static Color get textSec => const Color(0xFF858C95);
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
        900: AppColors.primary
      },
    );

const appShadow = [
  BoxShadow(
    offset: Offset(0, -4),
    blurRadius: 12,
    color: Color.fromRGBO(0, 0, 0, 0.06),
  )
];
