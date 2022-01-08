import 'env.dart';

Future<void> main() async => Staging().init();

class Staging extends Env {
  final EnvType envType = EnvType.staging;
  // TODO Specify base url for stage
  final String baseUrl = '';
  final bool showAlice = false;
  final bool writeLogs = false;
  final String siteUrl = 'https://appcraft.pro/?utm_source=clientapp';
}
