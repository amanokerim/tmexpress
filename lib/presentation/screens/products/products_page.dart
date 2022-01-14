import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection/injection.dart';
import '../../../../domain/entities/product_mini.dart';
import 'bloc/products_bloc.dart';
import 'products_screen.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({required this.type, required this.id, Key? key})
      : super(key: key);
  final ProductsScreenType type;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => getIt(),
      child: ProductsScreen(id: id, type: type),
    );
  }
}
