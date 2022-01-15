import 'package:flutter/material.dart';

import '../../domain/entities/product_mini.dart';
import '../screens/detail/detail_page.dart';
import '../theme/app_theme.dart';
import 'app_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product, {Key? key}) : super(key: key);
  final ProductMini product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .7,
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (_) => DetailPage(product))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(product.imageMini, height: 100, width: 100),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: AppTextStyle.bold14,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              '${product.normalPrice.toStringAsFixed(0)} m.'
              '  ⭐️ ${product.ourRating}',
              style: AppTextStyle.grey14,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
