import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../app/injection/injection.dart';
import '../../../../domain/entities/product/tag.dart';
import '../../../../domain/usecases/products/search_product_usecase.dart';
import '../../../widgets/app_loader.dart';
import '../../home/search/bloc/search_bloc.dart';
import '../../home/search/search_page.dart';
import '../../home/widgets/tag.w.dart';

class SimilarProductsW extends StatelessWidget {
  const SimilarProductsW(this.query, {super.key});
  final String query;

  @override
  Widget build(BuildContext context) {
    final params = SearchParams(
      query: query,
      isRandom: 1,
      title: S.current.similarProducts,
    );
    return BlocProvider<SearchBloc>(
      create: (context) => getIt()..add(SearchRequested(params, null)),
      child: BlocBuilder<SearchBloc, SearchState>(builder: (_, state) {
        if (state is SearchSuccess) {
          final tag = Tag(
            id: 0,
            title: S.current.similarProducts,
            products: state.products,
          );
          return TagWidget(
            tag,
            onAllPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => SearchPage(params))),
          );
        }
        return const AppLoader();
      }),
    );
  }
}
