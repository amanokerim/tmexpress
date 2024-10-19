import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_banner_b.dart';
import '../../widgets/app_carousel_slider.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_loader.dart';
import '../detail/widgets/random.w.dart';
import 'bloc/home_bloc.dart';
import 'widgets/shops.dart';
import 'widgets/tag.w.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      if (state is HomeLoadSuccess) {
        return ListView(
          children: [
            const SizedBox(height: 8),
            AppCarouselSlider(state.home.aBanners),
            const Shops(),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: AppBannerB(),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.home.tags.length,
              itemBuilder: (_, index) => TagWidget(state.home.tags[index]),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: AppBannerB(),
            ),
            const RandomW(),
          ],
        );
      } else if (state is HomeLoadError) {
        return AppErrorScreen(
            message: state.message,
            onPressed: () => context.read<HomeBloc>().add(HomeRequested()));
      }
      return const AppLoader();
    });
  }
}
