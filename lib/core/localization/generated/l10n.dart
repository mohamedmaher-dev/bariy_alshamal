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

class Language {
  Language();

  static Language? _current;

  static Language get current {
    assert(_current != null,
        'No instance of Language was loaded. Try to initialize the Language delegate before accessing Language.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Language> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Language();
      Language._current = instance;

      return instance;
    });
  }

  static Language of(BuildContext context) {
    final instance = Language.maybeOf(context);
    assert(instance != null,
        'No instance of Language present in the widget tree. Did you add Language.delegate in localizationsDelegates?');
    return instance!;
  }

  static Language? maybeOf(BuildContext context) {
    return Localizations.of<Language>(context, Language);
  }

  /// `اسم المستخدم`
  String get user_name {
    return Intl.message(
      'اسم المستخدم',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get phone_number {
    return Intl.message(
      'رقم الهاتف',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `انشاء حساب`
  String get create_account {
    return Intl.message(
      'انشاء حساب',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get sign_in {
    return Intl.message(
      'تسجيل الدخول',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `لدي حساب بالفعل`
  String get already_have_account {
    return Intl.message(
      'لدي حساب بالفعل',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `ليس لدي حساب`
  String get dont_have_account {
    return Intl.message(
      'ليس لدي حساب',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `مرحبا`
  String get welcome {
    return Intl.message(
      'مرحبا',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `اهلا بك`
  String get welcome_back {
    return Intl.message(
      'اهلا بك',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `نحن سعداء لنضمامك الينا ..`
  String get sign_up_msg1 {
    return Intl.message(
      'نحن سعداء لنضمامك الينا ..',
      name: 'sign_up_msg1',
      desc: '',
      args: [],
    );
  }

  /// `نتمني لك تجربه سعيدة`
  String get sign_up_msg2 {
    return Intl.message(
      'نتمني لك تجربه سعيدة',
      name: 'sign_up_msg2',
      desc: '',
      args: [],
    );
  }

  /// `ذبيحتك تصل الي بيتك`
  String get slogan {
    return Intl.message(
      'ذبيحتك تصل الي بيتك',
      name: 'slogan',
      desc: '',
      args: [],
    );
  }

  /// `نحن سعداء بعودتك مجددا`
  String get sign_in_msg1 {
    return Intl.message(
      'نحن سعداء بعودتك مجددا',
      name: 'sign_in_msg1',
      desc: '',
      args: [],
    );
  }

  /// `نتمني لك تجربه سعيدة`
  String get sign_in_msg2 {
    return Intl.message(
      'نتمني لك تجربه سعيدة',
      name: 'sign_in_msg2',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد رقم الهاتف`
  String get phone_number_confirm {
    return Intl.message(
      'تأكيد رقم الهاتف',
      name: 'phone_number_confirm',
      desc: '',
      args: [],
    );
  }

  /// `قم بكتابة الكود الذي وصل اليك في رسالة`
  String get write_the_code {
    return Intl.message(
      'قم بكتابة الكود الذي وصل اليك في رسالة',
      name: 'write_the_code',
      desc: '',
      args: [],
    );
  }

  /// `الرقم غير صحيح`
  String get wrong_phone {
    return Intl.message(
      'الرقم غير صحيح',
      name: 'wrong_phone',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Language> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Language> load(Locale locale) => Language.load(locale);
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
