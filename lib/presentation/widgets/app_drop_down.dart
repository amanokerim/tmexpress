import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButton<T>(
        isExpanded: true,
        value: selected,
        borderRadius: BorderRadius.circular(20),
        hint: Text(label, style: const TextStyle(color: Colors.grey)),
        icon:
            const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
        style: const TextStyle(color: Colors.black, fontSize: 16),
        onChanged: (T? newValue) {
          if (newValue != null) {
            onItemSelected(newValue);
          }
        },
        items: values.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(toStr(value)),
            ),
          );
        }).toList(),
        dropdownColor: Colors.white,
        underline: const SizedBox(),
      ),
    );
  }
}
