import 'package:intl/intl.dart';

extension StringX on String {
  String get stripTags =>
      Bidi.stripHtmlIfNeeded(this).trim().replaceAll('&nbsp', '');

  int get toIntVersion {
    final versionCells = split('.').map(int.parse).toList();
    return versionCells[0] * 10000 + versionCells[1] * 100 + versionCells[2];
  }
}
