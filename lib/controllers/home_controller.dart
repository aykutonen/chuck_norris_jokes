import 'package:chuck_norris_jokes/models/joke/joke.dart';
import 'package:chuck_norris_jokes/services/chucknorris_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var joke = Rxn<Joke>();
  var isLoading = false.obs;
  var selectedCategory = "".obs;
  bool get hasJoke => joke.value != null;

  final service = Get.put(ChuckNorrisService());
  final box = GetStorage();

  @override
  void onInit() {
    random();
    super.onInit();
  }

  void random() async {
    isLoading(true);
    if (selectedCategory.isNotEmpty)
      joke(await service.randomByCategory(selectedCategory.value));
    else
      joke(await service.random());
    isLoading(false);
  }

  void selectCategory(String cat) {
    selectedCategory(cat);
    random();
  }
}
