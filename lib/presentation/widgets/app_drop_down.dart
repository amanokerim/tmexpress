import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

import '../theme/app_theme.dart';

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    required this.label,
    required this.values,
    required this.selected,
    required this.onItemSelected,
    required this.toStr,
    this.height,
    Key? key,
  }) : super(key: key);

  final String label;
  final List<T> values;
  final T? selected;
  final void Function(T) onItemSelected;
  final String Function(T) toStr;
  final double? height;

  @override
  Widget build(BuildContext context) => MenuButton<T>(
        popupHeight: min(height ?? 240, values.length * 54),
        onItemSelected: onItemSelected,
        topDivider: false,
        showSelectedItemOnList: true,
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: inputDecoration,
            child: Row(
              children: [
                Expanded(
                  child: selected != null
                      ? Text(
                          toStr(selected!),
                          style: AppTextStyle.dark16,
                        )
                      : Text(label, style: AppTextStyle.dark16),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.dark)
              ],
            )),
        scrollPhysics: const BouncingScrollPhysics(),
        items: values,
        itemBuilder: (tax) => Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            toStr(tax),
            style: AppTextStyle.dark16,
          ),
        ),
        selectedItem: selected,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          backgroundBlendMode: BlendMode.color,
        ),
        divider: const Divider(height: .5),
        menuButtonBackgroundColor: Colors.transparent,
      );
}
