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
    this.title = '',
    this.isRandom,
    this.countryId,
  });

  factory SearchParams.withNext(SearchParams params, String? next) =>
      SearchParams(
        query: params.query,
        next: next,
        countryId: params.countryId,
        isRandom: params.isRandom,
        title: params.title,
      );

  final String query;
  final String? next;
  final String title;
  final int? isRandom;
  final int? countryId;

  SearchParams copyWith({
    String? query,
    String? next,
    String? title,
    int? isRandom,
    int? countryId,
  }) {
    return SearchParams(
      query: query ?? this.query,
      next: next ?? this.next,
      title: title ?? this.title,
      isRandom: isRandom ?? this.isRandom,
      countryId: countryId ?? this.countryId,
    );
  }
}
