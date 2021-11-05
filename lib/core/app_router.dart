import 'package:chuck_norris_jokes/views/categories.dart';
import 'package:chuck_norris_jokes/views/home.dart';
import 'package:chuck_norris_jokes/views/like_detail.dart';
import 'package:chuck_norris_jokes/views/likes.dart';
import 'package:chuck_norris_jokes/views/login.dart';
import 'package:chuck_norris_jokes/views/onboarding.dart';
import 'package:get/get.dart';

class AppRouter {
  static final String home = '/',
      categories = '/categories',
      onboarding = '/onboarding',
      login = '/login',
      likes = '/likes',
      likeDetail = '/like_detail';

  static List<GetPage<dynamic>>? routes = [
    GetPage(name: home, page: () => HomeView(), transition: Transition.zoom),
    GetPage(name: categories, page: () => CategoriesView()),
    GetPage(name: likes, page: () => LikesView()),
    GetPage(name: likeDetail, page: () => LikeDetailView()),
    GetPage(name: onboarding, page: () => OnboardingView()),
    GetPage(name: login, page: () => LoginView(), transition: Transition.zoom),
  ];
}
