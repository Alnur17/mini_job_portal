import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      // LoginView translations
      'login_to_your_account': 'Login to your Account',
      'login_description':
      'It is quick and easy to log in. Enter your email and password below.',
      'email': 'Email',
      'password': 'Password',
      'your_email': 'Your email',
      'password_placeholder': '**********',
      'login_button': 'Login',
      // ArticleListView translations
      'article_list': 'Article List',
      // ArticleDetailsView translations
      'article_details': 'Article Details',
      // SettingsView translations
      'settings': 'Settings',
      'logout': 'Logout',
      'language': 'Language',
      'theme': 'Theme',
    },
    'bn_BD': {
      // LoginView translations
      'login_to_your_account': 'আপনার অ্যাকাউন্টে লগইন করুন',
      'login_description':
      'লগইন করা দ্রুত এবং সহজ। নীচে আপনার ইমেল এবং পাসওয়ার্ড লিখুন।',
      'email': 'ইমেল',
      'password': 'পাসওয়ার্ড',
      'your_email': 'আপনার ইমেল',
      'password_placeholder': '**********',
      'login_button': 'লগইন',
      // ArticleListView translations
      'article_list': 'নিবন্ধ তালিকা',
      // ArticleDetailsView translations
      'article_details': 'নিবন্ধের বিবরণ',
      // SettingsView translations
      'settings': 'সেটিংস',
      'logout': 'লগআউট',
      'language': 'ভাষা',
      'theme': 'থিম',
    },
  };
}