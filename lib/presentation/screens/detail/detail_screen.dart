import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_mini.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_progress_indicator.dart';
import 'bloc/detail_bloc.dart';
import 'widgets/product_images.dart';
import 'widgets/product_sizes.dart';
import 'widgets/product_widgets.dart';
import 'widgets/sliver_image_delegate.dart';

const titleHeight = 53.0;

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.product, {Key? key}) : super(key: key);
  final ProductMini product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(builder: (_, state) {
      if (state is DetailLoadSuccess) {
        final productWidgets = ProductWidgets(state);
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                  delegate: SliverImageDelegate(context, state), pinned: true),
              SliverToBoxAdapter(
                child: ListView(
                  padding: const EdgeInsets.only(top: titleHeight),
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    if (state.product.productImages.length > 1)
                      ...ProductImages(state).widgets(),
                    ...ProductSizes(state).widgets(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24 - 6, 20, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...productWidgets.prices(),
                          ...productWidgets.description(),
                          ...productWidgets.description(),
                          ...productWidgets.weight()
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: productWidgets.addToCardButton(context),
        );
      } else if (state is DetailLoadError) {
        return Scaffold(
            body: AppError(
          message: state.message,
          onPressed: () =>
              context.read<DetailBloc>().add(DetailRequested(product.id)),
        ));
      }
      return const Scaffold(body: AppProgressIndicator());
    });
  }
}
