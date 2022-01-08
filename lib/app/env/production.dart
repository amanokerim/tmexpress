import 'env.dart';

Future<void> main() async => Production().init();

class Production extends Env {
  final EnvType envType = EnvType.production;
  // TODO Specify base url for prod
  final String baseUrl = '';
  final bool showAlice = false;
  final bool writeLogs = false;
  final String siteUrl = 'https://appcraft.pro/?utm_source=clientapp';
}
