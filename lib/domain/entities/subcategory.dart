import 'package:equatable/equatable.dart';

class Subcategory extends Equatable {
  const Subcategory({
    required this.id,
    required this.title,
    required this.subCategoryImage,
  });

  final int id;
  final String title;
  final String subCategoryImage;

  @override
  List<Object?> get props => [id];
}
