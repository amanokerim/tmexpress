import 'package:equatable/equatable.dart';

class Size extends Equatable {
  const Size({
    required this.id,
    required this.title,
  });
  final int id;
  final String title;

  @override
  List<Object?> get props => [id];
}
