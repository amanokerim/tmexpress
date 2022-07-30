import 'env.dart';

Future<void> main() async => Staging().init();

class Staging extends Env {
  final EnvType envType = EnvType.staging;
  final String baseUrl = 'https://zehinz.ru/';
  final bool showAlice = false;
  final bool writeLogs = false;
}
