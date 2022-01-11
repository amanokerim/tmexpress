import 'env.dart';

Future<void> main() async => Development().init();

class Development extends Env {
  final EnvType envType = EnvType.development;
  final String baseUrl = 'http://ecommerce.sanlyachar-clients.website/';
  final bool showAlice = true;
  final bool writeLogs = true;
  final String siteUrl = 'https://appcraft.pro/?utm_source=clientapp';
}
