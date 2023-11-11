import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product/home.dart';
import '../../../../domain/usecases/products/fetch_home_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._fetchHomeUseCase) : super(HomeLoadInProgress()) {
    on<HomeRequested>((event, emit) async {
      emit(HomeLoadInProgress());
      final result = await _fetchHomeUseCase();
      emit(result.fold(
        (error) => HomeLoadError(error.message, UniqueKey()),
        HomeLoadSuccess.new,
      ));
    });
  }

  final FetchHomeUseCase _fetchHomeUseCase;
}
