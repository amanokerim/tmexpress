import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/interface/bottom_tab.dart';
import '../bottom_tabs.dart';

part 'main_event.dart';

@injectable
class MainBloc extends Bloc<MainEvent, BottomTab> {
  MainBloc() : super(bottomTabs[0]) {
    on<MainTabChanged>((event, emit) => emit(bottomTabs[event.index]));
  }
}
