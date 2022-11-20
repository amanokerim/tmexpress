import 'env.dart';

Future<void> main() async => Development().init();

class Development extends Env {
  final EnvType envType = EnvType.development;
  final String baseUrl = 'https://zehinz.ru/';
  final bool showAlice = true;
  final bool writeLogs = true;
}
