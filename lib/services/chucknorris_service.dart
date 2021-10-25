import 'package:chuck_norris_jokes/models/joke.dart';
import 'package:chuck_norris_jokes/providers/chucknorris_provider.dart';
import 'package:get/get.dart';

class ChuckNorrisService {
  final _provider = Get.put(ChuckNorrisProvider());

  Future<Joke?> random() async {
    Joke? result;
    var response = await _provider.random();
    if (response.isOk) {
      return result = Joke.fromJson(response.body);
    }
    return result;
  }
}
