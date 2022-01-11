part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoriesReuqested extends CategoryEvent {}

class CategorySelected extends CategoryEvent {
  const CategorySelected(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
