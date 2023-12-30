import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection/injection.dart';
import '../../../../domain/usecases/products/search_product_usecase.dart';
import 'bloc/search_bloc.dart';
import 'search_screen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage(this.params, {Key? key}) : super(key: key);
  final SearchParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => getIt(),
      child: SearchScreen(params),
    );
  }
}
