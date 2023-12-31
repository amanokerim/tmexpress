import 'package:injectable/injectable.dart';

import '../../../domain/entities/product/tag.dart';
import '../../network/response_models/tag_response.dart';
import '../mapper.dart';
import 'product_mini_response_mapper.dart';

@lazySingleton
class TagResponseMapper extends Mapper<TagResponse, Tag> {
  TagResponseMapper(this._productMiniResponseMapper);
  final ProductMiniResponseMapper _productMiniResponseMapper;

  @override
  Tag map(TagResponse? entity) => Tag(
        id: entity?.id ?? 0,
        title: entity?.title ?? '',
        products: _productMiniResponseMapper.mapList(entity?.product),
      );
}
