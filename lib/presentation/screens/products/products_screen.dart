import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/entities/product_mini.dart';
import '../../../domain/entities/product_parent.dart';
import '../../widgets/primary_app_bar.dart';
import '../../widgets/product_paged_grid_view.dart';
import 'bloc/products_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({required this.productParent, Key? key})
      : super(key: key);
  final ProductParent productParent;

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
      context.read<ProductsBloc>().add(
          ProductsRequested(next: next, productParent: widget.productParent));
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
      appBar: PrimaryAppBar(label: widget.productParent.title),
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
