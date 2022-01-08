import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/bloc/home_bloc.dart';
import '../theme/app_theme.dart';
import 'app_bottom_nav_bar_item.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    required this.currentIndex,
    Key? key,
  }) : super(key: key);
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.dark,
        currentIndex: currentIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (index) => homeBloc.add(HomeTabChanged(index: index)),
        items: homeBloc.bottomTabs
            .map<BottomNavigationBarItem>((tab) =>
                AppBottomNavBarItem(iconFile: tab.icon, label: tab.title))
            .toList(),
      ),
    );
  }
}
