import 'sub_tag.dart';

class Subcategory extends SubTag {
  const Subcategory({
    required this.id,
    required this.title,
    required this.subCategoryImage,
  }) : super(id, title);

  final int id;
  final String title;
  final String subCategoryImage;
}
