import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/product/filter_options.dart';
import '../../../../domain/entities/product/size.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_error.dart';
import '../../../widgets/app_loader.dart';
import '../../detail/widgets/size.w.dart';
import '../bloc/filter/filter_bloc.dart';
import 'sort_filter_bottom_sheet.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet(this.subcategoryId, {super.key});
  final int subcategoryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterSuccess) {
          return SortFilterBottomSheet(
            title: S.current.filter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(S.current.isDiscounted,
                        style: AppTextStyle.bold16),
                    value: state.isDiscounted,
                    onChanged: (_) => context
                        .read<FilterBloc>()
                        .add(FilterDiscountedToggled()),
                  ),
                  if (state.sizes.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.current.sizes, style: AppTextStyle.bold16),
                        TextButton(
                            onPressed: () => context
                                .read<FilterBloc>()
                                .add(FilterAllSizesSelected()),
                            child: Text(S.current.selectAll))
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: state.sizes
                          .map((size) => _toSizeCard(context, size))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
            onPressed: state.sizes.any((size) => size.selected)
                ? () => _applyButtonPressed(context, state)
                : null,
          );
        } else if (state is FilterError) {
          return AppErrorScreen(
            message: state.message,
            onPressed: () => context
                .read<FilterBloc>()
                .add(FilterSizesRequested(subcategoryId)),
          );
        }
        return const AppLoader(size: 80);
      },
    );
  }

  SizeW _toSizeCard(BuildContext context, Size size) => SizeW(
        size,
        onPressed: () =>
            context.read<FilterBloc>().add(FilterSizeToggled(size)),
        selected: size.selected,
      );

  void _applyButtonPressed(BuildContext context, FilterSuccess state) {
    final selectedSizes = state.sizes.where((size) => size.selected).toList();
    final filterOptions =
        FilterOptions(isDiscounted: state.isDiscounted, sizes: selectedSizes);
    Navigator.of(context).pop(filterOptions);
  }
}
