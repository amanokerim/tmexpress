import 'package:injectable/injectable.dart';

import '../../../domain/entities/product_mini.dart';
import '../../../domain/entities/tag.dart';
import '../../network/response_models/tag_response.dart';
import '../mapper.dart';

@lazySingleton
class TagResponseMapper extends Mapper<TagResponse, Tag> {
  @override
  Tag map(TagResponse? entity) => Tag(
        id: entity?.id ?? 0,
        title: entity?.title ?? '',
        // TODO Change implementation
        product: (entity?.product ?? [])
            .map((e) => ProductMini(
                id: e,
                title: 'Lorem ipsum dolor sit amet, consectetur adipiscing $e',
                ourRating: 4.3,
                discount: 0,
                normalPrice: 12.0 * e,
                imageMini:
                    'http://ecommerce.sanlyachar-clients.website/products/photo-1543163521-1bf539c55dd2_2Nc8Pr8.jpeg'))
            .toList(),
      );
}
