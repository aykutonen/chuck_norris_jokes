import 'package:chuck_norris_jokes/core/translations/translation_en.dart';
import 'package:chuck_norris_jokes/core/translations/translation_tr.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': TranslationEN.keys,
        'tr': TranslationTR.keys,
      };
}
