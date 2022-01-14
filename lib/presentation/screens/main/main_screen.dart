import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/interface/bottom_tab.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../widgets/app_bottom_navigation_bar.dart';
import '../../widgets/primary_app_bar.dart';
import 'bloc/main_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, BottomTab>(
      builder: (_, tab) {
        return Scaffold(
            backgroundColor: AppColors.bgMain,
            appBar: PrimaryAppBar(label: tab.title),
            body: AnimatedSwitcher(
                duration: kAnimationDuration,
                child: Container(
                  key: ValueKey(tab.index),
                  child: tab.screen,
                )),
            bottomNavigationBar:
                AppBottomNavigationBar(currentIndex: tab.index));
      },
    );
  }
}
