import 'package:flutter/material.dart';

import '../../constant/cache_key.dart';
import '../../../l10n/l10n.dart';
import '../../services/cache_helper.dart';
import '../domain/model/language_model.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _locale;
  String? lang = 'en';
  Locale? get locale => _locale;

  void setLocal({required Locale locale}) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    lang = locale.languageCode;
    notifyListeners();
  }

  void setInitLang() {
    final langCode = CacheHelper.getData(key: CacheKey.lang);
    if (langCode == null || langCode == '') {
      lang = 'en';
      CacheHelper.saveData(key: CacheKey.lang, value: lang);
    } else {
      lang = langCode;
    }

    notifyListeners();
  }

  List<Languages> allLanguage = [];
  List<String> allGlobal = [];

  void addLang(List<Languages> languages) {
    allLanguage = languages;
    notifyListeners();
  }

  void changeLanguage(BuildContext context) {
    if (lang == 'en') {
      setLocal(locale: const Locale('ar'));
      CacheHelper.saveData(key: CacheKey.lang, value: 'ar');
    } else {
      setLocal(locale: const Locale('en'));
      CacheHelper.saveData(key: CacheKey.lang, value: 'en');
    }
  }

  void clearLocal() {
    _locale = null;
    notifyListeners();
  }
}
