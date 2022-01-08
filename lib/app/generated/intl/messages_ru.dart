// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "connectionError": MessageLookupByLibrary.simpleMessage(
            "Не удалось подключиться к серверу"),
        "doubleBackToExit":
            MessageLookupByLibrary.simpleMessage("Нажмите еще раз для выхода"),
        "forbidden": MessageLookupByLibrary.simpleMessage(
            "У вас не достаточно прав для выполнения данного действия"),
        "in_": MessageLookupByLibrary.simpleMessage("в"),
        "invalidFormat":
            MessageLookupByLibrary.simpleMessage("Неверный формат"),
        "invalidVerificationCode":
            MessageLookupByLibrary.simpleMessage("Неверный код"),
        "lang": MessageLookupByLibrary.simpleMessage("Русский"),
        "loadError": MessageLookupByLibrary.simpleMessage("Нет интернета"),
        "privacyPolicyLink":
            MessageLookupByLibrary.simpleMessage("media/privacy_policy.pdf"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("Обязательное поле"),
        "retry": MessageLookupByLibrary.simpleMessage("Попробуйте еще раз"),
        "serverError":
            MessageLookupByLibrary.simpleMessage("Внутренняя ошибка сервера"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
        "tab0": MessageLookupByLibrary.simpleMessage("Tab 0"),
        "tab1": MessageLookupByLibrary.simpleMessage("Tab 1"),
        "tab2": MessageLookupByLibrary.simpleMessage("Tab 2"),
        "tab3": MessageLookupByLibrary.simpleMessage("Tab 3"),
        "today": MessageLookupByLibrary.simpleMessage("Сегодня"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Операция временно недоступна.\nПопробуйте позднее."),
        "userAgreementLink":
            MessageLookupByLibrary.simpleMessage("media/user_agreement.pdf"),
        "wrongEmail":
            MessageLookupByLibrary.simpleMessage("Некорректный email"),
        "wrongFormat": MessageLookupByLibrary.simpleMessage("Неверный формат"),
        "yesterday": MessageLookupByLibrary.simpleMessage("Вчера")
      };
}
