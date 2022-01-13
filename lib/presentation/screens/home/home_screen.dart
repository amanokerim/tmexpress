import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/my_carousel_slider.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      if (state is HomeLoadSuccess) {
        return ListView(
          children: [
            MyCarouselSlider(state.home.banners),
          ],
        );
      } else if (state is HomeLoadError) {
        return Center(child: Text(state.message));
      }
      return const CircularProgressIndicator();
    });
  }
}
