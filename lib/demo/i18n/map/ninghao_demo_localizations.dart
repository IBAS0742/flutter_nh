import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NinghaoDemoLocalizations {
  final Locale locale;

  NinghaoDemoLocalizations(this.locale);

  static NinghaoDemoLocalizations of(BuildContext context) {
    return Localizations.of<NinghaoDemoLocalizations>(
      context,
      NinghaoDemoLocalizations
    );
  }

  static Map<String,Map<String,String>> _localized = {
    'en': {
      'title': 'hello'
    },
    'zh': {
      'title': '你好'
    }
  };
  
  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class NinghaoDemoLocalizationDelegate extends 
  LocalizationsDelegate<NinghaoDemoLocalizations> {
    NinghaoDemoLocalizationDelegate();

    @override
  Future<NinghaoDemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<NinghaoDemoLocalizations>(
      NinghaoDemoLocalizations(locale)
    );
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<NinghaoDemoLocalizations> old) {
    return false;
  }
}
