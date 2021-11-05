import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:chuck_norris_jokes/models/joke/joke.dart';
import 'package:get/get.dart';

class LikesController extends GetxController {
  late var joke = Rxn<Joke>();

  final homeCtrl = Get.find<HomeController>();

  @override
  void onInit() {
    joke.value = homeCtrl.likes.value.firstWhere((e) => e.id == Get.arguments);
    super.onInit();
  }

  bool get hasLiked => homeCtrl.likes.value.any((e) => e.id == joke.value!.id);

  void likeUnlike() {
    if (hasLiked)
      homeCtrl.removeLike(joke.value!.id);
    else
      homeCtrl.addLike(joke.value!);
  }
}
