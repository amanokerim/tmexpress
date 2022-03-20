import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../domain/entities/saved_product.dart';
import '../../../utils/constants.dart';
import '../../../widgets/app_image.dart';
import '../../../widgets/card_wrapper.dart';
import '../../detail/detail_page.dart';

class SavedProductCard extends StatelessWidget {
  const SavedProductCard(this.product, {Key? key}) : super(key: key);
  final SavedProduct product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => DetailPage(product.id))),
      child: CardWrapper(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              AppImage(product.image, height: 50, width: 50),
              const SizedBox(width: 16),
              Expanded(
                child: Text(product.title,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
              ),
              IconButton(
                  onPressed: () =>
                      Hive.box<Map<dynamic, dynamic>>(kFavoritesBox)
                          .delete(product.id),
                  icon: const Icon(Icons.close, size: 16),
                  visualDensity: VisualDensity.compact,
                  splashColor: Colors.transparent),
            ],
          )),
    );
  }
}
