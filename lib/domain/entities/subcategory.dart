import 'product_parent.dart';

class Subcategory extends ProductParent {
  const Subcategory({
    required this.id,
    required this.title,
    required this.subCategoryImage,
  }) : super(id, title);

  final int id;
  final String title;
  final String subCategoryImage;
}
