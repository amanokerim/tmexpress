import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/enums/sort_types.dart';
import '../../../../domain/entities/product_mini.dart';
import '../bloc/products_bloc.dart';
import 'sort_bottom_sheet.dart';
import 'sort_filter_button.dart';

class SortFilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  SortFilterHeaderDelegate(this.pagingController);
  final PagingController<String?, ProductMini> pagingController;

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
                  builder: (_) => SortBottomSheet(
                    sortType: context.read<ProductsBloc>().sortType,
                  ),
                );
                print(sortType);
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
              () {},
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
