import 'package:injectable/injectable.dart';

import '../../../domain/entities/profile.dart';
import '../../network/response_models/profile_response.dart';
import '../mapper.dart';

@lazySingleton
class ProfileResponseMapper extends Mapper<ProfileResponse, Profile> {
  @override
  Profile map(ProfileResponse? entity) => Profile(
        // TODO Make phone dynamic, change gender and region implementation
        phone: '+993 64 921507',
        name: entity?.name,
        address: entity?.address,
        gender: entity?.gender,
        region: entity?.region,
      );
}
