import 'package:chuck_norris_jokes/models/joke/joke.dart';
import 'package:chuck_norris_jokes/services/chucknorris_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var joke = Rxn<Joke>();
  var isLoading = false.obs;
  var selectedCategory = "".obs;
  var likes = RxList<Joke>().obs;

  bool get hasJoke => joke.value != null;
  bool get jokeIsLiked =>
      likes.value.any((element) => element.id == joke.value?.id);
  int get likeCount => likes.value.length;

  final service = Get.put(ChuckNorrisService());

  @override
  void onInit() {
    selectedCategory(service.getSelectedCategory());
    likes.value(service.getLikes());
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
    service.selectCategory(cat);
    selectedCategory(cat);
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
