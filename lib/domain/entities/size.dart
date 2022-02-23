import 'package:equatable/equatable.dart';

class Size extends Equatable {
  const Size({
    required this.id,
    required this.title,
    this.selected = true,
  });
  final int id;
  final String title;
  final bool selected;

  @override
  List<Object> get props => [id, selected];
}
