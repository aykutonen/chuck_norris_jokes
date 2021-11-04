import 'package:get_storage/get_storage.dart';

class AppService {
  final box = GetStorage();

  void saveHasShowOnboarding(bool val) {
    box.write('show_onboarding', val);
  }

  bool getHasShowOnboarding() => box.read<bool?>('show_onboarding') ?? false;
}
