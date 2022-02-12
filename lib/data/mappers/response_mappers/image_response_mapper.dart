import 'package:injectable/injectable.dart';

import '../../../app/env/env.dart';
import '../../../domain/entities/image.dart';
import '../../network/response_models/image_response.dart';
import '../mapper.dart';

@lazySingleton
class ImageResponseMapper extends Mapper<ImageResponse, Image> {
  @override
  Image map(ImageResponse? entity) => Image(
        id: entity?.id ?? 0,
        url: '${Env.value.baseUrl}${entity?.url}',
        urlMini: '${Env.value.baseUrl}${entity?.urlMini}',
        width: double.tryParse(entity?.imageWidth ?? '') ?? 0,
        height: double.tryParse(entity?.imageHeight ?? '') ?? 0,
      );
}
