// ignore_for_file: lines_longer_than_80_chars

import 'package:intl/intl.dart';
import '/app/generated/l10n.dart';

extension DateExtension on DateTime {
  String get dMMMMYHm =>
      '${DateFormat.MMMMd().format(this)} ${DateFormat.y().format(this)}, ${DateFormat.Hm().format(this)}';

  String get dMMMMY {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (isSameDay(today)) return S.current.today;
    if (isSameDay(yesterday)) return S.current.yesterday;

    return '${dual(day)}.${dual(month)}.$year';
  }

  String dual(int n) => n.toString().padLeft(2, '0');

  String get dmYHm {
    return '$dMMMMY, ${DateFormat.Hm().format(this)}';
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
