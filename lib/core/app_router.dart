import 'package:chuck_norris_jokes/views/categories.dart';
import 'package:chuck_norris_jokes/views/home.dart';
import 'package:get/get.dart';

class AppRouter {
  static final String home = '/', categories = '/categories';

  static List<GetPage<dynamic>>? routes = [
    GetPage(name: home, page: () => HomeView()),
    GetPage(name: categories, page: () => CategoriesView()),
  ];
}
