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
    on<FilterEvent>((event, emit) => key = !key);

    on<FilterSizesRequested>((event, emit) async {
      emit(FilterLoad());
      final r = await _fetchSizes(event.subcategoryId);
      emit(r.fold(
        (failure) => FilterError(mapError(failure)),
        (sizes) {
          _sizes = sizes;
          return _filterSuccess;
        },
      ));
    });

    on<FilterSizeToggled>((event, emit) {
      final index = _sizes.indexOf(event.size);
      if (index != -1) {
        _sizes[index] = _sizes[index].toggleSelected();
        emit(_filterSuccess);
      }
    });

    on<FilterDiscountedToggled>((event, emit) {
      _isDiscounted = !_isDiscounted;
      emit(_filterSuccess);
    });

    on<FilterAllSizesSelected>((event, emit) {
      for (var i = 0; i < _sizes.length; i++) {
        _sizes[i] = _sizes[i].makeSelected();
      }
      emit(_filterSuccess);
    });
  }

  FilterSuccess get _filterSuccess =>
      FilterSuccess(key: key, isDiscounted: _isDiscounted, sizes: _sizes);

  var _isDiscounted = false;
  var _sizes = <Size>[];
  bool key = false;

  final FetchSubcategorySizesUseCase _fetchSizes;
}
