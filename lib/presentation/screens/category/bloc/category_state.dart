part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoadInProgress extends CategoryState {}

class CategoryLoadSuccess extends CategoryState {
  const CategoryLoadSuccess(this.categories, this.selected);
  final List<Category> categories;
  final Category selected;

  @override
  List<Object> get props => [categories, selected];
}

class CategoryLoadError extends CategoryState {
  const CategoryLoadError(this.message, this.key);
  final String message;
  final Key key;

  @override
  List<Object> get props => [key];
}
