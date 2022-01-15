import 'package:equatable/equatable.dart';

abstract class ProductParent extends Equatable {
  const ProductParent(this.id, this.title);
  final int id;
  final String title;

  @override
  List<Object?> get props => [id, title];
}
