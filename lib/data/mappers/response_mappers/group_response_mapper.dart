import 'package:injectable/injectable.dart';

import '../../../domain/entities/category/group.dart';
import '../../network/response_models/group_response.dart';
import '../mapper.dart';
import 'subcategory_response_mapper.dart';

@lazySingleton
class GroupResponseMapper extends Mapper<GroupResponse, Group> {
  GroupResponseMapper(this._subcategoryResponseMapper);
  final SubcategoryResponseMapper _subcategoryResponseMapper;

  @override
  Group map(GroupResponse? entity) => Group(
        id: entity?.id ?? 0,
        title: entity?.title ?? '',
        subCategories:
            _subcategoryResponseMapper.mapList(entity?.subCategories),
      );
}
