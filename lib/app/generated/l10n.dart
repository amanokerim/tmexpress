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

  /// `Baş sahypa`
  String get homeScreen {
    return Intl.message(
      'Baş sahypa',
      name: 'homeScreen',
      desc: '',
      args: [],
    );
  }

  /// `Bölümler`
  String get categories {
    return Intl.message(
      'Bölümler',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Gyzgyn harytlar`
  String get hot {
    return Intl.message(
      'Gyzgyn harytlar',
      name: 'hot',
      desc: '',
      args: [],
    );
  }

  /// `Sebet`
  String get cart {
    return Intl.message(
      'Sebet',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Profil`
  String get profile {
    return Intl.message(
      'Profil',
      name: 'profile',
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

  /// `Täzeden synanyşyň`
  String get retry {
    return Intl.message(
      'Täzeden synanyşyň',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Çykmak üçin ýene bir gezek basyň`
  String get doubleBackToExit {
    return Intl.message(
      'Çykmak üçin ýene bir gezek basyň',
      name: 'doubleBackToExit',
      desc: '',
      args: [],
    );
  }

  /// `Näsazlyk ýüze çykdy`
  String get somethingWentWrong {
    return Intl.message(
      'Näsazlyk ýüze çykdy',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Biz tarapda näsazylyk ýüze çykdy.\nBiz düzetmegiň ugrunda işleýäris.`
  String get serverError {
    return Intl.message(
      'Biz tarapda näsazylyk ýüze çykdy.\nBiz düzetmegiň ugrunda işleýäris.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Internet ýok`
  String get loadError {
    return Intl.message(
      'Internet ýok',
      name: 'loadError',
      desc: '',
      args: [],
    );
  }

  /// `Bu amaly ýerine ýetirmek üçin sizde ýeterlik hukuk ýok`
  String get forbidden {
    return Intl.message(
      'Bu amaly ýerine ýetirmek üçin sizde ýeterlik hukuk ýok',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Serwere baglanyp bolmady`
  String get connectionError {
    return Intl.message(
      'Serwere baglanyp bolmady',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Nädogry format`
  String get invalidFormat {
    return Intl.message(
      'Nädogry format',
      name: 'invalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `Amal wagtlaýyn elýeter däl.\nBiraz wagtdan synanyşyp görüň.`
  String get unknownError {
    return Intl.message(
      'Amal wagtlaýyn elýeter däl.\nBiraz wagtdan synanyşyp görüň.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Nädogry format`
  String get wrongFormat {
    return Intl.message(
      'Nädogry format',
      name: 'wrongFormat',
      desc: '',
      args: [],
    );
  }

  /// `Nädogry kod`
  String get invalidVerificationCode {
    return Intl.message(
      'Nädogry kod',
      name: 'invalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Boş bolmaly däl`
  String get requiredField {
    return Intl.message(
      'Boş bolmaly däl',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Nädogry email`
  String get wrongEmail {
    return Intl.message(
      'Nädogry email',
      name: 'wrongEmail',
      desc: '',
      args: [],
    );
  }

  /// `SMS programmany açmakda näsazlyk ýüze çykdy. SMS programma geçip, bellenen nomere bellenen kody ugratmagyňyzy haýyş edýäris.`
  String get cantNavigateToSMSApp {
    return Intl.message(
      'SMS programmany açmakda näsazlyk ýüze çykdy. SMS programma geçip, bellenen nomere bellenen kody ugratmagyňyzy haýyş edýäris.',
      name: 'cantNavigateToSMSApp',
      desc: '',
      args: [],
    );
  }

  /// `Bu gün`
  String get today {
    return Intl.message(
      'Bu gün',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Düýn`
  String get yesterday {
    return Intl.message(
      'Düýn',
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

  /// `Togtatmak`
  String get cancel {
    return Intl.message(
      'Togtatmak',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Ählisi`
  String get all {
    return Intl.message(
      'Ählisi',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Bu ýerde häzirlikçe haryt ýok (`
  String get noProducts {
    return Intl.message(
      'Bu ýerde häzirlikçe haryt ýok (',
      name: 'noProducts',
      desc: '',
      args: [],
    );
  }

  /// `Reňkler`
  String get productColors {
    return Intl.message(
      'Reňkler',
      name: 'productColors',
      desc: '',
      args: [],
    );
  }

  /// `Ölçegler`
  String get productSizes {
    return Intl.message(
      'Ölçegler',
      name: 'productSizes',
      desc: '',
      args: [],
    );
  }

  /// `Bahasy`
  String get productPrice {
    return Intl.message(
      'Bahasy',
      name: 'productPrice',
      desc: '',
      args: [],
    );
  }

  /// `Adaty (45 gün)`
  String get productPriceNormal {
    return Intl.message(
      'Adaty (45 gün)',
      name: 'productPriceNormal',
      desc: '',
      args: [],
    );
  }

  /// `Express (15 gün)`
  String get productPriceExpress {
    return Intl.message(
      'Express (15 gün)',
      name: 'productPriceExpress',
      desc: '',
      args: [],
    );
  }

  /// `Lomaý baha`
  String get productPriceWholesale {
    return Intl.message(
      'Lomaý baha',
      name: 'productPriceWholesale',
      desc: '',
      args: [],
    );
  }

  /// `{count}+ alynanda`
  String productWholesaleDesc(Object count) {
    return Intl.message(
      '$count+ alynanda',
      name: 'productWholesaleDesc',
      desc: '',
      args: [count],
    );
  }

  /// `Agramy`
  String get productWeight {
    return Intl.message(
      'Agramy',
      name: 'productWeight',
      desc: '',
      args: [],
    );
  }

  /// `Sebede goşmak`
  String get addToCart {
    return Intl.message(
      'Sebede goşmak',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Ölçeg`
  String get size {
    return Intl.message(
      'Ölçeg',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Hasaba girmek`
  String get login {
    return Intl.message(
      'Hasaba girmek',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Telefon`
  String get phone {
    return Intl.message(
      'Telefon',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `SMS ugratmak`
  String get sendSms {
    return Intl.message(
      'SMS ugratmak',
      name: 'sendSms',
      desc: '',
      args: [],
    );
  }

  /// `Hasaba girmek üçin, \n{phone} belgä {code} kody SMS arkaly ugradyň we programma dolanyň.`
  String sendSmsExpalanation(Object phone, Object code) {
    return Intl.message(
      'Hasaba girmek üçin, \n$phone belgä $code kody SMS arkaly ugradyň we programma dolanyň.',
      name: 'sendSmsExpalanation',
      desc: '',
      args: [phone, code],
    );
  }

  /// `Siziň telefon belgiňiz tassyklanýar. 1-2 minut garaşmagyňyzy haýyş edýäris)`
  String get waitingVerificationText {
    return Intl.message(
      'Siziň telefon belgiňiz tassyklanýar. 1-2 minut garaşmagyňyzy haýyş edýäris)',
      name: 'waitingVerificationText',
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
