import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection/injection.dart';
import '../../../domain/entities/product_parent.dart';
import 'bloc/products_bloc.dart';
import 'products_screen.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({required this.productParent, Key? key}) : super(key: key);
  final ProductParent productParent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => getIt(),
      child: ProductsScreen(productParent: productParent),
    );
  }
}
