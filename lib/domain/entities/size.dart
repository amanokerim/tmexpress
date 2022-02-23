import 'package:equatable/equatable.dart';

class Size extends Equatable {
  const Size({
    required this.id,
    required this.title,
    this.selected = false,
  });
  final int id;
  final String title;
  final bool selected;

  @override
  List<Object> get props => [id];

  Size toggleSelected() => Size(id: id, title: title, selected: !selected);

  Size makeSelected() => Size(id: id, title: title, selected: true);
}
