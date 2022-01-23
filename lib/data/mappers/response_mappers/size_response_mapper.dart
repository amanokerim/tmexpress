import 'package:injectable/injectable.dart';

import '../../../domain/entities/size.dart';
import '../../network/response_models/size_response.dart';
import '../mapper.dart';

@lazySingleton
class SizeResponseMapper extends Mapper<SizeResponse, Size> {
  @override
  Size map(SizeResponse? entity) =>
      Size(id: entity?.id ?? 0, title: entity?.title ?? '');
}
