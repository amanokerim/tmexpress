import '../../app/generated/l10n.dart';

class AppValidator {
  static String? code(String? text) {
    if (text == null || text.trim().isEmpty) return S.current.requiredField;
    final ageInt = int.tryParse(text);
    if (ageInt == null) return S.current.wrongFormat;
    if (text.length != 4) return S.current.wrongFormat;
    return null;
  }

  static String? email(String? text) {
    if (text == null || text.isEmpty) return S.current.requiredField;
    final regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regExp.hasMatch(text)) return S.current.wrongEmail;
    return null;
  }

  static String? notEmpty(String? text) {
    if (text == null || text.isEmpty) return S.current.requiredField;
    return null;
  }
}
