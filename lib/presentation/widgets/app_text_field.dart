import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/input_border.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    required this.controller,
    required this.onDone,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.scrollPadding = const EdgeInsets.all(20),
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.backgroundColor = Colors.white,
    this.maxLength,
    this.borderColor,
    this.borderWidth,
    this.onChanged,
    this.contentPadding,
    this.minLines,
    this.maxLines,
    this.onTap,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);
  final String? label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final EdgeInsets scrollPadding;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final VoidCallback onDone;
  final FocusNode? focusNode;
  final Color backgroundColor;
  final int? maxLength;
  final Color? borderColor;
  final double? borderWidth;
  final Function? onChanged;
  final EdgeInsets? contentPadding;
  final int? minLines;
  final int? maxLines;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (text) {
        // ignore: void_checks
        return (onChanged != null) ? onChanged!(text) : null;
      },
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: label,
        hintStyle: AppTextStyle.dark16.copyWith(color: AppColors.textHint),
        enabledBorder: AppInputBorder.custom(
          borderColor ?? AppColors.textHint,
          width: borderWidth,
        ),
        focusedBorder: AppInputBorder.custom(
          borderColor ?? AppColors.dark,
          width: borderWidth,
        ),
        focusedErrorBorder: AppInputBorder.custom(AppColors.red),
        errorBorder: AppInputBorder.custom(AppColors.red),
        errorStyle: AppTextStyle.dark12.copyWith(color: AppColors.red),
        counterText: '',
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      validator: validator,
      scrollPadding: scrollPadding,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (_) => onDone(),
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines ?? 1,
      onTap: onTap,
    );
  }
}
