import 'package:flutter/material.dart';

import '../../domain/entities/product/subcategory.dart';
import '../../domain/entities/product/tag.dart';
import '../screens/detail/detail_page.dart';
import '../screens/products/products_page.dart';
import 'constants.dart';

class NavigationHelper {
  const NavigationHelper._();

  // Navigate to one of Product, Tag, Subcategory
  static void navigateToPTS(
      BuildContext context, dynamic pageType, dynamic idd) {
    int? id;
    Widget? page;
    if (id is int) id = id;
    if (id is String) id = int.tryParse(idd);

    if (id != null) {
      switch (pageType) {
        case kProductPage:
          page = DetailPage(id);
          break;
        case kTagPage:
          final tag = Tag(id: id, title: '', product: const []);
          page = ProductsPage(productParent: tag);
          break;
        case kSubcategoryPage:
          final sub = Subcategory(id: id, title: '', subCategoryImage: '');
          page = ProductsPage(productParent: sub);
          break;
      }
      if (page != null) {
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => page!),
        );
      }
    }
  }
}
