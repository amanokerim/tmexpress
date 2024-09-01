// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../entities/product/pagination.dart';
import '../../entities/product/product_mini.dart';
import '../../errors/app_error.dart';
import '../../repositories/product_repository.dart';
import '../usecase.dart';

@lazySingleton
class SearchProductsUseCase
    extends UseCase<PaginationM<ProductMini>, SearchParams> {
  SearchProductsUseCase(this._productRepository);
  final ProductRepository _productRepository;

  @override
  Future<Either<AppError, PaginationM<ProductMini>>> call(
          SearchParams params) =>
      params.query.isNotEmpty || params.title.isNotEmpty
          ? _productRepository.searchProducts(params)
          : _productRepository.fetchHotProducts(params.next);
}

class SearchParams {
  SearchParams({
    required this.query,
    this.next,
    this.nextRaw,
    this.title = '',
    this.isRandom,
    this.countryId,
    this.brandId,
  });

  factory SearchParams.withNext(SearchParams params, String? next) =>
      SearchParams(
        query: params.query,
        next: next,
        countryId: params.countryId,
        brandId: params.brandId,
        isRandom: params.isRandom,
        title: params.title,
      );

  final String query;
  final String? next;
  final String? nextRaw;
  final String title;
  final int? isRandom;
  final int? countryId;
  final int? brandId;

  SearchParams copyWith({
    String? query,
    String? next,
    String? nextRaw,
    String? title,
    int? isRandom,
    int? countryId,
    int? brandId,
  }) {
    return SearchParams(
      query: query ?? this.query,
      next: next ?? this.next,
      nextRaw: nextRaw ?? this.nextRaw,
      title: title ?? this.title,
      isRandom: isRandom ?? this.isRandom,
      countryId: countryId ?? this.countryId,
      brandId: brandId ?? this.brandId,
    );
  }
}
