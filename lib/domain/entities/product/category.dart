import 'group.dart';
import 'sub_tag.dart';

class Category extends SubTag {
  const Category({
    required this.id,
    required this.title,
    required this.categoryImage,
    required this.groups,
  }) : super(id, title);

  final int id;
  final String title;
  final String categoryImage;
  final List<Group> groups;

  @override
  List<Object?> get props => [id];
}
