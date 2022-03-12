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

  /// `Reňk saýlaň`
  String get selectColor {
    return Intl.message(
      'Reňk saýlaň',
      name: 'selectColor',
      desc: '',
      args: [],
    );
  }

  /// `Ölçeg saýlaň`
  String get selectSize {
    return Intl.message(
      'Ölçeg saýlaň',
      name: 'selectSize',
      desc: '',
      args: [],
    );
  }

  /// `Sebede goşuldy`
  String get addedToCart {
    return Intl.message(
      'Sebede goşuldy',
      name: 'addedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Halanlaryma goşmak`
  String get addToFavorites {
    return Intl.message(
      'Halanlaryma goşmak',
      name: 'addToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Halanlarymdan aýyrmak`
  String get removeFromFavorites {
    return Intl.message(
      'Halanlarymdan aýyrmak',
      name: 'removeFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Halanlaryňyza goşmakda näsazlyk ýüze çykdy`
  String get addToFavoritesError {
    return Intl.message(
      'Halanlaryňyza goşmakda näsazlyk ýüze çykdy',
      name: 'addToFavoritesError',
      desc: '',
      args: [],
    );
  }

  /// `Halanlaryňyzdan aýyrmakda näsazlyk ýüze çykdy`
  String get removeFromFavoritesError {
    return Intl.message(
      'Halanlaryňyzdan aýyrmakda näsazlyk ýüze çykdy',
      name: 'removeFromFavoritesError',
      desc: '',
      args: [],
    );
  }

  /// `Paýlaşmak`
  String get share {
    return Intl.message(
      'Paýlaşmak',
      name: 'share',
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

  /// `Telefon belgiňiz`
  String get phone {
    return Intl.message(
      'Telefon belgiňiz',
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
  String sendSmsExplanation(Object phone, Object code) {
    return Intl.message(
      'Hasaba girmek üçin, \n$phone belgä $code kody SMS arkaly ugradyň we programma dolanyň.',
      name: 'sendSmsExplanation',
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

  /// `Telefon belgiňizi tassyklap bolmady. Ony dogry ýazandygyňyza we internede birigendigiňize göz ýetirip, täzeden synanyşyp göriň`
  String get canNotVerify {
    return Intl.message(
      'Telefon belgiňizi tassyklap bolmady. Ony dogry ýazandygyňyza we internede birigendigiňize göz ýetirip, täzeden synanyşyp göriň',
      name: 'canNotVerify',
      desc: '',
      args: [],
    );
  }

  /// `Adaty`
  String get normal {
    return Intl.message(
      'Adaty',
      name: 'normal',
      desc: '',
      args: [],
    );
  }

  /// `Express`
  String get express {
    return Intl.message(
      'Express',
      name: 'express',
      desc: '',
      args: [],
    );
  }

  /// `45 günde gowuşýar`
  String get normalSubtitle {
    return Intl.message(
      '45 günde gowuşýar',
      name: 'normalSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `15 günde gowuşýar`
  String get expressSubtitle {
    return Intl.message(
      '15 günde gowuşýar',
      name: 'expressSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Dowam etmek`
  String get continueButton {
    return Intl.message(
      'Dowam etmek',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Sargyt etmek`
  String get makeOrder {
    return Intl.message(
      'Sargyt etmek',
      name: 'makeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Jemi:\n`
  String get total {
    return Intl.message(
      'Jemi:\n',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `{total} man.`
  String nMan(Object total) {
    return Intl.message(
      '$total man.',
      name: 'nMan',
      desc: '',
      args: [total],
    );
  }

  /// `Sargydyňyz kabul edildi. Sargydyňyzy profildäki Sargytlarym bölüminden yzarlap bilersiňiz.\nSöwdanyň üçin sag boluň!`
  String get orderCreated {
    return Intl.message(
      'Sargydyňyz kabul edildi. Sargydyňyzy profildäki Sargytlarym bölüminden yzarlap bilersiňiz.\nSöwdanyň üçin sag boluň!',
      name: 'orderCreated',
      desc: '',
      args: [],
    );
  }

  /// `Bolýar`
  String get ok {
    return Intl.message(
      'Bolýar',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sebetde haryt ýok`
  String get cartEmpty {
    return Intl.message(
      'Sebetde haryt ýok',
      name: 'cartEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Tertip`
  String get sort {
    return Intl.message(
      'Tertip',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Filtr`
  String get filter {
    return Intl.message(
      'Filtr',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Täzeler başda`
  String get sortTime {
    return Intl.message(
      'Täzeler başda',
      name: 'sortTime',
      desc: '',
      args: [],
    );
  }

  /// `Arzanlar başda`
  String get sortPriceAsc {
    return Intl.message(
      'Arzanlar başda',
      name: 'sortPriceAsc',
      desc: '',
      args: [],
    );
  }

  /// `Gymmatlar başda`
  String get sortPriceDesc {
    return Intl.message(
      'Gymmatlar başda',
      name: 'sortPriceDesc',
      desc: '',
      args: [],
    );
  }

  /// `Biziň gowy baha berenlerimiz başda`
  String get sortOurRating {
    return Intl.message(
      'Biziň gowy baha berenlerimiz başda',
      name: 'sortOurRating',
      desc: '',
      args: [],
    );
  }

  /// `Gyzgynlar başda`
  String get sortHot {
    return Intl.message(
      'Gyzgynlar başda',
      name: 'sortHot',
      desc: '',
      args: [],
    );
  }

  /// `Ýeňiller başda`
  String get sortWeightAsc {
    return Intl.message(
      'Ýeňiller başda',
      name: 'sortWeightAsc',
      desc: '',
      args: [],
    );
  }

  /// `Agyrlar başda`
  String get sortWeightDesc {
    return Intl.message(
      'Agyrlar başda',
      name: 'sortWeightDesc',
      desc: '',
      args: [],
    );
  }

  /// `Kabul etmek`
  String get apply {
    return Intl.message(
      'Kabul etmek',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Arzanladyş`
  String get isDiscounted {
    return Intl.message(
      'Arzanladyş',
      name: 'isDiscounted',
      desc: '',
      args: [],
    );
  }

  /// `Ölçegler`
  String get sizes {
    return Intl.message(
      'Ölçegler',
      name: 'sizes',
      desc: '',
      args: [],
    );
  }

  /// `Ählisini saýla`
  String get selectAll {
    return Intl.message(
      'Ählisini saýla',
      name: 'selectAll',
      desc: '',
      args: [],
    );
  }

  /// `Erkek`
  String get man {
    return Intl.message(
      'Erkek',
      name: 'man',
      desc: '',
      args: [],
    );
  }

  /// `Zenan`
  String get woman {
    return Intl.message(
      'Zenan',
      name: 'woman',
      desc: '',
      args: [],
    );
  }

  /// `Aşgabat`
  String get ag {
    return Intl.message(
      'Aşgabat',
      name: 'ag',
      desc: '',
      args: [],
    );
  }

  /// `Ahal`
  String get ah {
    return Intl.message(
      'Ahal',
      name: 'ah',
      desc: '',
      args: [],
    );
  }

  /// `Balkan`
  String get bn {
    return Intl.message(
      'Balkan',
      name: 'bn',
      desc: '',
      args: [],
    );
  }

  /// `Daşoguz`
  String get dz {
    return Intl.message(
      'Daşoguz',
      name: 'dz',
      desc: '',
      args: [],
    );
  }

  /// `Lebap`
  String get lb {
    return Intl.message(
      'Lebap',
      name: 'lb',
      desc: '',
      args: [],
    );
  }

  /// `Mary`
  String get mr {
    return Intl.message(
      'Mary',
      name: 'mr',
      desc: '',
      args: [],
    );
  }

  /// `Üýtgetmek`
  String get edit {
    return Intl.message(
      'Üýtgetmek',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Doldurmak`
  String get fill {
    return Intl.message(
      'Doldurmak',
      name: 'fill',
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
