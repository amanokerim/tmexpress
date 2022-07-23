import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BottomTab extends Equatable {
  const BottomTab({
    required this.index,
    required this.title,
    required this.icon,
    required this.screen,
  });

  final int index;
  final String title;
  final String icon;
  final Widget screen;

  @override
  List<Object?> get props => [index];
}
