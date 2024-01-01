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

  static String m0(total) => "${total} ман.";

  static String m1(count) => "${count}+";

  static String m2(phone, code) =>
      "Чтобы войти отправьте СМС с кодом ${code} на номер ${phone} и вернитесь обратно в программу";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accepted": MessageLookupByLibrary.simpleMessage("Принято"),
        "addToCart": MessageLookupByLibrary.simpleMessage("В корзину"),
        "addToFavorites":
            MessageLookupByLibrary.simpleMessage("Добавить в избранные"),
        "addToFavoritesError": MessageLookupByLibrary.simpleMessage(
            "Не удалось добавить в избранные"),
        "addedToCart":
            MessageLookupByLibrary.simpleMessage("Добавлено в корзину"),
        "address": MessageLookupByLibrary.simpleMessage("Адрес"),
        "ag": MessageLookupByLibrary.simpleMessage("Ашхабад"),
        "ah": MessageLookupByLibrary.simpleMessage("Ахал"),
        "all": MessageLookupByLibrary.simpleMessage("Все"),
        "apply": MessageLookupByLibrary.simpleMessage("Принять"),
        "bn": MessageLookupByLibrary.simpleMessage("Балкан"),
        "canNotVerify": MessageLookupByLibrary.simpleMessage(
            "Не удалось подтвердить ваш номер телефона. Пожалуйста убедитесь что написали номер правильно и у вас есть интернет соединенеие. Попробуйте заново..."),
        "cancel": MessageLookupByLibrary.simpleMessage("Завершить"),
        "cantNavigateToSMSApp": MessageLookupByLibrary.simpleMessage(
            "Не удалось открыть приложение для отправки СМС. Пожалуйста перейдите сами и отправте сообщение."),
        "cart": MessageLookupByLibrary.simpleMessage("Корзина"),
        "cartEmpty": MessageLookupByLibrary.simpleMessage("Корзина пуста"),
        "categories": MessageLookupByLibrary.simpleMessage("Категории"),
        "close": MessageLookupByLibrary.simpleMessage("Закрыть"),
        "confirmRemove":
            MessageLookupByLibrary.simpleMessage("Ыдалить из корзины?"),
        "confirmSignOut":
            MessageLookupByLibrary.simpleMessage("Выйти из аккаунта?"),
        "confirmSignOutContent": MessageLookupByLibrary.simpleMessage(
            "В любой момент можете войти с номером телефона"),
        "connectionError":
            MessageLookupByLibrary.simpleMessage("Нет интернета"),
        "continueButton": MessageLookupByLibrary.simpleMessage("Продолжить"),
        "count": MessageLookupByLibrary.simpleMessage("количество"),
        "country": MessageLookupByLibrary.simpleMessage("Страна производства"),
        "declined": MessageLookupByLibrary.simpleMessage("Не принято"),
        "delivered": MessageLookupByLibrary.simpleMessage("ДОставлен"),
        "delivering": MessageLookupByLibrary.simpleMessage("Доставляеться"),
        "description": MessageLookupByLibrary.simpleMessage("Описание"),
        "doubleBackToExit":
            MessageLookupByLibrary.simpleMessage("Нажмите еще раз для выхода"),
        "dz": MessageLookupByLibrary.simpleMessage("Дашауз"),
        "edit": MessageLookupByLibrary.simpleMessage("Изменитъ"),
        "editProfile": MessageLookupByLibrary.simpleMessage("Изменить данные"),
        "favorites": MessageLookupByLibrary.simpleMessage("Избранные"),
        "fill": MessageLookupByLibrary.simpleMessage("Заполнить"),
        "filter": MessageLookupByLibrary.simpleMessage("Фильтр"),
        "forbidden": MessageLookupByLibrary.simpleMessage(
            "У вас нет прав для этой операции"),
        "gender": MessageLookupByLibrary.simpleMessage("Пол"),
        "homeScreen": MessageLookupByLibrary.simpleMessage("Главная"),
        "hot": MessageLookupByLibrary.simpleMessage("Горячие товары"),
        "in_": MessageLookupByLibrary.simpleMessage("в"),
        "invalidFormat":
            MessageLookupByLibrary.simpleMessage("Неверный формат"),
        "invalidVerificationCode":
            MessageLookupByLibrary.simpleMessage("Неверный код"),
        "isDiscounted": MessageLookupByLibrary.simpleMessage("Скидка"),
        "lang": MessageLookupByLibrary.simpleMessage("Русский"),
        "lb": MessageLookupByLibrary.simpleMessage("Лебап"),
        "loadError": MessageLookupByLibrary.simpleMessage("Нет интернета"),
        "logOut": MessageLookupByLibrary.simpleMessage("Выйти"),
        "login": MessageLookupByLibrary.simpleMessage("Войти"),
        "makeOrder": MessageLookupByLibrary.simpleMessage("Заказать"),
        "man": MessageLookupByLibrary.simpleMessage("Мужчина"),
        "manat": MessageLookupByLibrary.simpleMessage("манат"),
        "mr": MessageLookupByLibrary.simpleMessage("Мары"),
        "nMan": m0,
        "name": MessageLookupByLibrary.simpleMessage("Имя"),
        "next": MessageLookupByLibrary.simpleMessage("Далее"),
        "noData": MessageLookupByLibrary.simpleMessage("Данные не ввседены"),
        "noFavorites":
            MessageLookupByLibrary.simpleMessage("У вас нет избранных товаров"),
        "noOrders":
            MessageLookupByLibrary.simpleMessage("У вас пока нет заказов"),
        "noProducts": MessageLookupByLibrary.simpleMessage("Тут пока пусто ("),
        "ok": MessageLookupByLibrary.simpleMessage("Окей"),
        "open": MessageLookupByLibrary.simpleMessage("Открыть"),
        "orderCreated": MessageLookupByLibrary.simpleMessage(
            "Ваш заказ получен. Вы можете следить за вашим заказом на экране заказов на профиле.\nБлагодарим за ваши покупки!"),
        "orderPlaced": MessageLookupByLibrary.simpleMessage("Заказано"),
        "orders": MessageLookupByLibrary.simpleMessage("Заказы"),
        "page1subtitle":
            MessageLookupByLibrary.simpleMessage("найдите ваши любимые..."),
        "page1title":
            MessageLookupByLibrary.simpleMessage("Из сотен видов товаров"),
        "page2subtitle":
            MessageLookupByLibrary.simpleMessage("и оформите заказ..."),
        "page2title":
            MessageLookupByLibrary.simpleMessage("Выберите цвет и размери"),
        "page3subtitle":
            MessageLookupByLibrary.simpleMessage("в короткие сроки!"),
        "page3title": MessageLookupByLibrary.simpleMessage("Получите заказы"),
        "phone": MessageLookupByLibrary.simpleMessage("Номер телефона"),
        "privacyPolicyLink":
            MessageLookupByLibrary.simpleMessage("media/privacy_policy.pdf"),
        "productColors": MessageLookupByLibrary.simpleMessage("Цвета"),
        "productPrice": MessageLookupByLibrary.simpleMessage("Цена"),
        "productPriceWholesale":
            MessageLookupByLibrary.simpleMessage("Оптовая цена"),
        "productSizes": MessageLookupByLibrary.simpleMessage("Размеры"),
        "productWholesaleDesc": m1,
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "randomProducts": MessageLookupByLibrary.simpleMessage("Другие товары"),
        "readyToDeliver":
            MessageLookupByLibrary.simpleMessage("Готово к доставке"),
        "readyToShip":
            MessageLookupByLibrary.simpleMessage("Готово к отправке"),
        "region": MessageLookupByLibrary.simpleMessage("Область (город)"),
        "removeFromCart":
            MessageLookupByLibrary.simpleMessage("Удалить из корзины"),
        "removeFromFavorites":
            MessageLookupByLibrary.simpleMessage("Удалить из избранных"),
        "removeFromFavoritesError": MessageLookupByLibrary.simpleMessage(
            "Не удалось удалить из избранных"),
        "removedFromCart":
            MessageLookupByLibrary.simpleMessage("Удален из корзины"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("Не должно быть пустым"),
        "retailPrice": MessageLookupByLibrary.simpleMessage("Розничная цена"),
        "retry": MessageLookupByLibrary.simpleMessage("Попробуйте заново"),
        "returned": MessageLookupByLibrary.simpleMessage("Возвращен"),
        "searchHint": MessageLookupByLibrary.simpleMessage("Поиск..."),
        "selectAll": MessageLookupByLibrary.simpleMessage("Выбрать все"),
        "selectColor": MessageLookupByLibrary.simpleMessage("Выберите цвет"),
        "selectGenderAndRegion":
            MessageLookupByLibrary.simpleMessage("Пол и область обязательны"),
        "selectShippingOption":
            MessageLookupByLibrary.simpleMessage("Выберете метод доставки"),
        "selectSize": MessageLookupByLibrary.simpleMessage("Выберите размер"),
        "sendSms": MessageLookupByLibrary.simpleMessage("Отправить СМС"),
        "sendSmsExplanation": m2,
        "serverError": MessageLookupByLibrary.simpleMessage(
            "Ошибка на нашей стороне.\nМы постараемся скоро поправить."),
        "share": MessageLookupByLibrary.simpleMessage("Поделиться"),
        "shareContent": MessageLookupByLibrary.simpleMessage(
            "Hytaýdan we Türkiýeden islendik harydy bölek hem-de lomaý görnüşinde satyn almak isleseňiz Google Play we App Store-dan \"Ýakyn Ýol\" programmasyny ýükläp alyp bilersiňiz!"),
        "shipping": MessageLookupByLibrary.simpleMessage("В пути"),
        "signInForMakeOrder": MessageLookupByLibrary.simpleMessage(
            "Чтобы заказать войдите или создайте аккаунт"),
        "signInToAddToFavorites": MessageLookupByLibrary.simpleMessage(
            "Чтобы добавить в избранное войдите или создайте аккаунт"),
        "similarProducts":
            MessageLookupByLibrary.simpleMessage("Похожие товары"),
        "size": MessageLookupByLibrary.simpleMessage("Размер"),
        "sizeTable": MessageLookupByLibrary.simpleMessage("Размерная таблица"),
        "sizes": MessageLookupByLibrary.simpleMessage("Размеры"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
        "sort": MessageLookupByLibrary.simpleMessage("Сортировка"),
        "sortHot": MessageLookupByLibrary.simpleMessage("Горячие в начале"),
        "sortOurRating":
            MessageLookupByLibrary.simpleMessage("По нашему рейтингу"),
        "sortPriceAsc":
            MessageLookupByLibrary.simpleMessage("Дешевые в начале"),
        "sortPriceDesc":
            MessageLookupByLibrary.simpleMessage("Дорогие в начале"),
        "sortTime": MessageLookupByLibrary.simpleMessage("Новые в начале"),
        "sortWeightAsc":
            MessageLookupByLibrary.simpleMessage("От легкого к тяжелому"),
        "sortWeightDesc":
            MessageLookupByLibrary.simpleMessage("От тяжелого к легкому"),
        "start": MessageLookupByLibrary.simpleMessage("Начать"),
        "today": MessageLookupByLibrary.simpleMessage("Сегодня"),
        "total": MessageLookupByLibrary.simpleMessage("Сумма"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Временно недоступно.\nПопробуйте позже..."),
        "userAgreementLink":
            MessageLookupByLibrary.simpleMessage("media/user_agreement.pdf"),
        "waitingVerificationText": MessageLookupByLibrary.simpleMessage(
            "Верифицируем ваш номер телефона. Просим подождать до 1-2 минут"),
        "watchVideo": MessageLookupByLibrary.simpleMessage("Видео"),
        "whatIsThis": MessageLookupByLibrary.simpleMessage("Что это такое?"),
        "woman": MessageLookupByLibrary.simpleMessage("Женщина"),
        "wrongEmail": MessageLookupByLibrary.simpleMessage("Неверный емаил"),
        "wrongFormat": MessageLookupByLibrary.simpleMessage("Неверный формат"),
        "yes": MessageLookupByLibrary.simpleMessage("Да"),
        "yesterday": MessageLookupByLibrary.simpleMessage("Вчера")
      };
}
