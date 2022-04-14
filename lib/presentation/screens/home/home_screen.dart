import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_carousel_slider.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_progress_indicator.dart';
import 'bloc/home_bloc.dart';
import 'widgets/tag.w.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      if (state is HomeLoadSuccess) {
        return ListView(
          children: [
            const SizedBox(height: 16),
            AppCarouselSlider(state.home.banners),
            ListView.builder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.home.tags.length,
              itemBuilder: (_, index) => TagWidget(state.home.tags[index]),
            ),
          ],
        );
      } else if (state is HomeLoadError) {
        return AppErrorScreen(
            message: state.message,
            onPressed: () => context.read<HomeBloc>().add(HomeRequested()));
      }
      return const AppProgressIndicator();
    });
  }
}
