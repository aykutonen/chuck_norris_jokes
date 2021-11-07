import 'package:chuck_norris_jokes/controllers/category_controller.dart';
import 'package:chuck_norris_jokes/models/joke/joke.dart';
import 'package:chuck_norris_jokes/services/chucknorris_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var joke = Rxn<Joke>();
  var isLoading = false.obs;

  bool get hasJoke => joke.value != null;

  final service = Get.put(ChuckNorrisService());
  final catCtrl = Get.put(CategoryController());

  @override
  void onInit() {
    random();
    super.onInit();
  }

  void random() async {
    isLoading(true);
    if (catCtrl.selected.isNotEmpty)
      joke(await service.randomByCategory(catCtrl.selected.value));
    else
      joke(await service.random());
    await Future.delayed(0.5.seconds);
    isLoading(false);
  }
}
