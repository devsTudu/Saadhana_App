import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'dvrbf49j': {
      'en': 'Habit',
      'hi': '',
    },
    'uvyli3xa': {
      'en': 'Start Good Habits',
      'hi': '',
    },
    'bvtrm5v5': {
      'en': 'Home',
      'hi': '',
    },
  },
  // CreateHabit
  {
    '4wztpc4g': {
      'en': 'Start New Habit',
      'hi': '',
    },
    '9f6w69is': {
      'en': 'Habit Name',
      'hi': '',
    },
    'yqib2kl7': {
      'en': 'Auto add description',
      'hi': '',
    },
    '4gwfwneh': {
      'en': 'Add details',
      'hi': '',
    },
    'fyc58gb7': {
      'en': 'Add tags',
      'hi': '',
    },
    'u9tiwzwj': {
      'en': 'Product Design',
      'hi': '',
    },
    'tmfqumvi': {
      'en': 'FlutterFlow',
      'hi': '',
    },
    '217zzmj0': {
      'en': 'UI Design',
      'hi': '',
    },
    '537t3kck': {
      'en': 'Web Design',
      'hi': '',
    },
    'kljc2y7x': {
      'en': 'Product Design',
      'hi': '',
    },
    '1tydzeww': {
      'en': 'Due Date',
      'hi': '',
    },
    'jjsjyk7d': {
      'en': 'Lets Start',
      'hi': '',
    },
    'iaurdegv': {
      'en': 'Home',
      'hi': '',
    },
  },
  // habit_view
  {
    '00fseq0w': {
      'en': 'Today',
      'hi': '',
    },
    'to2zb9ob': {
      'en': '/',
      'hi': '',
    },
    'skcugqzw': {
      'en': ' Overall',
      'hi': '',
    },
    'mbkn9ltj': {
      'en': 'Comments',
      'hi': '',
    },
    'ztln9x0f': {
      'en': 'Habit Details',
      'hi': '',
    },
    'i33tz64o': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Auth1
  {
    '81olgxrw': {
      'en': 'Saadhana',
      'hi': '',
    },
    'dq0nzm96': {
      'en': 'Sign In',
      'hi': '',
    },
    '8w0c9jrd': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': '',
    },
    'ppb0odwb': {
      'en': 'Email',
      'hi': '',
    },
    'g9mqu6cd': {
      'en': 'Password',
      'hi': '',
    },
    '955kc4c4': {
      'en': 'Sign In',
      'hi': '',
    },
    '4fa9pq0g': {
      'en': 'Forgot Password',
      'hi': '',
    },
    'jqhreaak': {
      'en': 'Or sign up with',
      'hi': '',
    },
    'ljx0lmkf': {
      'en': 'Continue with Google',
      'hi': '',
    },
    'ycu5u942': {
      'en': 'Sign Up',
      'hi': '',
    },
    'kfkz7h69': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': '',
    },
    'wh28zdx3': {
      'en': 'Email',
      'hi': '',
    },
    'dscxd1vm': {
      'en': 'Phone',
      'hi': '',
    },
    '25zlhft5': {
      'en': 'Password',
      'hi': '',
    },
    '3o9o9gvb': {
      'en': 'Confirm Password',
      'hi': '',
    },
    'mi8edhyt': {
      'en': 'Create Account',
      'hi': '',
    },
    'r0z9an5w': {
      'en': 'Or sign up with',
      'hi': '',
    },
    'r8yqycyr': {
      'en': 'Continue with Google',
      'hi': '',
    },
    's03d00ui': {
      'en': 'Home',
      'hi': '',
    },
  },
  // profile
  {
    'xnx7bpfa': {
      'en': 'Log out',
      'hi': '',
    },
    'juwnzev4': {
      'en': 'Account',
      'hi': '',
    },
    'e62g6twr': {
      'en': 'Balance',
      'hi': '',
    },
    'glseehyx': {
      'en': 'Notification Settings',
      'hi': '',
    },
    'q2c0lr74': {
      'en': 'Edit Profile',
      'hi': '',
    },
    'ss0ou68f': {
      'en': 'General',
      'hi': '',
    },
    'djhz1nzr': {
      'en': 'Support',
      'hi': '',
    },
    'j23ggel7': {
      'en': 'Terms of Service',
      'hi': '',
    },
    'q0x2esqy': {
      'en': 'Invite Friends',
      'hi': '',
    },
    'tx2vkj0m': {
      'en': 'Profile',
      'hi': '',
    },
    'tygrew6y': {
      'en': 'Home',
      'hi': '',
    },
  },
  // comment_read
  {
    'xfs1iyf5': {
      'en': 'Home',
      'hi': '',
    },
  },
  // profile_edit
  {
    '6ioe2w4y': {
      'en': 'Complete Profile',
      'hi': '',
    },
    'co4rvv61': {
      'en': 'Your information',
      'hi': '',
    },
    'fz82jmmh': {
      'en': 'Your Name',
      'hi': '',
    },
    'tjhpxinf': {
      'en': 'Email',
      'hi': '',
    },
    '8sql2v45': {
      'en': 'Email',
      'hi': '',
    },
    '2tol0p94': {
      'en': '❗Email Not Verified',
      'hi': '',
    },
    'xq96dgww': {
      'en': ', send verification mail',
      'hi': '',
    },
    'bj0qks2a': {
      'en': 'Phone',
      'hi': '',
    },
    'qdvmqape': {
      'en': 'Save Changes',
      'hi': '',
    },
    '7rnauv10': {
      'en': 'Home',
      'hi': '',
    },
  },
  // JournalPage
  {
    '56hyss0l': {
      'en': 'Short Message',
      'hi': '',
    },
    'mvxuw35n': {
      'en': 'Comment',
      'hi': '',
    },
    '6bg6h3g0': {
      'en': 'Notes',
      'hi': '',
    },
    'zgn6e5du': {
      'en': 'In this habit I can... because today ...',
      'hi': '',
    },
    '71xmlogo': {
      'en': 'Your future self can take help from this',
      'hi': '',
    },
  },
  // AskAI_Page
  {
    'kg9ubkds': {
      'en': 'Ask AI 🤖',
      'hi': '',
    },
    'v3ccgvjx': {
      'en': 'Motivation',
      'hi': '',
    },
    'i5f2jmpj': {
      'en': 'Type',
      'hi': '',
    },
    '383azmht': {
      'en': 'Tips',
      'hi': '',
    },
    'itd7sc83': {
      'en': 'Motivate',
      'hi': '',
    },
    'jas7pw68': {
      'en': 'Critcise',
      'hi': '',
    },
    'bpiynf0g': {
      'en': 'Solve',
      'hi': '',
    },
    'gzy6xavs': {
      'en': 'Question',
      'hi': '',
    },
    '9tco4r17': {
      'en': 'Use  Comments',
      'hi': '',
    },
    'bwly1i2m': {
      'en': 'Ask',
      'hi': '',
    },
  },
  // DarkLightSwitchLarge
  {
    'nlcjwk7q': {
      'en': 'Light Mode',
      'hi': '',
    },
    'fkzl20dm': {
      'en': 'Dark Mode',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'riwcehii': {
      'en': '',
      'hi': '',
    },
    'cg7aeyhs': {
      'en': '',
      'hi': '',
    },
    'rdvnb3pj': {
      'en': '',
      'hi': '',
    },
    'hd03etks': {
      'en': '',
      'hi': '',
    },
    '8wdl6jbf': {
      'en': '',
      'hi': '',
    },
    '4c1dza9i': {
      'en': '',
      'hi': '',
    },
    'eb1k7vvi': {
      'en': '',
      'hi': '',
    },
    'u3q1wjrn': {
      'en': '',
      'hi': '',
    },
    'ec5wygz4': {
      'en': '',
      'hi': '',
    },
    's3f0qs8d': {
      'en': '',
      'hi': '',
    },
    'vv4ryikf': {
      'en': '',
      'hi': '',
    },
    'usi77urn': {
      'en': '',
      'hi': '',
    },
    '6hk25bum': {
      'en': '',
      'hi': '',
    },
    'z5rdhafc': {
      'en': '',
      'hi': '',
    },
    'vcsklkeh': {
      'en': '',
      'hi': '',
    },
    'qlpc8get': {
      'en': '',
      'hi': '',
    },
    'sovmvc0f': {
      'en': '',
      'hi': '',
    },
    'md0717dk': {
      'en': '',
      'hi': '',
    },
    'v4wqedgo': {
      'en': '',
      'hi': '',
    },
    'keovqo6x': {
      'en': '',
      'hi': '',
    },
    'bfmrrp2u': {
      'en': '',
      'hi': '',
    },
    '5ehxf7l5': {
      'en': '',
      'hi': '',
    },
    'cwsacor9': {
      'en': '',
      'hi': '',
    },
    '6pbw5heo': {
      'en': '',
      'hi': '',
    },
    '7cfsmbal': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
