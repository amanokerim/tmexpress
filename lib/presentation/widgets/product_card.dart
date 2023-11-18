import 'package:flutter/material.dart';

import '../../domain/entities/product/product_mini.dart';
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
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => DetailPage(product.id))),
        child: Column(
          children: [
            Stack(
              children: [
                AppImage(
                  product.imageMini,
                  height: 100,
                  width: 100,
                ),
                if (product.discount > 0)
                  Positioned(
                    top: 5,
                    right: -20,
                    child: Transform.rotate(
                      angle: 3.14 / 4,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 1),
                          color: Colors.red,
                          child: Text(
                            '-${product.discount}%',
                            style: AppTextStyle.white10w700,
                          )),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: AppTextStyle.bold14,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${product.normalPrice.toStringAsFixed(0)} m.',
                  style: AppTextStyle.bold14,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Image.asset('assets/icons/favorite.png',
                      width: 18, color: Colors.amber),
                ),
                Text('${product.ourRating}', style: AppTextStyle.dark14),
              ],
            )
          ],
        ),
      ),
    );
  }
}
