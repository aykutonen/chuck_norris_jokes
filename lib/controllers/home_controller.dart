import 'package:chuck_norris_jokes/controllers/category_controller.dart';
import 'package:chuck_norris_jokes/models/joke/joke.dart';
import 'package:chuck_norris_jokes/services/chucknorris_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var joke = Rxn<Joke>();
  var isLoading = false.obs;
  var likes = RxList<Joke>().obs;

  bool get hasJoke => joke.value != null;
  bool get jokeIsLiked =>
      likes.value.any((element) => element.id == joke.value?.id);
  int get likeCount => likes.value.length;

  final service = Get.put(ChuckNorrisService());
  final catCtrl = Get.put(CategoryController());

  @override
  void onInit() {
    likes.value(service.getLikes());
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

  void selectCategory(String cat) {
    catCtrl.selectCategory(cat);
    random();
  }

  void addLike(Joke joke) {
    if (!likes.value.any((element) => element.id == joke.id)) {
      service.addLike(joke);
      likes.value.add(joke);
    }
  }

  void removeLike(String id) {
    service.removeLike(id);
    likes.value.removeWhere((element) => element.id == id);
  }
}
