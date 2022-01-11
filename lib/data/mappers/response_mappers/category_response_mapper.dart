import 'package:injectable/injectable.dart';

import '../../../app/env/env.dart';
import '../../../domain/entities/category/category.dart';
import '../../network/response_models/category_response.dart';
import '../mapper.dart';
import 'group_response_mapper.dart';

@lazySingleton
class CategoryResponseMapper extends Mapper<CategoryResponse, Category> {
  CategoryResponseMapper(this._groupResponseMapper);
  final GroupResponseMapper _groupResponseMapper;

  @override
  Category map(CategoryResponse? entity) => Category(
        id: entity?.id ?? 0,
        title: entity?.title ?? '',
        categoryImage: '${Env.value.baseUrl}${entity?.categoryImage}',
        groups: _groupResponseMapper.mapList(entity?.groups),
      );
}
