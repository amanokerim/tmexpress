import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/entities/product/product_mini.dart';
import '../../widgets/product_paged_grid_view.dart';
import 'bloc/hot_bloc.dart';

class HotScreen extends StatefulWidget {
  const HotScreen({super.key});

  @override
  State<HotScreen> createState() => _HotScreenState();
}

class _HotScreenState extends State<HotScreen> {
  PagingController<String?, ProductMini> pagingController =
      PagingController(firstPageKey: null);
  int page = 1;

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((next) {
      context.read<HotBloc>().add(HotRequested(page.toString()));
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
      body: BlocListener<HotBloc, HotState>(
        listener: (_, state) {
          if (state is HotLoadSuccess) {
            pagingController.appendPage(state.products, (page++).toString());
          } else if (state is HotLoadError) {
            pagingController.error = state.message;
          }
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: ProductPagedGridView(pagingController),
            ),
          ],
        ),
      ),
    );
  }
}
