import 'package:injectable/injectable.dart';

import '../../../app/env/env.dart';
import '../../../domain/entities/product/subcategory.dart';
import '../../../main.dart';
import '../../network/response_models/subcategory_response.dart';
import '../mapper.dart';

@lazySingleton
class SubcategoryResponseMapper
    extends Mapper<SubcategoryResponse, Subcategory> {
  @override
  Subcategory map(SubcategoryResponse? entity) => Subcategory(
        id: entity?.id ?? 0,
        title: (entity?.title ?? '').isNotEmpty
            ? ((isRu ? entity?.titleRu : null) ?? entity!.title)!
                .split('>')
                .last
                .trim()
            : '',
        subCategoryImage: '${Env.value.baseUrl}${entity?.subCategoryImage}',
      );
}
