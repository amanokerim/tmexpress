import 'package:flutter/material.dart';

class AppInputBorder {
  static InputBorder custom(Color color, {double? width}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: color,
          width: width ?? .5,
        ));
  }
}
