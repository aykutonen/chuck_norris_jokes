import 'package:chuck_norris_jokes/controllers/dashboard_controller.dart';
import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:chuck_norris_jokes/services/chucknorris_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categories = Rx<List<String>>([]);
  var isLoading = false.obs;
  var selected = ''.obs;
  int get count => categories.value.length;

  final service = Get.find<ChuckNorrisService>();

  @override
  void onInit() {
    if (count == 0) getCategories();
    selected(service.getSelectedCategory());
    super.onInit();
  }

  void getCategories() async {
    isLoading(true);
    categories(await service.categories());
    isLoading(false);
  }

  void selectCategory(String cat) {
    selected(cat);
    service.selectCategory(cat);
    Get.find<HomeController>().random();
    Get.find<DashboardController>().changePage(0);
  }
}
