import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/env/env.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_progress_indicator.dart';
import 'bloc/detail_bloc.dart';
import 'widgets/product_sizes.dart';
import 'widgets/product_widgets.dart';
import 'widgets/sliver_image_delegate.dart';

const titleHeight = 53.0;

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.productId, {Key? key}) : super(key: key);
  final int productId;

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
                      ...productWidgets.images(),
                    ...ProductSizes(state).widgets(context),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24 - 6, 20, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...productWidgets.sizeTable(context),
                          ...productWidgets.prices(),
                          ...productWidgets.country(),
                          ...productWidgets.description(),
                          if (state.product.video.length >
                              Env.value.baseUrl.length) ...[
                            const SizedBox(height: 16),
                            productWidgets.video(context),
                          ],
                          const SizedBox(height: 16),
                          productWidgets.like(context),
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
            body: AppErrorScreen(
          message: state.message,
          onPressed: () =>
              context.read<DetailBloc>().add(DetailRequested(productId)),
        ));
      }
      return const Scaffold(body: AppProgressIndicator());
    });
  }
}
