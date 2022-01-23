import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../app/generated/l10n.dart';
import '../../domain/entities/product_mini.dart';
import 'app_error.dart';
import 'app_progress_indicator.dart';
import 'empty.dart';
import 'product_card.dart';

class ProductPagedGridView extends StatelessWidget {
  const ProductPagedGridView(this.pagingController, {Key? key})
      : super(key: key);
  final PagingController<String?, ProductMini> pagingController;

  PagedChildBuilderDelegate<ProductMini> get delegate =>
      PagedChildBuilderDelegate<ProductMini>(
        itemBuilder: (context, product, index) => ProductCard(product),
        firstPageErrorIndicatorBuilder: (_) => AppError(
          message: pagingController.error,
          onPressed: pagingController.retryLastFailedRequest,
        ),
        newPageErrorIndicatorBuilder: (_) => Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
          child: AppError(
            message: pagingController.error,
            onPressed: pagingController.retryLastFailedRequest,
          ),
        ),
        firstPageProgressIndicatorBuilder: (_) => const AppProgressIndicator(),
        newPageProgressIndicatorBuilder: (_) => const Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
            child: AppProgressIndicator()),
        noItemsFoundIndicatorBuilder: (_) => Emtpy(S.current.noProducts),
      );

  @override
  Widget build(BuildContext context) {
    return PagedGridView<String?, ProductMini>(
      physics: const BouncingScrollPhysics(),
      pagingController: pagingController,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .6,
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      showNewPageProgressIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      builderDelegate: delegate,
    );
  }
}
