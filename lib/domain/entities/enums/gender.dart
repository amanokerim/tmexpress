import '../../../app/generated/l10n.dart';

enum Gender { woman, man }

extension GenderX on Gender {
  String get str {
    switch (this) {
      case Gender.man:
        return S.current.man;
      case Gender.woman:
        return S.current.woman;
    }
  }
}
