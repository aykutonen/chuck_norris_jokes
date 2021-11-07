import 'package:chuck_norris_jokes/core/app_router.dart';
import 'package:chuck_norris_jokes/models/joke/joke.dart';
import 'package:chuck_norris_jokes/services/chucknorris_service.dart';
import 'package:get/get.dart';

class LikesController extends GetxController {
  var joke = Rxn<Joke>();
  var likes = RxList<Joke>().obs;

  final service = Get.find<ChuckNorrisService>();

  @override
  void onInit() {
    likes.value(service.getLikes());
    // joke.value = likes.value.firstWhere((e) => e.id == Get.arguments);
    super.onInit();
  }

  openDetail(String id) {
    joke(likes.value.firstWhere((e) => e.id == id));
    Get.toNamed(AppRouter.likeDetail);
  }

  int get likeCount => likes.value.length;

  bool jokeIsLiked(String id) => likes.value.any((e) => e.id == id);

  void likeUnlike() {
    if (jokeIsLiked(joke.value!.id))
      removeLike(joke.value!.id);
    else
      addLike(joke.value!);
  }

  void addLike(Joke joke) {
    if (!likes.value.any((e) => e.id == joke.id)) {
      service.addLike(joke);
      likes.value.add(joke);
    }
  }

  void removeLike(String id) {
    service.removeLike(id);
    likes.value.removeWhere((e) => e.id == id);
  }
}
