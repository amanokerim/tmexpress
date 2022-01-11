part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoadInProgress extends CategoryState {}

class CategoryLoadSuccess extends CategoryState {
  const CategoryLoadSuccess(this.categories, this.selectedId);
  final List<Category> categories;
  final int selectedId;

  @override
  List<Object> get props => [categories, selectedId];
}

class CategoryLoadError extends CategoryState {
  const CategoryLoadError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
