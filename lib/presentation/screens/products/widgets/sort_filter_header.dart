import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../app/injection/injection.dart';
import '../../../../domain/entities/enums/sort_types.dart';
import '../../../../domain/entities/interface/filter_options.dart';
import '../../../../domain/entities/product_mini.dart';
import '../../../theme/app_theme.dart';
import '../bloc/filter/filter_bloc.dart';
import '../bloc/products_bloc.dart';
import 'filter_bottom_sheet.dart';
import 'sort_bottom_sheet.dart';
import 'sort_filter_button.dart';

class SortFilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  SortFilterHeaderDelegate(this.pagingController, this.subcategoryId);
  final PagingController<String?, ProductMini> pagingController;
  final int subcategoryId;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: SortFilterButton(
              S.current.sort,
              'sort.png',
              () async {
                final sortType = await showModalBottomSheet<SortType>(
                  context: context,
                  shape: _sheetShape,
                  builder: (_) => SortBottomSheet(
                    sortType: context.read<ProductsBloc>().sortType,
                  ),
                );
                if (sortType != null) {
                  context
                      .read<ProductsBloc>()
                      .add(ProductsSortTypeChanged(sortType));
                  pagingController.refresh();
                }
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SortFilterButton(
              S.current.filter,
              'filter.png',
              () async {
                final filterOptions = await showModalBottomSheet<FilterOptions>(
                  context: context,
                  shape: _sheetShape,
                  builder: (_) => BlocProvider<FilterBloc>(
                    create: (context) =>
                        getIt()..add(FilterSizesRequested(subcategoryId)),
                    child: FilterBottomSheet(subcategoryId),
                  ),
                );
                if (filterOptions != null) {
                  context
                      .read<ProductsBloc>()
                      .add(ProductsFilterOptionsChanged(filterOptions));
                  pagingController.refresh();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(_) => false;
}

const _sheetShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
);
