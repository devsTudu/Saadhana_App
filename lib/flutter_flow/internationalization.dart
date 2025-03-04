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
    'flqghbel': {
      'en': 'Saadhana',
      'hi': '',
    },
    'b82kqhdm': {
      'en': 'Habits',
      'hi': '',
    },
    'uvyli3xa': {
      'en': 'New Habit',
      'hi': '',
    },
    'vdct67z7': {
      'en': 'Diary',
      'hi': '',
    },
    'yj1jsi45': {
      'en': 'General',
      'hi': '',
    },
    '493xzxkc': {
      'en': 'Habit',
      'hi': '',
    },
    'xo71txim': {
      'en': 'General',
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
    'skcugqzw': {
      'en': ' Overall',
      'hi': '',
    },
    'wazbgm6r': {
      'en': ' Today',
      'hi': '',
    },
    'yy1wk8k0': {
      'en': 'Ask AI',
      'hi': '',
    },
    'mbkn9ltj': {
      'en': 'Comments',
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
  // menu
  {
    'xnx7bpfa': {
      'en': 'Log out',
      'hi': '',
    },
    '7u0rgkj7': {
      'en': 'Sign In',
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
      'en': 'Settings Habit',
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
      'en': 'Setting',
      'hi': '',
    },
    'tygrew6y': {
      'en': 'Home',
      'hi': '',
    },
  },
  // comment_read
  {
    'ta9tgzo3': {
      'en': 'Added on',
      'hi': '',
    },
    'glj1v1xd': {
      'en': 'Writen By',
      'hi': '',
    },
    'lmy7m1es': {
      'en': 'Hidden from AI',
      'hi': '',
    },
    '8gm0fchn': {
      'en': 'Yes 🔒',
      'hi': '',
    },
    'd5mc7edu': {
      'en': 'No 🔓',
      'hi': '',
    },
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
    'g0okg5uz': {
      'en': 'Adding new email ?',
      'hi': '',
    },
    'rk81ghgf': {
      'en': ',update to this one',
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
    'vtlyqi6o': {
      'en': 'Sign In',
      'hi': '',
    },
    '7rnauv10': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Balance_Page
  {
    '7x1iyxoa': {
      'en': 'Your Current Balance',
      'hi': '',
    },
    'nm4u7wa9': {
      'en': 'AI Summarise',
      'hi': '',
    },
    'o6jhnyz3': {
      'en': 'Audio to Text',
      'hi': '',
    },
    'mxf1wsyc': {
      'en': 'AI Challenges',
      'hi': '',
    },
    '6klvqsno': {
      'en': 'Investing in self is the best investment',
      'hi': '',
    },
    'imqex2lp': {
      'en': 'Recharge',
      'hi': '',
    },
    'wrqa3bdc': {
      'en': 'Balance',
      'hi': '',
    },
    '36kgrauc': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Workin_Zone
  {
    'vjm8ldub': {
      'en': 'Under Construction',
      'hi': '',
    },
    'faqyh1gt': {
      'en':
          'We\'re working hard to bring you something amazing. This feature will be available soon!',
      'hi': '',
    },
    'unxmsxnf': {
      'en': 'Coming Soon',
      'hi': '',
    },
    '26eo33lk': {
      'en':
          '• Enhanced user experience\n• New powerful features\n• Improved performance',
      'hi': '',
    },
    'zw5jqytj': {
      'en': 'Go Back',
      'hi': '',
    },
  },
  // Start_Page_1
  {
    'cyfsg13u': {
      'en': 'Welcome to ',
      'hi': '',
    },
    '1x8ckx4w': {
      'en': 'Saadhana',
      'hi': '',
    },
    'jshlzqej': {
      'en': 'Your way to mastering your life',
      'hi': '',
    },
    'embkddc4': {
      'en': 'Nick name',
      'hi': '',
    },
    'q02kxnqn': {
      'en': 'Enter your name',
      'hi': '',
    },
    'qp80z2cg': {
      'en': 'Get Started',
      'hi': '',
    },
    'qqmoxu65': {
      'en': 'skip',
      'hi': '',
    },
    '1tfmrw1p': {
      'en': 'By continuing, you agree to our ',
      'hi': '',
    },
    '1i7zfys0': {
      'en': 'Privacy Policy',
      'hi': '',
    },
    'n6valp4t': {
      'en': ' and ',
      'hi': '',
    },
    '5n000akp': {
      'en': 'Terms of Service',
      'hi': '',
    },
    'tut41fbg': {
      'en': '© 2025 All Rights Reserved.',
      'hi': '',
    },
  },
  // add_journals
  {
    '99o9tts0': {
      'en': '',
      'hi': '',
    },
    'sphlwen8': {
      'en': 'Journal here',
      'hi': '',
    },
    '4qznep1w': {
      'en': 'Title',
      'hi': '',
    },
    'fqbnzjj3': {
      'en': 'Save',
      'hi': '',
    },
    'r94ytzcj': {
      'en': 'Write Journal',
      'hi': '',
    },
    'e5dmny9t': {
      'en': 'Home',
      'hi': '',
    },
  },
  // habit_setting_page
  {
    'urulco71': {
      'en': 'Habit Setting',
      'hi': '',
    },
    '9erj2goo': {
      'en': 'Goals',
      'hi': '',
    },
    'u7ihdiwd': {
      'en': 'Option 1',
      'hi': '',
    },
    'tz3i15jc': {
      'en': 'Option 2',
      'hi': '',
    },
    '03cn1snw': {
      'en': 'Option 3',
      'hi': '',
    },
    'sijqhmnv': {
      'en': 'New Goal',
      'hi': '',
    },
    'caoxpvc1': {
      'en': 'Notifications',
      'hi': '',
    },
    'l1aovyi0': {
      'en': 'Home',
      'hi': '',
    },
  },
  // support_page
  {
    'eb67zt6b': {
      'en': 'Welcome to support',
      'hi': '',
    },
    '6yl3ehbr': {
      'en': 'How can we help you?',
      'hi': '',
    },
    '9ofk8hd7': {
      'en': 'Walkthrough',
      'hi': '',
    },
    'jkdqjljl': {
      'en': 'Call Us',
      'hi': '',
    },
    '7kcpoi9r': {
      'en': 'Email Us',
      'hi': '',
    },
    'g03vbnqn': {
      'en': 'Review FAQ\'s below',
      'hi': '',
    },
    'eym2cwgj': {
      'en': 'Chat Now',
      'hi': '',
    },
    'kzxchda6': {
      'en': 'Get support',
      'hi': '',
    },
    'wsyfqxnl': {
      'en': 'Home',
      'hi': '',
    },
  },
  // walkthroughs
  {
    '0a115lxp': {
      'en': 'Learn how to make the most of your experience',
      'hi': '',
    },
    's3p16asz': {
      'en': 'Track Your Habits',
      'hi': '',
    },
    '4ys1ql8j': {
      'en':
          'Learn how to create and monitor your daily habits for better consistency',
      'hi': '',
    },
    '87taz450': {
      'en': 'View Guide',
      'hi': '',
    },
    'iolk0gsp': {
      'en': 'AI Features',
      'hi': '',
    },
    '2dwgry7x': {
      'en':
          'Discover how AI can help you build better habits with personalized suggestions',
      'hi': '',
    },
    '56vv2dxt': {
      'en': 'View Guide',
      'hi': '',
    },
    'yztyfchu': {
      'en': 'Journaling',
      'hi': '',
    },
    'bijhqvwq': {
      'en':
          'Learn to write your achievements and challenges to look back when required',
      'hi': '',
    },
    'gugyzari': {
      'en': 'View Guide',
      'hi': '',
    },
    'vqolqpmn': {
      'en': 'More walkthroughs will be added soon',
      'hi': '',
    },
    '0gp9mtpa': {
      'en': 'App Guide',
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
    '9p6561p8': {
      'en': 'AI will read this to help you',
      'hi': '',
    },
    'k8fgepv5': {
      'en': 'AI will not read this',
      'hi': '',
    },
    'tf8rpyld': {
      'en': 'It will never be shared outside',
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
      'en': 'Motivate',
      'hi': '',
    },
    'i5f2jmpj': {
      'en': 'Type',
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
  // walker
  {
    '588e6803': {
      'en': 'Guide',
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
