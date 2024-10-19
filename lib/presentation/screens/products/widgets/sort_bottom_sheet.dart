import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/enums/sort_types.dart';
import 'sort_filter_bottom_sheet.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({required this.sortType, super.key});
  final SortType sortType;

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  SortType? _selected;
  @override
  void initState() {
    super.initState();
    _selected = widget.sortType;
  }

  @override
  Widget build(BuildContext context) {
    return SortFilterBottomSheet(
      title: S.current.sort,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: SortType.values.length,
        itemBuilder: (_, index) => RadioListTile<SortType>(
          value: SortType.values[index],
          groupValue: _selected,
          onChanged: (sortType) => setState(() => _selected = sortType),
          contentPadding: EdgeInsets.zero,
          title: Text(SortType.values[index].title),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      onPressed:
          _selected != null ? () => Navigator.of(context).pop(_selected) : null,
    );
  }
}
