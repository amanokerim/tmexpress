import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/product_mini.dart';
import 'app_progress_indicator.dart';
import 'empty.dart';
import 'no_network.dart';
import 'product_card.dart';

class ProductPagedGridView extends StatelessWidget {
  const ProductPagedGridView(this.pagingController, {Key? key})
      : super(key: key);
  final PagingController<String?, ProductMini> pagingController;

  PagedChildBuilderDelegate<ProductMini> get delegate =>
      PagedChildBuilderDelegate<ProductMini>(
        itemBuilder: (context, product, index) => ProductCard(product),
        firstPageErrorIndicatorBuilder: (_) => Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 80),
          child: NoNetwork(
            pagingController.error,
            pagingController.retryLastFailedRequest,
          ),
        ),
        newPageErrorIndicatorBuilder: (_) => Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 80),
          child: NoNetwork(
            pagingController.error,
            pagingController.retryLastFailedRequest,
          ),
        ),
        firstPageProgressIndicatorBuilder: (_) => const Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 80),
          child: AppProgressIndicator(),
        ),
        newPageProgressIndicatorBuilder: (_) => const Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
            child: AppProgressIndicator()),
        noItemsFoundIndicatorBuilder: (_) => const Emtpy('no_products'),
      );

  @override
  Widget build(BuildContext context) {
    return PagedGridView<String?, ProductMini>(
      physics: const BouncingScrollPhysics(),
      pagingController: pagingController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      builderDelegate: delegate,
    );
  }
}
