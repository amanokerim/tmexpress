import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Banner;

import '../../domain/entities/product/banner.dart';
import '../theme/app_theme.dart';
import '../utils/navigation_helper.dart';

class AppCarouselSlider extends StatefulWidget {
  const AppCarouselSlider(this.banners, {Key? key}) : super(key: key);
  final List<Banner> banners;

  @override
  _AppCarouselSliderState createState() => _AppCarouselSliderState();
}

class _AppCarouselSliderState extends State<AppCarouselSlider> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 7 / 4,
      child: Stack(
        children: [
          CarouselSlider(
            items: widget.banners.map(_buildBanner).toList(),
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

  Widget _buildBanner(Banner banner) => GestureDetector(
        onTap: () => NavigationHelper.navigateToPTS(
            context, banner.type.name, banner.entityId),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            width: double.infinity,
            imageUrl: banner.image,
            fit: BoxFit.cover,
            errorWidget: (_, image, __) =>
                Icon(Icons.image, color: AppColors.grey, size: 120),
          ),
        ),
      );
}
