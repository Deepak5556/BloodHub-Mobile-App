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

  static List<String> languages() => ['en', 'ta', 'ml', 'kn'];

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
    String? taText = '',
    String? mlText = '',
    String? knText = '',
  }) =>
      [enText, taText, mlText, knText][languageIndex] ?? '';

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
  // Onboarding-1
  {
    'btmus93o': {
      'en': 'Welcome to BloodHub',
      'kn': 'BloodHub ಗೆ ಸುಸ್ವಾಗತ',
      'ml': 'BloodHub-ലേക്ക് സ്വാഗതം',
      'ta': 'BloodHub க்கு வரவேற்கிறோம்',
    },
    '7t5y6r0q': {
      'en': 'Save Lives: Your blood donation can save up to three lives.',
      'kn': 'ಜೀವ ಉಳಿಸಿ: ನಿಮ್ಮ ರಕ್ತದಾನದಿಂದ ಮೂರು ಜೀವಗಳನ್ನು ಉಳಿಸಬಹುದು.',
      'ml':
          'ജീവൻ രക്ഷിക്കുക: നിങ്ങളുടെ രക്തദാനത്തിന് മൂന്ന് ജീവൻ വരെ രക്ഷിക്കാനാകും.',
      'ta':
          'உயிர்களைக் காப்பாற்றுங்கள்: உங்கள் இரத்த தானம் மூன்று உயிர்களைக் காப்பாற்றும்.',
    },
    'nbdlodqm': {
      'en': 'Next',
      'kn': 'ಮುಂದೆ',
      'ml': 'അടുത്തത്',
      'ta': 'அடுத்து',
    },
    'rqrf4x5v': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // DonateForm
  {
    '2f4m8hv4': {
      'en': 'Enter Name',
      'kn': 'ಹೆಸರನ್ನು ನಮೂದಿಸಿ',
      'ml': 'പേര് നൽകുക',
      'ta': 'பெயரை உள்ளிடவும்',
    },
    '7t36q1e3': {
      'en': 'Full name*',
      'kn': 'ಪೂರ್ಣ ಹೆಸರು*',
      'ml': 'പൂർണ്ണമായ പേര്*',
      'ta': 'முழு பெயர்*',
    },
    'wtzr0cag': {
      'en': 'Blood Group',
      'kn': 'ರಕ್ತದ ಗುಂಪು',
      'ml': 'രക്ത ഗ്രൂപ്പ്',
      'ta': 'இரத்தக் குழு',
    },
    'as0tagyn': {
      'en': 'blood group*',
      'kn': 'ರಕ್ತದ ಗುಂಪು*',
      'ml': 'രക്ത ഗ്രൂപ്പ്*',
      'ta': 'இரத்த பிரிவு*',
    },
    'pkeq3zq0': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'ojzjggjz': {
      'en': 'Enter Age',
      'kn': 'ವಯಸ್ಸನ್ನು ನಮೂದಿಸಿ',
      'ml': 'പ്രായം നൽകുക',
      'ta': 'வயதை உள்ளிடவும்',
    },
    '3i3bmxb0': {
      'en': 'Age*',
      'kn': 'ವಯಸ್ಸು*',
      'ml': 'പ്രായം*',
      'ta': 'வயது*',
    },
    '9g42mjjh': {
      'en': 'Enter Weight',
      'kn': 'ತೂಕವನ್ನು ನಮೂದಿಸಿ',
      'ml': 'ഭാരം നൽകുക',
      'ta': 'எடையை உள்ளிடவும்',
    },
    'wgvlrusg': {
      'en': 'Weight*',
      'kn': 'ತೂಕ*',
      'ml': 'ഭാരം*',
      'ta': 'எடை*',
    },
    'bijkvgi0': {
      'en': 'Enter Phone Number',
      'kn': 'ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ',
      'ml': 'ഫോൺ നമ്പർ നൽകുക',
      'ta': 'தொலைபேசி எண்ணை உள்ளிடவும்',
    },
    '8dplxydg': {
      'en': 'phone number*',
      'kn': 'ದೂರವಾಣಿ ಸಂಖ್ಯೆ*',
      'ml': 'ഫോൺ നമ്പർ*',
      'ta': 'தொலைபேசி எண்*',
    },
    'vb6shx19': {
      'en': '+91 ',
      'kn': '+91',
      'ml': '+91',
      'ta': '+91',
    },
    'uobtx7rx': {
      'en': '+91 ',
      'kn': '+91',
      'ml': '+91',
      'ta': '+91',
    },
    'iij7n3f9': {
      'en': 'Enter Date Of Birth',
      'kn': 'ಹುಟ್ಟಿದ ದಿನಾಂಕವನ್ನು ನಮೂದಿಸಿ',
      'ml': 'ജനനത്തീയതി നൽകുക',
      'ta': 'பிறந்த தேதியை உள்ளிடவும்',
    },
    'zts8zxog': {
      'en': 'dd/mm/yyyy',
      'kn': 'dd/mm/yyyy',
      'ml': 'dd/mm/yyyy',
      'ta': 'dd/mm/yyyy',
    },
    'us4ojxlv': {
      'en': 'Gender',
      'kn': 'ಲಿಂಗ',
      'ml': 'ലിംഗഭേദം',
      'ta': 'பாலினம்',
    },
    '3t2tpi60': {
      'en': 'Female',
      'kn': 'ಹೆಣ್ಣು',
      'ml': 'സ്ത്രീ',
      'ta': 'பெண்',
    },
    'lqjabmg2': {
      'en': 'Male',
      'kn': 'ಪುರುಷ',
      'ml': 'പുരുഷൻ',
      'ta': 'ஆண்',
    },
    'z77j3s9n': {
      'en': 'Other',
      'kn': 'ಇತರೆ',
      'ml': 'മറ്റുള്ളവ',
      'ta': 'மற்றவை',
    },
    'b82i1tql': {
      'en': 'Select State',
      'kn': 'ರಾಜ್ಯವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'സംസ്ഥാനം തിരഞ്ഞെടുക്കുക',
      'ta': 'மாநிலத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'ch1o9rw9': {
      'en': 'Select one...',
      'kn': 'ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ...',
      'ml': 'ഒന്ന് തിരഞ്ഞെടുക്കുക...',
      'ta': 'ஒன்றைத் தேர்ந்தெடு...',
    },
    'mwstu88a': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    '9yzop1yq': {
      'en': 'Select District',
      'kn': 'ಜಿಲ್ಲೆ ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'ജില്ല തിരഞ്ഞെടുക്കുക',
      'ta': 'மாவட்டத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'nilgu3at': {
      'en': 'Select one...',
      'kn': 'ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ...',
      'ml': 'ഒന്ന് തിരഞ്ഞെടുക്കുക...',
      'ta': 'ஒன்றைத் தேர்ந்தெடு...',
    },
    'vyxvw0gk': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    '4s6q287r': {
      'en': 'Select City',
      'kn': 'ನಗರವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'നഗരം തിരഞ്ഞെടുക്കുക',
      'ta': 'நகரத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'tbhn09yu': {
      'en': 'Select one...',
      'kn': 'ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ...',
      'ml': 'ഒന്ന് തിരഞ്ഞെടുക്കുക...',
      'ta': 'ஒன்றைத் தேர்ந்தெடு...',
    },
    'j55hlk4i': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'sgjbpdxg': {
      'en': 'Submit Form',
      'kn': 'ಫಾರ್ಮ್ ಸಲ್ಲಿಸಿ',
      'ml': 'ഫോം സമർപ്പിക്കുക',
      'ta': 'படிவத்தை சமர்ப்பிக்கவும்',
    },
    'fqxaalh8': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    'nb1y150k': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'anlchw79': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    'zbtimdla': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'iej0xz5q': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    'm1btwgzt': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'j4x1yjsi': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    'w5asjooh': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'r8dh33xu': {
      'en': 'Donation Form',
      'kn': 'ದೇಣಿಗೆ ನಮೂನೆ',
      'ml': 'സംഭാവന ഫോം',
      'ta': 'நன்கொடை படிவம்',
    },
    'kee17nmt': {
      'en': 'Please fill out the form below to continue.',
      'kn': 'ಮುಂದುವರಿಸಲು ದಯವಿಟ್ಟು ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡಿ.',
      'ml': 'തുടരാൻ താഴെയുള്ള ഫോം പൂരിപ്പിക്കുക.',
      'ta': 'தொடர, கீழே உள்ள படிவத்தை நிரப்பவும்.',
    },
    'd3i1kuuf': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // SearchDonars
  {
    'wqdvnbnm': {
      'en': 'Blood Group',
      'kn': 'ರಕ್ತದ ಗುಂಪು',
      'ml': 'രക്ത ഗ്രൂപ്പ്',
      'ta': 'இரத்தக் குழு',
    },
    'gp600b1r': {
      'en': 'Blood Group',
      'kn': 'ರಕ್ತದ ಗುಂಪು',
      'ml': 'രക്ത ഗ്രൂപ്പ്',
      'ta': 'இரத்தக் குழு',
    },
    '6irjkogr': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    '5wjr7nvz': {
      'en': 'Select State',
      'kn': 'ರಾಜ್ಯವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'സംസ്ഥാനം തിരഞ്ഞെടുക്കുക',
      'ta': 'மாநிலத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'chlvbawg': {
      'en': 'Select One',
      'kn': 'ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'ഒന്ന് തിരഞ്ഞെടുക്കുക',
      'ta': 'ஒன்றைத் தேர்ந்தெடுக்கவும்',
    },
    '3sn3fzho': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'q1tqvleb': {
      'en': 'Select District',
      'kn': 'ಜಿಲ್ಲೆ ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'ജില്ല തിരഞ്ഞെടുക്കുക',
      'ta': 'மாவட்டத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'gjpv4id2': {
      'en': 'Select One',
      'kn': 'ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'ഒന്ന് തിരഞ്ഞെടുക്കുക',
      'ta': 'ஒன்றைத் தேர்ந்தெடுக்கவும்',
    },
    'w8sscadg': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'o9vyzua6': {
      'en': 'Select City',
      'kn': 'ನಗರವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'നഗരം തിരഞ്ഞെടുക്കുക',
      'ta': 'நகரத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'l9a7quf7': {
      'en': 'Select One',
      'kn': 'ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'ഒന്ന് തിരഞ്ഞെടുക്കുക',
      'ta': 'ஒன்றைத் தேர்ந்தெடுக்கவும்',
    },
    'lvz1a2nj': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'a6nx28c1': {
      'en': 'Search donars',
      'kn': 'ದಾನಿಗಳನ್ನು ಹುಡುಕಿ',
      'ml': 'ദാതാക്കളെ തിരയുക',
      'ta': 'நன்கொடையாளர்களைத் தேடுங்கள்',
    },
    'tzesd6bn': {
      'en': 'Scarch donars',
      'kn': 'ಸ್ಕಾರ್ಚ್ ದಾನಿಗಳು',
      'ml': 'സ്കാർച്ച് ദാതാക്കൾ',
      'ta': 'ஸ்கார்ச் நன்கொடையாளர்கள்',
    },
    'k0vet36f': {
      'en': 'Search Donar',
      'kn': 'ಡೊನಾರ್ ಅನ್ನು ಹುಡುಕಿ',
      'ml': 'ഡോണർ തിരയുക',
      'ta': 'டோனரைத் தேடுங்கள்',
    },
  },
  // Table
  {
    'b2v8k61l': {
      'en': 'List Of Donars',
      'kn': 'ದಾನಿಗಳ ಪಟ್ಟಿ',
      'ml': 'ദാതാക്കളുടെ പട്ടിക',
      'ta': 'நன்கொடையாளர்களின் பட்டியல்',
    },
    'js8iofrr': {
      'en': 'Name',
      'kn': 'ಹೆಸರು',
      'ml': 'പേര്',
      'ta': 'பெயர்',
    },
    'jr69c158': {
      'en': 'Phone Number',
      'kn': 'ದೂರವಾಣಿ ಸಂಖ್ಯೆ',
      'ml': 'ഫോൺ നമ്പർ',
      'ta': 'தொலைபேசி எண்',
    },
    '0rypvoyv': {
      'en': 'Call',
      'kn': 'ಕರೆ ಮಾಡಿ',
      'ml': 'വിളിക്കൂ',
      'ta': 'அழைக்கவும்',
    },
    '8inoti82': {
      'en': 'Report',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '2xlkv94x': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // Settings
  {
    'eu2j7mo1': {
      'en': 'General',
      'kn': 'ಸಾಮಾನ್ಯ',
      'ml': 'ജനറൽ',
      'ta': 'பொது',
    },
    'q9n2i23b': {
      'en': 'Language',
      'kn': 'ಭಾಷೆ',
      'ml': 'ഭാഷ',
      'ta': 'மொழி',
    },
    '3rm5b9ek': {
      'en': 'Support',
      'kn': 'ಬೆಂಬಲ',
      'ml': 'പിന്തുണ',
      'ta': 'ஆதரவு',
    },
    'ualxt7yy': {
      'en': 'Terms of Service',
      'kn': 'ಸೇವಾ ನಿಯಮಗಳು',
      'ml': 'സേവന നിബന്ധനകൾ',
      'ta': 'சேவை விதிமுறைகள்',
    },
    'odcs6w64': {
      'en': 'Dark Mode',
      'kn': 'ಡಾರ್ಕ್ ಮೋಡ್',
      'ml': 'ഡാർക്ക് മോഡ്',
      'ta': 'இருண்ட பயன்முறை',
    },
    'bdrsd931': {
      'en': 'Invite Friends',
      'kn': 'ಸ್ನೇಹಿತರನ್ನು ಆಹ್ವಾನಿಸಿ',
      'ml': 'സുഹൃത്തുക്കളെ ക്ഷണിക്കുക',
      'ta': 'நண்பர்களை அழைக்கவும்',
    },
    'bl7qsttv': {
      'en': 'Delete Account',
      'kn': 'ಖಾತೆಯನ್ನು ಅಳಿಸಿ',
      'ml': 'അക്കൗണ്ട് ഇല്ലാതാക്കുക',
      'ta': 'கணக்கை நீக்கு',
    },
    'mppzcym9': {
      'en': 'Logout',
      'kn': 'ಲಾಗ್ಔಟ್',
      'ml': 'പുറത്തുകടക്കുക',
      'ta': 'வெளியேறு',
    },
    'w60krvl4': {
      'en': 'Profile',
      'kn': 'ಪ್ರೊಫೈಲ್',
      'ml': 'പ്രൊഫൈൽ',
      'ta': 'சுயவிவரம்',
    },
    'n0udq7ek': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // Home
  {
    '2yhwffh2': {
      'en': 'Blood Donate',
      'kn': 'ರಕ್ತದಾನ ಮಾಡಿ',
      'ml': 'രക്തം ദാനം ചെയ്യുക',
      'ta': 'இரத்த தானம் செய்யுங்கள்',
    },
    'm1svywkv': {
      'en':
          'Register your blood donation details now and be a hero in someone\'s story. Your simple act of kindness can give the gift of life to those in need. Join us in our mission to save lives, one donation at a time!',
      'kn':
          'ನಿಮ್ಮ ರಕ್ತದಾನದ ವಿವರಗಳನ್ನು ಈಗಲೇ ನೋಂದಾಯಿಸಿ ಮತ್ತು ಯಾರೊಬ್ಬರ ಕಥೆಯಲ್ಲಿ ಹೀರೋ ಆಗಿರಿ. ನಿಮ್ಮ ದಯೆಯ ಸರಳ ಕ್ರಿಯೆಯು ಅಗತ್ಯವಿರುವವರಿಗೆ ಜೀವನದ ಉಡುಗೊರೆಯನ್ನು ನೀಡುತ್ತದೆ. ಜೀವಗಳನ್ನು ಉಳಿಸುವ ನಮ್ಮ ಮಿಷನ್‌ನಲ್ಲಿ ನಮ್ಮೊಂದಿಗೆ ಸೇರಿ, ಒಂದು ಸಮಯದಲ್ಲಿ ಒಂದು ಕೊಡುಗೆ!',
      'ml':
          'നിങ്ങളുടെ രക്തദാന വിശദാംശങ്ങൾ ഇപ്പോൾ രജിസ്റ്റർ ചെയ്ത് ആരുടെയെങ്കിലും കഥയിൽ നായകനാകൂ. നിങ്ങളുടെ ദയയുടെ ലളിതമായ പ്രവൃത്തി ആവശ്യമുള്ളവർക്ക് ജീവൻ്റെ സമ്മാനം നൽകും. ജീവൻ രക്ഷിക്കാനുള്ള ഞങ്ങളുടെ ദൗത്യത്തിൽ ഞങ്ങളോടൊപ്പം ചേരൂ, ഒരു സമയം ഒരു സംഭാവന!',
      'ta':
          'உங்கள் இரத்த தான விவரங்களை இப்போதே பதிவு செய்து, ஒருவரின் கதையில் ஹீரோவாகுங்கள். உங்கள் எளிய கருணை செயல் தேவைப்படுபவர்களுக்கு வாழ்வின் பரிசை அளிக்கும். ஒரு நேரத்தில் ஒரு நன்கொடை, உயிர்களைக் காப்பாற்றும் எங்கள் பணியில் எங்களுடன் சேருங்கள்!',
    },
    'f5v9emg3': {
      'en': 'Donate Blood',
      'kn': 'ರಕ್ತದಾನ ಮಾಡಿ',
      'ml': 'രക്തം ദാനം ചെയ്യുക',
      'ta': 'இரத்த தானம் செய்யுங்கள்',
    },
    '08ik3vt8': {
      'en': 'Blood Donate',
      'kn': 'ರಕ್ತದಾನ ಮಾಡಿ',
      'ml': 'രക്തം ദാനം ചെയ്യുക',
      'ta': 'இரத்த தானம் செய்யுங்கள்',
    },
    '5xwlh50m': {
      'en':
          'Find and connect with registered blood donors in your area quickly and easily. Use our search feature to locate donors based on blood type, location, and availability. View donor profiles to see their donation history and contact information. Reach out directly for urgent needs or to organize a donation drive',
      'kn':
          'ನಿಮ್ಮ ಪ್ರದೇಶದಲ್ಲಿ ನೋಂದಾಯಿತ ರಕ್ತದಾನಿಗಳನ್ನು ತ್ವರಿತವಾಗಿ ಮತ್ತು ಸುಲಭವಾಗಿ ಹುಡುಕಿ ಮತ್ತು ಸಂಪರ್ಕಿಸಿ. ರಕ್ತದ ಪ್ರಕಾರ, ಸ್ಥಳ ಮತ್ತು ಲಭ್ಯತೆಯ ಆಧಾರದ ಮೇಲೆ ದಾನಿಗಳನ್ನು ಪತ್ತೆಹಚ್ಚಲು ನಮ್ಮ ಹುಡುಕಾಟ ವೈಶಿಷ್ಟ್ಯವನ್ನು ಬಳಸಿ. ಅವರ ದೇಣಿಗೆ ಇತಿಹಾಸ ಮತ್ತು ಸಂಪರ್ಕ ಮಾಹಿತಿಯನ್ನು ನೋಡಲು ದಾನಿಗಳ ಪ್ರೊಫೈಲ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ. ತುರ್ತು ಅಗತ್ಯಗಳಿಗಾಗಿ ಅಥವಾ ದೇಣಿಗೆ ಡ್ರೈವ್ ಅನ್ನು ಆಯೋಜಿಸಲು ನೇರವಾಗಿ ತಲುಪಿ',
      'ml':
          'നിങ്ങളുടെ പ്രദേശത്തെ രജിസ്റ്റർ ചെയ്ത രക്തദാതാക്കളെ വേഗത്തിലും എളുപ്പത്തിലും കണ്ടെത്തി അവരുമായി ബന്ധപ്പെടുക. രക്തഗ്രൂപ്പ്, സ്ഥാനം, ലഭ്യത എന്നിവയെ അടിസ്ഥാനമാക്കി ദാതാക്കളെ കണ്ടെത്താൻ ഞങ്ങളുടെ തിരയൽ ഫീച്ചർ ഉപയോഗിക്കുക. അവരുടെ സംഭാവന ചരിത്രവും ബന്ധപ്പെടാനുള്ള വിവരങ്ങളും കാണുന്നതിന് ദാതാക്കളുടെ പ്രൊഫൈലുകൾ കാണുക. അടിയന്തിര ആവശ്യങ്ങൾക്കായി നേരിട്ട് ബന്ധപ്പെടുക അല്ലെങ്കിൽ ഒരു സംഭാവന ഡ്രൈവ് സംഘടിപ്പിക്കുക',
      'ta':
          'உங்கள் பகுதியில் பதிவுசெய்யப்பட்ட இரத்த தானம் செய்பவர்களை விரைவாகவும் எளிதாகவும் கண்டுபிடித்து இணைக்கவும். இரத்த வகை, இருப்பிடம் மற்றும் இருப்பு ஆகியவற்றின் அடிப்படையில் நன்கொடையாளர்களைக் கண்டறிய எங்கள் தேடல் அம்சத்தைப் பயன்படுத்தவும். நன்கொடை வரலாறு மற்றும் தொடர்புத் தகவலைப் பார்க்க நன்கொடையாளர் சுயவிவரங்களைப் பார்க்கவும். அவசரத் தேவைகளுக்கு நேரடியாகத் தொடர்புகொள்ளவும் அல்லது நன்கொடை இயக்கத்தை ஏற்பாடு செய்யவும்',
    },
    'zelaopau': {
      'en': 'Search Blood Donors ',
      'kn': 'ರಕ್ತದಾನಿಗಳನ್ನು ಹುಡುಕಿ',
      'ml': 'രക്തദാതാക്കളെ തിരയുക',
      'ta': 'இரத்த தானம் செய்பவர்களைத் தேடுங்கள்',
    },
    'zz22tivm': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    'zvxsxmef': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    '0lq092mk': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    '4hb1khf8': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'em8x3n1k': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    '0mexf81q': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    '12qenisj': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    'ajfqkzoq': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'dznp3vp6': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
    '1c2w8ur2': {
      'en': 'Edit Proile',
      'kn': 'ಪ್ರೊಫೈಲ್ ಸಂಪಾದಿಸಿ',
      'ml': 'പ്രൊഫൈൽ എഡിറ്റ് ചെയ്യുക',
      'ta': 'ப்ரோயிலைத் திருத்து',
    },
    '5vm8z1d0': {
      'en': 'Language',
      'kn': 'ಭಾಷೆ',
      'ml': 'ഭാഷ',
      'ta': 'மொழி',
    },
    'mp5b4odt': {
      'en': 'Settings',
      'kn': 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು',
      'ml': 'ക്രമീകരണങ്ങൾ',
      'ta': 'அமைப்புகள்',
    },
    'h3pjia5x': {
      'en': 'Logout',
      'kn': 'ಲಾಗ್ಔಟ್',
      'ml': 'പുറത്തുകടക്കുക',
      'ta': 'வெளியேறு',
    },
    '9kf27bgg': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // deleteaccount
  {
    '4gvy1haw': {
      'en': 'Delete Account',
      'kn': 'ಖಾತೆಯನ್ನು ಅಳಿಸಿ',
      'ml': 'അക്കൗണ്ട് ഇല്ലാതാക്കുക',
      'ta': 'கணக்கை நீக்கு',
    },
    'dlyknmea': {
      'en': 'Delete Account',
      'kn': 'ಖಾತೆಯನ್ನು ಅಳಿಸಿ',
      'ml': 'അക്കൗണ്ട് ഇല്ലാതാക്കുക',
      'ta': 'கணக்கை நீக்கு',
    },
    'envq9yvn': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // DonateFormCopy
  {
    '5ft2y2ec': {
      'en': 'Enter Name',
      'kn': 'ಹೆಸರನ್ನು ನಮೂದಿಸಿ',
      'ml': 'പേര് നൽകുക',
      'ta': 'பெயரை உள்ளிடவும்',
    },
    '389lkuvl': {
      'en': 'Full name*',
      'kn': 'ಪೂರ್ಣ ಹೆಸರು*',
      'ml': 'പൂർണ്ണമായ പേര്*',
      'ta': 'முழு பெயர்*',
    },
    'yn5hnim3': {
      'en': 'Blood Group',
      'kn': 'ರಕ್ತದ ಗುಂಪು',
      'ml': 'രക്ത ഗ്രൂപ്പ്',
      'ta': 'இரத்தக் குழு',
    },
    'q8as6l8c': {
      'en': 'blood group*',
      'kn': 'ರಕ್ತದ ಗುಂಪು*',
      'ml': 'രക്ത ഗ്രൂപ്പ്*',
      'ta': 'இரத்த பிரிவு*',
    },
    '13s4sasv': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'ff47uku9': {
      'en': 'Enter Age',
      'kn': 'ವಯಸ್ಸನ್ನು ನಮೂದಿಸಿ',
      'ml': 'പ്രായം നൽകുക',
      'ta': 'வயதை உள்ளிடவும்',
    },
    '6e24ut5h': {
      'en': 'Age',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'dx1zjh7q': {
      'en': 'Age',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '3hgwz3z9': {
      'en': 'Enter Weight',
      'kn': 'ತೂಕವನ್ನು ನಮೂದಿಸಿ',
      'ml': 'ഭാരം നൽകുക',
      'ta': 'எடையை உள்ளிடவும்',
    },
    'id1l5bwm': {
      'en': 'Weight*',
      'kn': 'ತೂಕ*',
      'ml': 'ഭാരം*',
      'ta': 'எடை*',
    },
    'trimyfxj': {
      'en': 'Enter Phone Number',
      'kn': 'ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ',
      'ml': 'ഫോൺ നമ്പർ നൽകുക',
      'ta': 'தொலைபேசி எண்ணை உள்ளிடவும்',
    },
    'rz96fgih': {
      'en': 'Phone number*',
      'kn': 'ದೂರವಾಣಿ ಸಂಖ್ಯೆ*',
      'ml': 'ഫോൺ നമ്പർ*',
      'ta': 'தொலைபேசி எண்*',
    },
    'xgysqjun': {
      'en': 'Enter Date Of Birth',
      'kn': 'ಹುಟ್ಟಿದ ದಿನಾಂಕವನ್ನು ನಮೂದಿಸಿ',
      'ml': 'ജനനത്തീയതി നൽകുക',
      'ta': 'பிறந்த தேதியை உள்ளிடவும்',
    },
    'iv3xewzc': {
      'en': 'dd/mm/yyyy',
      'kn': 'dd/mm/yyyy',
      'ml': 'dd/mm/yyyy',
      'ta': 'dd/mm/yyyy',
    },
    'd248q8rt': {
      'en': 'Gender',
      'kn': 'ಲಿಂಗ',
      'ml': 'ലിംഗഭേദം',
      'ta': 'பாலினம்',
    },
    'qhkn7ke4': {
      'en': 'Female',
      'kn': 'ಹೆಣ್ಣು',
      'ml': 'സ്ത്രീ',
      'ta': 'பெண்',
    },
    '6d02gnuw': {
      'en': 'Male',
      'kn': 'ಪುರುಷ',
      'ml': 'പുരുഷൻ',
      'ta': 'ஆண்',
    },
    '7w3fwn40': {
      'en': 'Other',
      'kn': 'ಇತರೆ',
      'ml': 'മറ്റുള്ളവ',
      'ta': 'மற்றவை',
    },
    '574ikdne': {
      'en': 'Select State',
      'kn': 'ರಾಜ್ಯವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'സംസ്ഥാനം തിരഞ്ഞെടുക്കുക',
      'ta': 'மாநிலத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'bmpdysbd': {
      'en': 'Select one...',
      'kn': 'ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ...',
      'ml': 'ഒന്ന് തിരഞ്ഞെടുക്കുക...',
      'ta': 'ஒன்றைத் தேர்ந்தெடு...',
    },
    'qhc4i3wn': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'uucg2ewr': {
      'en': 'Select District',
      'kn': 'ಜಿಲ್ಲೆ ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'ജില്ല തിരഞ്ഞെടുക്കുക',
      'ta': 'மாவட்டத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'k6nbyjxb': {
      'en': 'Select one...',
      'kn': 'ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ...',
      'ml': 'ഒന്ന് തിരഞ്ഞെടുക്കുക...',
      'ta': 'ஒன்றைத் தேர்ந்தெடு...',
    },
    'nw2tfz8p': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'f5ncppbq': {
      'en': 'Select City',
      'kn': 'ನಗರವನ್ನು ಆಯ್ಕೆಮಾಡಿ',
      'ml': 'നഗരം തിരഞ്ഞെടുക്കുക',
      'ta': 'நகரத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'glnh9pe7': {
      'en': 'Select one...',
      'kn': 'ಒಂದನ್ನು ಆಯ್ಕೆಮಾಡಿ...',
      'ml': 'ഒന്ന് തിരഞ്ഞെടുക്കുക...',
      'ta': 'ஒன்றைத் தேர்ந்தெடு...',
    },
    'dcs84fye': {
      'en': 'Search for an item...',
      'kn': 'ಐಟಂಗಾಗಿ ಹುಡುಕಿ...',
      'ml': 'ഒരു ഇനത്തിനായി തിരയുക...',
      'ta': 'ஒரு பொருளைத் தேடு...',
    },
    'etk6u49i': {
      'en': 'Submit Form',
      'kn': 'ಫಾರ್ಮ್ ಸಲ್ಲಿಸಿ',
      'ml': 'ഫോം സമർപ്പിക്കുക',
      'ta': 'படிவத்தை சமர்ப்பிக்கவும்',
    },
    '5lhhv8hq': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    'ionz04xk': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'qmeese3c': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    'j62h7g2n': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    'e8pmbbyv': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    'rh41mot4': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    '8naxfpfd': {
      'en': 'Field is required',
      'kn': 'ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ',
      'ml': 'ഫീൽഡ് ആവശ്യമാണ്',
      'ta': 'புலம் தேவை',
    },
    '612mc9n5': {
      'en': 'Please choose an option from the dropdown',
      'kn': 'ದಯವಿಟ್ಟು ಡ್ರಾಪ್‌ಡೌನ್‌ನಿಂದ ಆಯ್ಕೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഡ്രോപ്പ്ഡൗണിൽ നിന്ന് ഒരു ഓപ്ഷൻ തിരഞ്ഞെടുക്കുക',
      'ta': 'கீழ்தோன்றலில் இருந்து ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்',
    },
    '66gw3tlz': {
      'en': 'Donation Form',
      'kn': 'ದೇಣಿಗೆ ನಮೂನೆ',
      'ml': 'സംഭാവന ഫോം',
      'ta': 'நன்கொடை படிவம்',
    },
    '2btsvift': {
      'en': 'Please fill out the form below to continue.',
      'kn': 'ಮುಂದುವರಿಸಲು ದಯವಿಟ್ಟು ಕೆಳಗಿನ ಫಾರ್ಮ್ ಅನ್ನು ಭರ್ತಿ ಮಾಡಿ.',
      'ml': 'തുടരാൻ ചുവടെയുള്ള ഫോം പൂരിപ്പിക്കുക.',
      'ta': 'தொடர, கீழே உள்ள படிவத்தை நிரப்பவும்.',
    },
    '7p5skljc': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // otplogin
  {
    'ls2gxljb': {
      'en': 'Login With Phone Number.',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '2m635u5r': {
      'en': 'Enter Your Phone Number',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'aq0e78ji': {
      'en': '+91 ',
      'kn': '+91',
      'ml': '+91',
      'ta': '+91',
    },
    'y76zf970': {
      'en': 'Get OTP',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '3iet3xn4': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // OTPverify
  {
    '0dnlizyo': {
      'en': 'Verification',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '9d604gv5': {
      'en': 'Wrong number?',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'do59w51a': {
      'en': 'Didn\'t received the OTP?',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'wcrqfqog': {
      'en': ' Resend',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'beqtqsyf': {
      'en': 'Verify',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'zatlslwm': {
      'en': 'Verifying OTP',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '900926gb': {
      'en': 'Home',
      'kn': '',
      'ml': '',
      'ta': '',
    },
  },
  // userdetails
  {
    'fjkctsv3': {
      'en': 'Create an account',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '3mlgdmg6': {
      'en': 'Let\'s get started by filling out the form below.',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '6j8bk5j9': {
      'en': 'First Name',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'nlqxh64z': {
      'en': 'Last Name',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'p9srgee2': {
      'en': 'Email',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'l6d0xc5x': {
      'en': 'Create Account',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'zdgfftqy': {
      'en': 'Field is required',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '1hrrjbqn': {
      'en': 'Please choose an option from the dropdown',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'k4ech1px': {
      'en': 'Field is required',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'o9wzfaw4': {
      'en': 'Please choose an option from the dropdown',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'ka4ub2s2': {
      'en': 'Field is required',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'tuai8ayx': {
      'en': 'Please choose an option from the dropdown',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '6wzlcvq2': {
      'en': 'Home',
      'kn': 'ಮನೆ',
      'ml': 'വീട്',
      'ta': 'வீடு',
    },
  },
  // Otppage
  {
    'u3gigqvv': {
      'en': 'Home',
      'kn': '',
      'ml': '',
      'ta': '',
    },
  },
  // LanguageCopy
  {
    '20r34qej': {
      'en': 'Choose Language',
      'kn': 'ಭಾಷೆಯನ್ನು ಆರಿಸಿ',
      'ml': 'ഭാഷ തിരഞ്ഞെടുക്കുക',
      'ta': 'மொழியைத் தேர்ந்தெடுக்கவும்',
    },
    'zuad13av': {
      'en': 'Tamil',
      'kn': 'ತಮಿಳು',
      'ml': 'തമിഴ്',
      'ta': 'தமிழ்',
    },
    '4g0tbnhe': {
      'en': 'English',
      'kn': 'ಇಂಗ್ಲೀಷ್',
      'ml': 'ഇംഗ്ലീഷ്',
      'ta': 'ஆங்கிலம்',
    },
    '1vwtlb3g': {
      'en': 'Kannada',
      'kn': 'ಕನ್ನಡ',
      'ml': 'കന്നഡ',
      'ta': 'கன்னடம்',
    },
    'fzv8enp5': {
      'en': 'Malayalam',
      'kn': 'ಮಲಯಾಳಂ',
      'ml': 'മലയാളം',
      'ta': 'மலையாளம்',
    },
  },
  // changephoto
  {
    'qh2ts0pi': {
      'en': 'Change Photo And Name',
      'kn': 'ಫೋಟೋ ಮತ್ತು ಹೆಸರನ್ನು ಬದಲಾಯಿಸಿ',
      'ml': 'ഫോട്ടോയും പേരും മാറ്റുക',
      'ta': 'புகைப்படம் மற்றும் பெயரை மாற்றவும்',
    },
    '8no6wo7t': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'kn':
          'ಇತರರು ನೋಡಿದ ನಿಮ್ಮ ಅವತಾರವನ್ನು ಬದಲಾಯಿಸಲು ಕೆಳಗೆ ಹೊಸ ಫೋಟೋವನ್ನು ಅಪ್‌ಲೋಡ್ ಮಾಡಿ.',
      'ml':
          'മറ്റുള്ളവർ കാണുന്ന നിങ്ങളുടെ അവതാർ മാറ്റുന്നതിന് ചുവടെ ഒരു പുതിയ ഫോട്ടോ അപ്‌ലോഡ് ചെയ്യുക.',
      'ta':
          'மற்றவர்கள் பார்க்கும் உங்கள் அவதாரத்தை மாற்ற, கீழே ஒரு புதிய புகைப்படத்தைப் பதிவேற்றவும்.',
    },
    'd0439g23': {
      'en': 'edit your name',
      'kn': 'ನಿಮ್ಮ ಹೆಸರನ್ನು ಸಂಪಾದಿಸಿ',
      'ml': 'നിങ്ങളുടെ പേര് എഡിറ്റ് ചെയ്യുക',
      'ta': 'உங்கள் பெயரை திருத்தவும்',
    },
    'ttjnv2if': {
      'en': 'Upload Image',
      'kn': 'ಚಿತ್ರವನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ',
      'ml': 'ചിത്രം അപ്‌ലോഡ് ചെയ്യുക',
      'ta': 'படத்தை பதிவேற்றவும்',
    },
    '8ca2q1lm': {
      'en': 'Save Changes',
      'kn': 'ಬದಲಾವಣೆಗಳನ್ನು ಉಳಿಸಿ',
      'ml': 'മാറ്റങ്ങൾ സംരക്ഷിക്കുക',
      'ta': 'மாற்றங்களைச் சேமிக்கவும்',
    },
  },
  // DarkLightSwitchLarge
  {
    'pvphgge4': {
      'en': 'Light Mode',
      'kn': 'ಲೈಟ್ ಮೋಡ್',
      'ml': 'ലൈറ്റ് മോഡ്',
      'ta': 'ஒளி முறை',
    },
    '4wqv5h69': {
      'en': 'Dark Mode',
      'kn': 'ಡಾರ್ಕ್ ಮೋಡ್',
      'ml': 'ഡാർക്ക് മോഡ്',
      'ta': 'இருண்ட பயன்முறை',
    },
  },
  // AgeError
  {
    '1neyl70d': {
      'en': 'UserName',
      'kn': 'ಬಳಕೆದಾರಹೆಸರು',
      'ml': 'ഉപയോക്തൃനാമം',
      'ta': 'பயனர் பெயர்',
    },
    '82bebii4': {
      'en': 'Overall',
      'kn': 'ಒಟ್ಟಾರೆ',
      'ml': 'മൊത്തത്തിൽ',
      'ta': 'ஒட்டுமொத்த',
    },
    'ccwjv6eb': {
      'en': '5',
      'kn': '5',
      'ml': '5',
      'ta': '5',
    },
    'svwtxc3p': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'kn':
          'ಉತ್ತಮವಾದ ಹೊರಾಂಗಣ ನ್ಯಾಯಾಲಯಗಳು, ಘನ ಕಾಂಕ್ರೀಟ್ ಮತ್ತು ನೆರೆಹೊರೆಗೆ ಉತ್ತಮ ಹೂಪ್ಸ್.',
      'ml':
          'നല്ല ഔട്ട്‌ഡോർ കോർട്ടുകളും സോളിഡ് കോൺക്രീറ്റും അയൽപക്കത്തിന് നല്ല വളയങ്ങളും.',
      'ta':
          'நல்ல வெளிப்புற நீதிமன்றங்கள், திடமான கான்கிரீட் மற்றும் சுற்றுப்புறத்திற்கு நல்ல வளையங்கள்.',
    },
  },
  // reportconform
  {
    'zr55apiz': {
      'en': 'Report The Donar',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'bramxjbx': {
      'en': 'Feedback',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'attnilaw': {
      'en': 'Cancel',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'c6eqxlo0': {
      'en': 'Conform',
      'kn': '',
      'ml': '',
      'ta': '',
    },
  },
  // Miscellaneous
  {
    'o9icn9uh': {
      'en': 'Date of birth*',
      'kn': 'ಹುಟ್ಟಿದ ದಿನಾಂಕ*',
      'ml': 'ജനനത്തീയതി*',
      'ta': 'பிறந்த தேதி*',
    },
    '6upuasnf': {
      'en': 'Allow The Gallery  To Select a Picture ',
      'kn': 'ಚಿತ್ರವನ್ನು ಆಯ್ಕೆ ಮಾಡಲು ಗ್ಯಾಲರಿಗೆ ಅನುಮತಿಸಿ',
      'ml': 'ഒരു ചിത്രം തിരഞ്ഞെടുക്കാൻ ഗാലറിയെ അനുവദിക്കുക',
      'ta': 'ஒரு படத்தைத் தேர்ந்தெடுக்க கேலரியை அனுமதிக்கவும்',
    },
    '3jclwify': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'twegd71o': {
      'en': 'Allow The Camera To Take a Picture ',
      'kn': 'ಚಿತ್ರವನ್ನು ತೆಗೆದುಕೊಳ್ಳಲು ಕ್ಯಾಮರಾವನ್ನು ಅನುಮತಿಸಿ',
      'ml': 'ഒരു ചിത്രമെടുക്കാൻ ക്യാമറയെ അനുവദിക്കുക',
      'ta': 'கேமராவை படம் எடுக்க அனுமதிக்கவும்',
    },
    'isg75nns': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '7huf5i3x': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '5zn4u2gd': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'cy14gwba': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'n14wf99t': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'e59b9z4m': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '1l344io0': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '0ta4trhk': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'tx1zxmiq': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'bp9lvtmt': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '5e0spbcs': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'ovu28vm3': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '2ammlzcu': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '3mi01ecd': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'p8oniv4q': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'te85k3fh': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'apx6bl57': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '36ifjx0v': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'euz6n3sr': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'qjp2jvfy': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'x0i7d8uf': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'k3etcffr': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    '0dlbqcok': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'aj5ifoh8': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
    'k0h8qyeg': {
      'en': '',
      'kn': '',
      'ml': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));
