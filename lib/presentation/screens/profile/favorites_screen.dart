import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../app/generated/l10n.dart';
import '../../../domain/entities/saved_product.dart';
import '../../utils/constants.dart';
import '../../widgets/app_cart_button.dart';
import '../../widgets/app_empty.dart';
import '../../widgets/primary_app_bar.dart';
import 'widgets/saved_product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        label: S.current.favorites,
        action: const Padding(
          padding: EdgeInsets.only(right: 15),
          child: AppCartButton(size: 28),
        ),
      ),
      body: ValueListenableBuilder<Box<Map<dynamic, dynamic>>>(
        valueListenable:
            Hive.box<Map<dynamic, dynamic>>(kFavoritesBox).listenable(),
        builder: (_, box, __) {
          final products = box.values.map(SavedProduct.fromJson).toList();
          if (products.isEmpty) return AppEmpty(message: S.current.noFavorites);
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (_, index) => SavedProductCard(products[index]),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
          );
        },
      ),
    );
  }
}
