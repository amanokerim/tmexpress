// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Русский`
  String get lang {
    return Intl.message(
      'Русский',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Tab 0`
  String get tab0 {
    return Intl.message(
      'Tab 0',
      name: 'tab0',
      desc: '',
      args: [],
    );
  }

  /// `Tab 1`
  String get tab1 {
    return Intl.message(
      'Tab 1',
      name: 'tab1',
      desc: '',
      args: [],
    );
  }

  /// `Tab 2`
  String get tab2 {
    return Intl.message(
      'Tab 2',
      name: 'tab2',
      desc: '',
      args: [],
    );
  }

  /// `Tab 3`
  String get tab3 {
    return Intl.message(
      'Tab 3',
      name: 'tab3',
      desc: '',
      args: [],
    );
  }

  /// `media/user_agreement.pdf`
  String get userAgreementLink {
    return Intl.message(
      'media/user_agreement.pdf',
      name: 'userAgreementLink',
      desc: '',
      args: [],
    );
  }

  /// `media/privacy_policy.pdf`
  String get privacyPolicyLink {
    return Intl.message(
      'media/privacy_policy.pdf',
      name: 'privacyPolicyLink',
      desc: '',
      args: [],
    );
  }

  /// `Попробуйте еще раз`
  String get retry {
    return Intl.message(
      'Попробуйте еще раз',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Нажмите еще раз для выхода`
  String get doubleBackToExit {
    return Intl.message(
      'Нажмите еще раз для выхода',
      name: 'doubleBackToExit',
      desc: '',
      args: [],
    );
  }

  /// `Что-то пошло не так`
  String get somethingWentWrong {
    return Intl.message(
      'Что-то пошло не так',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Внутренняя ошибка сервера`
  String get serverError {
    return Intl.message(
      'Внутренняя ошибка сервера',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Нет интернета`
  String get loadError {
    return Intl.message(
      'Нет интернета',
      name: 'loadError',
      desc: '',
      args: [],
    );
  }

  /// `У вас не достаточно прав для выполнения данного действия`
  String get forbidden {
    return Intl.message(
      'У вас не достаточно прав для выполнения данного действия',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось подключиться к серверу`
  String get connectionError {
    return Intl.message(
      'Не удалось подключиться к серверу',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Неверный формат`
  String get invalidFormat {
    return Intl.message(
      'Неверный формат',
      name: 'invalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `Операция временно недоступна.\nПопробуйте позднее.`
  String get unknownError {
    return Intl.message(
      'Операция временно недоступна.\nПопробуйте позднее.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Неверный формат`
  String get wrongFormat {
    return Intl.message(
      'Неверный формат',
      name: 'wrongFormat',
      desc: '',
      args: [],
    );
  }

  /// `Неверный код`
  String get invalidVerificationCode {
    return Intl.message(
      'Неверный код',
      name: 'invalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Обязательное поле`
  String get requiredField {
    return Intl.message(
      'Обязательное поле',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Некорректный email`
  String get wrongEmail {
    return Intl.message(
      'Некорректный email',
      name: 'wrongEmail',
      desc: '',
      args: [],
    );
  }

  /// `Сегодня`
  String get today {
    return Intl.message(
      'Сегодня',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Вчера`
  String get yesterday {
    return Intl.message(
      'Вчера',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `в`
  String get in_ {
    return Intl.message(
      'в',
      name: 'in_',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
