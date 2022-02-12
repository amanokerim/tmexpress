import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../theme/app_theme.dart';
import '../bloc/detail_bloc.dart';
import 'size_card.dart';

class ProductSizes extends StatelessWidget {
  const ProductSizes(this.state, {Key? key}) : super(key: key);
  final DetailLoadSuccess state;

  List<Widget> widgets() {
    final sizes = state.product.size;
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 24 - 6, 20, 10 - 6),
        child: Text(S.current.productSizes, style: AppTextStyle.bold16),
      ),
      SizedBox(
        height: 48,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          physics: const BouncingScrollPhysics(),
          itemCount: sizes.length,
          itemBuilder: (_, index) => SizeCard(
            sizes[index],
            selected: sizes[index] == state.selectedSize,
          ),
          scrollDirection: Axis.horizontal,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
