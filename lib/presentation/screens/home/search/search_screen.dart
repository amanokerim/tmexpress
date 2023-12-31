import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../domain/entities/product/product_mini.dart';
import '../../../../domain/usecases/products/search_product_usecase.dart';
import '../../../widgets/primary_app_bar.dart';
import '../../../widgets/product_paged_grid_view.dart';
import '../../../widgets/search_app_bar.dart';
import 'bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen(this.params, {Key? key}) : super(key: key);
  final SearchParams params;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _pagingController =
      PagingController<String?, ProductMini>(firstPageKey: null);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((next) {
      context.read<SearchBloc>().add(SearchRequested(widget.params, next));
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.params.title.isNotEmpty
          ? PrimaryAppBar(label: widget.params.title)
          : SearchAppBar(query: widget.params.query),
      body: BlocListener<SearchBloc, SearchState>(
        listener: (_, state) {
          if (state is SearchSuccess) {
            if (state.clear) _pagingController.itemList?.clear();
            if (state.next == null) {
              _pagingController.appendLastPage(state.products);
            } else {
              _pagingController.appendPage(state.products, state.next);
            }
          } else if (state is SearchError) {
            _pagingController.error = state.message;
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                sliver: ProductPagedGridView(_pagingController)),
          ],
        ),
      ),
    );
  }
}
