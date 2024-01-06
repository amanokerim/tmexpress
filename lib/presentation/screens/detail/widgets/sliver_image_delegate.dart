import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Image;

import '../../../../domain/entities/image.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/app_image.dart';
import '../bloc/detail_bloc.dart';
import '../detail_screen.dart';
import 'photo_view_page.dart';
import 'product_widgets.dart';

class SliverImageDelegate extends SliverPersistentHeaderDelegate {
  SliverImageDelegate(this.context, this.state);
  final BuildContext context;
  final DetailLoadSuccess state;
  int selectedIndex = 0;
  final carouselController = CarouselController();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final image =
        state.selectedColor ?? state.product.productImages.values.first;
    final allImages = <Image>[];
    state.product.productImages.values.forEach(allImages.addAll);

    return Container(
      key: ObjectKey(image),
      color: AppColors.white,
      child: Stack(
        children: [
          Positioned.fill(
            child: CarouselSlider(
              carouselController: carouselController,
              items: image
                  .map((i) => GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => PhotoViewPage(
                              images: allImages,
                              title: state.product.title,
                              initialIndex:
                                  allImages.indexOf(image[selectedIndex]),
                            ),
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: i.url,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => const AppImagePlaceholder(),
                          errorWidget: (_, __, ___) =>
                              const AppImagePlaceholder(),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: false,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                aspectRatio: image.first.width / image.first.height,
                onPageChanged: (index, reason) => selectedIndex = index,
              ),
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
      ),
    );
  }

  @override
  double get maxExtent {
    final img = state.selectedColor?.first ??
        state.product.productImages.values.first.first;
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
