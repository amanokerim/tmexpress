import 'package:injectable/injectable.dart';

import '../../../domain/entities/profile.dart';
import '../../network/response_models/profile_response.dart';
import '../mapper.dart';

@lazySingleton
class ProfileResponseMapper extends Mapper<ProfileResponse, Profile> {
  @override
  Profile map(ProfileResponse? entity) => Profile(
        phone: entity?.username ?? '',
        name: entity?.name,
        address: entity?.address,
        gender: entity?.gender != null
            ? entity!.gender!
                ? Gender.woman
                : Gender.man
            : null,
        region: entity?.region,
      );
}
