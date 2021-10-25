import 'package:chuck_norris_jokes/services/chucknorris_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categories = Rx<List<String>>([]);
  var isLoading = false.obs;
  int get count => categories.value.length;

  final service = Get.find<ChuckNorrisService>();

  @override
  void onInit() {
    if (count == 0) getCategories();
    super.onInit();
  }

  void getCategories() async {
    print("getting categories...");
    isLoading(true);
    categories(await service.categories());
    isLoading(false);
  }
}
