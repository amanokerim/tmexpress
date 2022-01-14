import 'package:equatable/equatable.dart';
import 'subcategory.dart';

class Group extends Equatable {
  const Group({
    required this.id,
    required this.title,
    required this.subCategories,
  });
  final int id;
  final String title;
  final List<Subcategory> subCategories;

  @override
  List<Object?> get props => [id];
}
