import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:chuck_norris_jokes/services/chucknorris_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categories = Rx<List<String>>([]);
  var isLoading = false.obs;
  var selected = ''.obs;
  int get count => categories.value.length;

  final service = Get.find<ChuckNorrisService>();
  final homeCtrl = Get.find<HomeController>();

  @override
  void onInit() {
    if (count == 0) getCategories();
    selected(homeCtrl.selectedCategory.value);
    super.onInit();
  }

  void getCategories() async {
    isLoading(true);
    categories(await service.categories());
    isLoading(false);
  }
}
