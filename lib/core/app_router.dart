import 'package:chuck_norris_jokes/views/categories.dart';
import 'package:chuck_norris_jokes/views/home.dart';
import 'package:chuck_norris_jokes/views/onboarding.dart';
import 'package:get/get.dart';

class AppRouter {
  static final String home = '/',
      categories = '/categories',
      onboarding = '/onboarding';

  static List<GetPage<dynamic>>? routes = [
    GetPage(name: home, page: () => HomeView(), transition: Transition.zoom),
    GetPage(name: categories, page: () => CategoriesView()),
    GetPage(name: onboarding, page: () => OnboardingView()),
  ];
}
