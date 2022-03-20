import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/home.dart';
import '../../../../domain/usecases/products/fetch_home_usecase.dart';
import '../../../bloc/app_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends AppBloc<HomeEvent, HomeState> {
  HomeBloc(this._fetchHomeUseCase) : super(HomeLoadInProgress()) {
    on<HomeRequested>((event, emit) async {
      emit(HomeLoadInProgress());
      final result = await _fetchHomeUseCase();
      emit(result.fold(
        (failure) => HomeLoadError(message(failure), UniqueKey()),
        (home) => HomeLoadSuccess(home),
      ));
    });
  }

  final FetchHomeUseCase _fetchHomeUseCase;
}
