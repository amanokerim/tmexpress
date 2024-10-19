import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../app/generated/l10n.dart';
import '../../domain/entities/product/product_mini.dart';
import 'app_empty.dart';
import 'app_error.dart';
import 'app_loader.dart';
import 'product_card.dart';

class ProductPagedGridView extends StatelessWidget {
  const ProductPagedGridView(this.pagingController, {super.key});
  final PagingController<String?, ProductMini> pagingController;

  PagedChildBuilderDelegate<ProductMini> get delegate =>
      PagedChildBuilderDelegate<ProductMini>(
        itemBuilder: (context, product, index) => ProductCard(product),
        firstPageErrorIndicatorBuilder: (_) => AppErrorScreen(
          message: pagingController.error,
          onPressed: pagingController.retryLastFailedRequest,
        ),
        newPageErrorIndicatorBuilder: (_) => Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
          child: AppErrorScreen(
            message: pagingController.error,
            onPressed: pagingController.retryLastFailedRequest,
          ),
        ),
        firstPageProgressIndicatorBuilder: (_) => const AppLoader(),
        newPageProgressIndicatorBuilder: (_) => const Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 50), child: AppLoader()),
        noItemsFoundIndicatorBuilder: (_) =>
            AppEmpty(message: S.current.noProducts),
      );

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid(
      pagingController: pagingController,
      builderDelegate: delegate,
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .6,
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
    );
  }
}
