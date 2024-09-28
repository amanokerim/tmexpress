import 'package:injectable/injectable.dart';

import '../../../domain/entities/token.dart';
import '../../network/response_models/token_response.dart';
import '../mapper.dart';

@lazySingleton
class TokenResponseMapper extends Mapper<TokenResponse, Token> {
  @override
  Token map(TokenResponse? entity) => Token(
        refresh: entity?.refresh ?? '',
        access: entity?.accessToken ?? '',
      );
}
