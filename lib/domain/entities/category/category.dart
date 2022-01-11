import 'package:equatable/equatable.dart';

import 'group.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.title,
    required this.categoryImage,
    required this.groups,
  });

  final int id;
  final String title;
  final String categoryImage;
  final List<Group> groups;

  @override
  List<Object?> get props => [id];
}
