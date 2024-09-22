import 'sub_tag.dart';
import 'subcategory.dart';

class Group extends SubTag {
  const Group({
    required this.id,
    required this.title,
    required this.subCategories,
  }) : super(id, title);
  final int id;
  final String title;
  final List<Subcategory> subCategories;

  @override
  List<Object?> get props => [id];
}
