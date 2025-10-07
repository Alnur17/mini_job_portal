import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../helper/local_store.dart';

class LocalizationController extends GetxController {
  // Observable for selected language
  var selectedLanguage = 'English'.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  static const Map<String, String> languageMap = {
    'en': 'English',
    'bn': 'Bangla',
  };

  // Load saved language from LocalStorage
  Future<void> loadSavedLanguage() async {
    final savedLanguage = LocalStorage.getData(key: 'language') ?? 'English';
    selectedLanguage.value = savedLanguage;
    _updateLocale(savedLanguage);
  }

  // Change language and save it
  Future<void> changeLanguage(String language) async {
    selectedLanguage.value = language;
    await LocalStorage.saveData(key: 'language', data: language);
    _updateLocale(language);
  }

  // Update GetX locale
  void _updateLocale(String language) {
    Locale locale;
    switch (language) {
      case 'Bangla':
        locale = const Locale('bn', 'BD');
        break;
      default:
        locale = const Locale('en', 'US');
    }
    Get.updateLocale(locale);
  }

  // Get current locale
  Locale getCurrentLocale() {
    switch (selectedLanguage.value) {
      case 'Bangla':
        return const Locale('bn', 'BD');
      default:
        return const Locale('en', 'US');
    }
  }
}