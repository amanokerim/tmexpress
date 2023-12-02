import 'package:injectable/injectable.dart';

import '../../../app/env/env.dart';
import '../../../domain/entities/product/subcategory.dart';
import '../../network/response_models/subcategory_response.dart';
import '../mapper.dart';

@lazySingleton
class SubcategoryResponseMapper
    extends Mapper<SubcategoryResponse, Subcategory> {
  @override
  Subcategory map(SubcategoryResponse? entity) => Subcategory(
        id: entity?.id ?? 0,
        title: (entity?.title ?? '').isNotEmpty
            ? entity!.title!.split(' > ').last
            : '',
        subCategoryImage: '${Env.value.baseUrl}${entity?.subCategoryImage}',
      );
}
