import 'package:flutter/material.dart';

import '../../../../app/generated/l10n.dart';
import '../../../theme/app_theme.dart';
import '../bloc/detail_bloc.dart';
import 'color_card.dart';

class ProductImages extends StatelessWidget {
  const ProductImages(this.state, {Key? key}) : super(key: key);
  final DetailLoadSuccess state;

  List<Widget> widgets() {
    final productImages = state.product.productImages;
    return [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 2),
        child: Text(S.current.productColors, style: AppTextStyle.bold16),
      ),
      SizedBox(
        height: 64 + 12,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20 - 6),
          physics: const BouncingScrollPhysics(),
          itemCount: productImages.length,
          itemBuilder: (context, index) => ColorCard(
            productImages[index],
            isSelected: state.selectedColor == productImages[index],
          ),
          scrollDirection: Axis.horizontal,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
