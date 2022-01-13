import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Banner;

import '../../domain/entities/banner.dart';
import '../theme/app_theme.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider(this.banners, {Key? key}) : super(key: key);
  final List<Banner> banners;

  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 7 / 4,
      child: Stack(
        children: [
          CarouselSlider(
            items: widget.banners
                .map((bannner) => GestureDetector(
                      onTap: () {},
                      // onTap: () => _handleBannnerTap(bannner),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                            width: double.infinity,
                            imageUrl: bannner.image,
                            fit: BoxFit.cover,
                            errorWidget: (_, image, __) {
                              return Icon(Icons.image,
                                  color: AppColors.grey, size: 120);
                            }),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              viewportFraction: .92,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.easeInQuad,
              onPageChanged: (index, _) => setState(() => _index = index),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.banners.map((bannner) {
                final ind = widget.banners.indexOf(bannner);
                final active = ind == _index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 4,
                  width: active ? 16.0 : 4.0,
                  decoration: BoxDecoration(
                    color: active ? AppColors.primary : AppColors.lGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // _handleBannnerTap(Bannner bannner) {
  //   {
  //     if (bannner.openId != 0 && bannner.title.isNotEmpty) {
  //       Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
  //         if (bannner.type == 'product') {
  //           final product = Product(
  //               id: bannner.openId,
  //               title: bannner.title,
  //               image: '',
  //               oldPrice: 0.0,
  //               price: 0.0);
  //           return BlocProvider<ProductDetailCubit>(
  //             create: (_) => ProductDetailCubit(),
  //             child: ProductPage(product),
  //           );
  //         }
  //         final subcategory = Subcategory(
  //           id: bannner.openId,
  //           title: bannner.title,
  //         );
  //         return BlocProvider<SubcategoryCubit>(
  //           create: (_) => SubcategoryCubit(),
  //           child: SubcategoryPage(subcategory),
  //         );
  //       }));
  //     }
  //   }
  // }
}
