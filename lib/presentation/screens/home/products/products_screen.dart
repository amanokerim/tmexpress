import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../domain/entities/product_mini.dart';
import '../../../widgets/product_paged_grid_view.dart';
import 'bloc/products_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({required this.id, required this.type, Key? key})
      : super(key: key);
  final ProductsScreenType type;
  final int id;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  PagingController<String?, ProductMini> pagingController =
      PagingController(firstPageKey: null);

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((next) {
      context
          .read<ProductsBloc>()
          .add(ProductsRequested(next: next, id: widget.id, type: widget.type));
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProductsBloc, ProductsState>(
        listener: (_, state) {
          if (state is ProductsLoadSuccess) {
            print(state.products);
            if (state.clear) pagingController.itemList?.clear();
            if (state.next == null) {
              pagingController.appendLastPage(state.products);
            } else {
              pagingController.appendPage(state.products, state.next);
            }
          } else if (state is ProductsLoadError) {
            pagingController.error = state.message;
          }
        },
        child: ProductPagedGridView(pagingController),
      ),
    );
  }
}
