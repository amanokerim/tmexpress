import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/size.dart';
import '../../../../../domain/usecases/products/fetch_subcategory_sizes.dart';
import '../../../../bloc/app_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

@injectable
class FilterBloc extends AppBloc<FilterEvent, FilterState> {
  FilterBloc(this._fetchSizes) : super(FilterLoad()) {
    on<FilterSizesRequested>((event, emit) async {
      emit(FilterLoad());
      final r = await _fetchSizes(event.subcategoryId);
      emit(r.fold(
        (failure) => FilterError(mapError(failure)),
        (sizes) {
          _sizes = sizes;
          return FilterSuccess(isDiscounted: _isDiscounted, sizes: sizes);
        },
      ));
    });
  }

  var _isDiscounted = false;
  var _sizes = <Size>[];

  final FetchSubcategorySizesUseCase _fetchSizes;
}
