import 'package:equatable/equatable.dart';

/// Parent of Tag and Subcategory
abstract class SubTag extends Equatable {
  const SubTag(this.id, this.title);
  final int id;
  final String title;

  @override
  List<Object?> get props => [id, title];
}
