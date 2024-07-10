import 'env.dart';

Future<void> main() async => Production().init();

class Production extends Env {
  final EnvType envType = EnvType.production;
  final String baseUrl = 'http://yakynyol.com.tm/';
  final bool writeLogs = false;
}
