import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../bloc/detail_bloc.dart';
import '../detail_screen.dart';
import 'product_widgets.dart';

class SliverImageDelegate extends SliverPersistentHeaderDelegate {
  SliverImageDelegate(this.context, this.state);
  final BuildContext context;
  final DetailLoadSuccess state;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final image = state.selectedColor ?? state.product.productImages[0];

    return Stack(
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: image.url,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Transform.translate(
            offset: const Offset(0, titleHeight),
            child: Column(
              children: [
                Container(
                  height: 32,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                ),
                Container(
                  height: titleHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: _whiteShadowDecoration,
                  child: ProductWidgets(state).title,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent {
    final img = state.selectedColor ?? state.product.productImages[0];
    final displayWidth = MediaQuery.of(context).size.width;
    return img.height * displayWidth / img.width;
  }

  @override
  double get minExtent => titleHeight + 32; // 32 is top border area

  @override
  bool shouldRebuild(covariant SliverImageDelegate oldDelegate) =>
      oldDelegate.state != state;

  BoxDecoration get _whiteShadowDecoration => const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 5, spreadRadius: 5)
        ],
      );
}