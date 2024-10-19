import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/bloc/home_bloc.dart';
import '../utils/navigation_helper.dart';
import 'app_image.dart';

class AppBannerB extends StatelessWidget {
  const AppBannerB({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      if (state is HomeLoadSuccess) {
        final banners = state.home.bBanners;
        if (banners.isEmpty) return const SizedBox();
        final banner = banners[Random().nextInt(banners.length)];
        return AspectRatio(
          aspectRatio: 4 / 1,
          child: GestureDetector(
            onTap: () => NavigationHelper.navigateToPTS(
                context, banner.type.name, banner.entityId),
            child: AppImage(
              banner.image,
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        );
      }
      return const SizedBox();
    });
  }
}
