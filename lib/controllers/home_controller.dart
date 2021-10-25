import 'package:chuck_norris_jokes/models/joke.dart';
import 'package:chuck_norris_jokes/services/chucknorris_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var joke = Rxn<Joke>();
  var isLoading = false.obs;
  bool get hasJoke => joke.value != null;

  final service = Get.put(ChuckNorrisService());

  @override
  void onInit() {
    random();
    super.onInit();
  }

  void random() async {
    isLoading(true);
    joke(await service.random());
    isLoading(false);
  }
}
