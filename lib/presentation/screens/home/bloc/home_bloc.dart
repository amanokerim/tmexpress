import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/interface/bottom_tab.dart';
import '../../../bloc/app_bloc.dart';
import '../../product/product_list_page.dart';

part 'home_event.dart';

@injectable
class HomeBloc extends AppBloc<HomeEvent, BottomTab> {
  HomeBloc()
      : super(BottomTab(
            index: 0,
            title: S.current.tab0,
            icon: Icons.ac_unit,
            screen: const ProductListPage())) {
    on<HomeTabChanged>((event, emit) => emit(bottomTabs[event.index]));
  }

  final bottomTabs = <BottomTab>[
    BottomTab(
      index: 0,
      title: S.current.tab0,
      icon: Icons.ac_unit,
      screen: const ProductListPage(),
    ),
    BottomTab(
      index: 1,
      title: S.current.tab1,
      icon: Icons.alarm,
      screen: Text(S.current.tab1),
    ),
    BottomTab(
      index: 2,
      title: S.current.tab2,
      icon: Icons.add,
      screen: Text(S.current.tab2),
    ),
    BottomTab(
      index: 3,
      title: S.current.tab3,
      icon: Icons.person,
      screen: Text(S.current.tab3),
    ),
  ];
}
