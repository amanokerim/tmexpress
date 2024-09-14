import 'package:intl/intl.dart';

import '../../app/env/env.dart';

extension StringX on String {
  String get stripTags =>
      Bidi.stripHtmlIfNeeded(this).trim().replaceAll('&nbsp', '');

  int get toIntVersion {
    final versionCells = split('.').map(int.parse).toList();
    return versionCells[0] * 10000 + versionCells[1] * 100 + versionCells[2];
  }
}

String imageFromJson(String? s) {
  if ((s ?? '').isEmpty) return '';
  if (s!.startsWith(Env.value.baseUrl)) return s;
  final media = s.startsWith('/media') ? '' : 'media/';
  return '${Env.value.baseUrl}$media$s';
}
