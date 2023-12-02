import 'env.dart';

Future<void> main() async => Development().init();

class Development extends Env {
  final EnvType envType = EnvType.development;
  final String baseUrl = 'http://216.250.9.132';
  final bool showAlice = true;
  final bool writeLogs = true;
}
