import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:injectable/injectable.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/image.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/entities/saved_product.dart';
import '../../../../domain/entities/size.dart';
import '../../../../domain/usecases/products/fetch_product_usecase.dart';
import '../../../../domain/usecases/products/like_product_usecase.dart';
import '../../../../domain/usecases/products/share_product_usecase.dart';
import '../../../bloc/app_bloc.dart';
import '../../../utils/constants.dart';
import '../../../utils/deeplinker.dart';
import '../../profile/bloc/profile_bloc.dart';

part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends AppBloc<DetailEvent, DetailState> {
  DetailBloc(this._fetchProductUseCase, this._likeProductUseCase,
      this._shareProductUseCase, this._profileBloc)
      : super(DetailLoadInProgress()) {
    on<DetailRequested>((event, emit) async {
      emit(DetailLoadInProgress());
      final result = await _fetchProductUseCase(event.id);
      emit(result.fold(
        (failure) => DetailLoadError(message(failure), UniqueKey()),
        (product) {
          this.product = product;
          return success();
        },
      ));
    });

    on<DetailColorChanged>((event, emit) {
      selectedColor = event.color;
      emit(success());
    });

    on<DetailSizeChanged>((event, emit) {
      selectedSize = event.size;
      emit(success());
    });

    on<DetailProductLikeToggled>((event, emit) async {
      product = product.copyWith(isLiked: !product.isLiked);
      emit(success());

      final sp = SavedProduct(
          id: product.id,
          title: product.title,
          image: product.productImages[0].urlMini);
      final r = await _likeProductUseCase(sp);
      final failed = r.fold((l) => true, (r) => false);

      if (failed) {
        final flashMessage = product.isLiked
            ? S.current.removeFromFavoritesError
            : S.current.addToFavoritesError;
        product = product.copyWith(isLiked: !product.isLiked);
        emit(success(flashMessage: flashMessage));
      }
    });

    on<DetailProductShared>((event, emit) async {
      emit(success(detailLoad: DetailLoad.share));
      final id = _profileBloc.profile?.id;
      final qs = id != null ? '?referral=$id' : '';
      final link = '$kDynamicLinkPrefix/product/${product.id}$qs';
      await DeepLinker.shareShortLink(link);
      await _shareProductUseCase(product.id);
      emit(success());
    });
  }

  DetailLoadSuccess success({
    String? flashMessage,
    DetailLoad? detailLoad,
  }) =>
      DetailLoadSuccess(product,
          selectedSize: selectedSize,
          selectedColor: selectedColor,
          flashMessage: flashMessage,
          detailLoad: detailLoad ?? DetailLoad.none);

  final FetchProductUseCase _fetchProductUseCase;
  final LikeProductUseCase _likeProductUseCase;
  final ShareProductUseCase _shareProductUseCase;
  final ProfileBloc _profileBloc;

  late Product product;
  Size? selectedSize;
  Image? selectedColor;
}
