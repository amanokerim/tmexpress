import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/enums/sort_types.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_error.dart';
import '../../../widgets/app_progress_indicator.dart';
import '../../detail/widgets/size_card.dart';
import '../bloc/filter/filter_bloc.dart';
import 'sort_filter_bottom_sheet.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet(this.subcategoryId, {Key? key}) : super(key: key);
  final int subcategoryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterSuccess) {
          return SortFilterBottomSheet(
            title: S.current.filter,
            child: Column(
              children: [
                SwitchListTile(
                  title:
                      Text(S.current.isDiscounted, style: AppTextStyle.bold16),
                  value: state.isDiscounted,
                  onChanged: (_) {},
                ),
                Wrap(
                  children: state.sizes
                      .map((size) => SizeCard(size, onPressed: () {}))
                      .toList(),
                ),
              ],
            ),
            onPressed: null,
          );
        } else if (state is FilterError) {
          return AppError(
            message: state.message,
            onPressed: () => context
                .read<FilterBloc>()
                .add(FilterSizesRequested(subcategoryId)),
          );
        }
        return const AppProgressIndicator();
      },
    );
  }
}
