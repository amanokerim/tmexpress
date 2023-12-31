import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/generated/l10n.dart';
import '../../../../app/injection/injection.dart';
import '../../../../domain/entities/product/tag.dart';
import '../../../../domain/usecases/products/search_product_usecase.dart';
import '../../../widgets/app_progress_indicator.dart';
import '../../home/search/bloc/search_bloc.dart';
import '../../home/search/search_page.dart';
import '../../home/widgets/tag.w.dart';

class RandomW extends StatelessWidget {
  const RandomW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params =
        SearchParams(query: '', isRandom: 1, title: S.current.randomProducts);
    return BlocProvider<SearchBloc>(
      create: (context) => getIt()..add(SearchRequested(params, null)),
      child: BlocBuilder<SearchBloc, SearchState>(builder: (_, state) {
        if (state is SearchSuccess) {
          final tag = Tag(
              id: 0, title: S.current.randomProducts, products: state.products);
          return TagWidget(
            tag,
            onAllPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => SearchPage(params))),
          );
        }
        return const AppProgressIndicator();
      }),
    );
  }
}
