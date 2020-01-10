import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocaLizations {
  final Locale locale;
  AppLocaLizations(this.locale);

  static AppLocaLizations of(BuildContext context) {
    return Localizations.of<AppLocaLizations>(context, AppLocaLizations);
  }

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }

  static const LocalizationsDelegate<AppLocaLizations> delegate =
      _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocaLizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocaLizations> load(Locale locale) async {
    AppLocaLizations appLocaLizations = new AppLocaLizations(locale);
    await appLocaLizations.load();
    return appLocaLizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocaLizations> old) {
    return false;
  }
}
