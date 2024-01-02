import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../domain/entities/image.dart';
import '../../../../domain/entities/product/product.dart';
import '../../../../domain/entities/product/size.dart';
import '../../../../domain/entities/saved_product.dart';
import '../../../../domain/usecases/products/fetch_product_usecase.dart';
import '../../../../domain/usecases/products/like_product_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(
    this._fetchProductUseCase,
    this._likeProductUseCase,
    // this._shareProductUseCase,
    // this._profileBloc,
  ) : super(DetailLoadInProgress()) {
    on<DetailRequested>((event, emit) async {
      emit(DetailLoadInProgress());
      final result = await _fetchProductUseCase(event.id);
      emit(result.fold(
        (error) => DetailLoadError(error.message, UniqueKey()),
        (product) {
          this.product = product;
          selectedColor = product.productImages.values.toList().first;
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

      final color =
          selectedColor ?? product.productImages.values.toList().first;
      final sp = SavedProduct(
        id: product.id,
        title: product.title,
        image: color.first.urlMini,
      );
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

    // on<DetailProductShared>((event, emit) async {
    //   emit(success(detailLoad: DetailLoad.share));
    //   final id = _profileBloc.profile?.id;
    //   final qs = id != null ? '?referral=$id' : '';
    //   // final link = '$kDynamicLinkPrefix/product/${product.id}$qs';
    //   // await DeepLinker.shareShortLink(link);
    //   await _shareProductUseCase(product.id);
    //   emit(success());
    // });
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
  // final ShareProductUseCase _shareProductUseCase;
  // final ProfileBloc _profileBloc;

  late Product product;
  Size? selectedSize;
  List<Image>? selectedColor;
}
