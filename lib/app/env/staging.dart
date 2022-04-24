import 'env.dart';

Future<void> main() async => Staging().init();

class Staging extends Env {
  final EnvType envType = EnvType.staging;
  final String baseUrl = 'http://ecommerce.sanlyachar-clients.website/';
  final bool showAlice = false;
  final bool writeLogs = false;
}
