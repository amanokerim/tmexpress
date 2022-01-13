import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/interface/bottom_tab.dart';
import '../../../bloc/app_bloc.dart';
import '../../category/category_page.dart';
import '../../home/home_page.dart';

part 'main_event.dart';

@injectable
class MainBloc extends AppBloc<MainEvent, BottomTab> {
  MainBloc()
      : super(BottomTab(
            index: 0,
            title: S.current.homeScreen,
            icon: Icons.ac_unit,
            screen: const HomePage())) {
    on<MainTabChanged>((event, emit) => emit(bottomTabs[event.index]));
  }

  final bottomTabs = <BottomTab>[
    BottomTab(
      index: 0,
      title: S.current.homeScreen,
      icon: Icons.ac_unit,
      screen: const HomePage(),
    ),
    BottomTab(
      index: 1,
      title: S.current.categories,
      icon: Icons.alarm,
      screen: const CategoryPage(),
    ),
    BottomTab(
      index: 2,
      title: S.current.hot,
      icon: Icons.add,
      screen: Text(S.current.hot),
    ),
    BottomTab(
      index: 3,
      title: S.current.cart,
      icon: Icons.person,
      screen: Text(S.current.cart),
    ),
    BottomTab(
      index: 4,
      title: S.current.profile,
      icon: Icons.person,
      screen: Text(S.current.profile),
    ),
  ];
}
