part of 'category_bloc.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {}

class CategoryLoadInProgress extends CategoryState {}

class CategoryLoadSuccess extends CategoryState {
  CategoryLoadSuccess(
    this.categories,
    this.selected,
  ) {
    shops = [];
    final index = categories.indexWhere((e) => e.id == 26);
    print('index $index');
    if (index != -1) {
      final shopCategory = categories[index];
      for (var i = 0; i < shopCategory.groups.length; i++) {
        shops.addAll(shopCategory.groups[i].subCategories);
      }
      print(shops);
    }
  }
  final List<Category> categories;
  late List<Subcategory> shops;
  final Category selected;
}

class CategoryLoadError extends CategoryState {
  const CategoryLoadError(this.message);
  final String message;
}
