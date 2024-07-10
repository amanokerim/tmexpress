import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/main/bloc/main_bloc.dart';
import '../screens/main/bottom_tabs.dart';
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
    final homeBloc = context.read<MainBloc>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(color: AppColors.lGrey, width: .3),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BottomNavigationBar(
          backgroundColor: AppColors.white,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.dark,
          currentIndex: currentIndex,
          selectedLabelStyle: AppTextStyle.black16.copyWith(fontSize: 12),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (index) => homeBloc.add(MainTabChanged(index: index)),
          items: bottomTabs
              .map<BottomNavigationBarItem>((tab) => AppBottomNavBarItem(
                  iconFile: tab.icon, label: bottomTabTitle(tab.index)))
              .toList(),
        ),
      ),
    );
  }
}
